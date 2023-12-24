import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> base64Endcode(String data) async {
  ByteData bytes = await rootBundle.load(data);
  var buffer = bytes.buffer;
  var m = base64.encode(Uint8List.view(buffer));
  return m;
}