import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorForm extends StatefulWidget {
  const MentorForm({Key? key}) : super(key: key);

  @override
  State<MentorForm> createState() => _MentorFormState();
}

class _MentorFormState extends State<MentorForm> {

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  InAppWebViewController? controller;

    @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }


@override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: mentorolappbar(context),
        body: Column(
          children: [
            Container(
              child: progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
            ),
            Expanded(
                child: Container(
              // decoration: BoxDecoration(color: Colors.red),
              child: InAppWebView(
                          key: webViewKey,
                          initialUrlRequest:
                          URLRequest(url: Uri.parse("https://docs.google.com/forms/d/e/1FAIpQLSc5Es2Ag09jV1uXHJCXJOSR9yJQILCzrO82hWrEwKXDXwMyoQ/viewform?usp=sf_link")),
                          initialOptions: options,
                          pullToRefreshController: pullToRefreshController,
                          onWebViewCreated: (controller) {
                            webViewController = controller;
                          },
                          onLoadStart: (controller, url) {
                            setState(() {
                              this.url = url.toString();
                              urlController.text = this.url;
                            });
                          },
                          androidOnPermissionRequest: (controller, origin, resources) async {
                            return PermissionRequestResponse(
                                resources: resources,
                                action: PermissionRequestResponseAction.GRANT);
                          },
                          shouldOverrideUrlLoading: (controller, navigationAction) async {
                            var uri = navigationAction.request.url!;
    
                            if (![ "http", "https", "file", "chrome",
                              "data", "javascript", "about"].contains(uri.scheme)) {
                              if (await canLaunch(url)) {
                                // Launch the App
                                await launch(
                                  url,
                                );
                                // and cancel the request
                                return NavigationActionPolicy.CANCEL;
                              }
                            }
    
                            return NavigationActionPolicy.ALLOW;
                          },
                          onLoadStop: (controller, url) async {
                            pullToRefreshController.endRefreshing();
                            setState(() {
                              this.url = url.toString();
                              urlController.text = this.url;
                            });
                          },
                          onLoadError: (controller, url, code, message) {
                            pullToRefreshController.endRefreshing();
                          },
                          onProgressChanged: (controller, progress) {
                            if (progress == 100) {
                              pullToRefreshController.endRefreshing();
                            }
                            setState(() {
                              this.progress = progress / 100;
                              urlController.text = this.url;
                            });
                          },
                          onUpdateVisitedHistory: (controller, url, androidIsReload) {
                            setState(() {
                              this.url = url.toString();
                              urlController.text = this.url;
                            });
                          },
                          onConsoleMessage: (controller, consoleMessage) {
                            print(consoleMessage);
                          },
                        ),
              
            )),
          ],
        ),
      ),
    );
  }
}
