import 'dart:io';
import 'package:NMSL/utils/imageViwerLocal.dart';
import 'package:flutter/material.dart';
import 'imageViwerOnline.dart';

class popWidget {
  static Future<void> imageViewerDialog({
    required BuildContext context,
    required String path,
  }) {
    print(path);
    return showDialog(
      context: context,
      builder: (context) => ImageViewerOnline(imagePath: path,),
    );
  }

  static Future<void> imageFileDialog({
    required BuildContext context,
    required String img,
  }) {
    print(img);
    return showDialog(
      context: context,
      builder: (context) => ImageViewerLocal(imaglocal: img,),
    );
  }

}