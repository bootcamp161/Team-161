import 'package:flutter/material.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';
import 'package:mentorwiseasil/utilities/lists.dart';

import '../widgets/get_mentor_data.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.of(context).pop();
                },
                icon: backButton()),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                SizedBox(width: 60, height: 50, child: GetMentorImage(documentId: mentorIDs[widget.index])),
                SizedBox(
                  width: 20,
                ),
                GetMentorName(documentId: mentorIDs[widget.index]),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 45, height: 45, child: GetMentorImage(documentId: mentorIDs[widget.index])),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                            child: Wrap(children: [
                              Text(
                                'Merhaba, ismim ',
                                style: baslikStyle.copyWith(fontSize: 20),
                              ),
                              GetMentorProfileName(documentId: mentorIDs[widget.index]),
                              Text(
                                'öncelikle uygulamamızın ilk kullanıcılarından biri olduğunuz için teşekkür ederim.',
                                style: baslikStyle.copyWith(fontSize: 20),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 45, height: 45, child: GetMentorImage(documentId: mentorIDs[widget.index])),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
                            child: Wrap(children: [
                              Text(
                                'Uygulama henüz test aşamasında olduğu için mentorluk seanslarımız sırasında teknik bir aksaklık yaşamamak adına kısa bir süreliğine farklı bir platformdan iletişim kurabiliriz sizinle iletişim bilgilerimi paylaşıyorum dilediğiniz zaman ulaşabilirsiniz.',
                                style: baslikStyle.copyWith(fontSize: 20),
                              ),
                              Text(
                                'Mail adresim:',
                                style: baslikStyle.copyWith(fontSize: 20),
                              ),
                              GetMentorContact(documentId: mentorIDs[widget.index]),
                              Text('Telefon numaram: ', style: baslikStyle.copyWith(fontSize: 20)),
                              Text(widget.index.isEven ? '+905522294869' : '+905539237749', style: baslikStyleBold.copyWith(fontSize: 20))
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffD9D9D9),
                  ),
                  width: double.infinity,
                  child: TextFormField(

                     enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.send),
                      prefixIcon: Icon(Icons.emoji_emotions_outlined),
                      hintStyle: baslikStyle.copyWith(fontSize: 15),
                      hintText: 'Anlayışınız için teşekkürler',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
