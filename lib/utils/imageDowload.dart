import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';
import 'dart:typed_data';
import 'package:image_downloader/image_downloader.dart';
import 'package:flutter/services.dart';

Future<void> save({required String url}) async {
  var response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes));
  final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      name: "妲妲");
  print(result);
}

Future<void> save2({required String url}) async{
  try {
    var imageId = await ImageDownloader.downloadImage(url);
    if (imageId == null) {
      return;
    }

    var fileName = await ImageDownloader.findName(imageId);
    var path = await ImageDownloader.findPath(imageId);
    var size = await ImageDownloader.findByteSize(imageId);
    var mimeType = await ImageDownloader.findMimeType(imageId);
  } on PlatformException catch (error) {
    print(error);
  }
}


