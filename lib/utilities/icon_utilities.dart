import 'package:flutter/material.dart';

Icon backButton() {
  return const Icon(
    Icons.chevron_left,
    color: Colors.black,
  );
}

Icon iconVisibOn() => Icon(Icons.visibility, color: Colors.grey[600]);

Icon iconVisibOff() => Icon(Icons.visibility_off, color: Colors.grey[600]);

Icon iconClear() {
  return Icon(
    Icons.clear,
    color: Colors.grey[600],
  );
}
