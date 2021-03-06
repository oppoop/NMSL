import 'dart:io';
import 'package:NMSL/utils/app_libs.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewerLocal extends StatefulWidget {
  final String imaglocal;
  const ImageViewerLocal({
    Key? key,
    required this.imaglocal,
  }) : super(key: key);
  @override
  _ImageViewerLocalState createState() => _ImageViewerLocalState();
}

class _ImageViewerLocalState extends State<ImageViewerLocal> {
  final CarouselController buttonCarouselController = CarouselController();
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * 0.25,
                padding: EdgeInsets.only(
                  left: 30,
                ),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppLibScreen.appIcon(
                      icon: Icons.close,
                      iconColor: Colors.white,
                      iconSize: "large",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onScaleUpdate: (ScaleUpdateDetails details) {
                  setState(
                        () {
                      _width = 200 * details.scale.clamp(.8, 10.0);
                    },
                  );
                },
                child: ImageContent(imglocal: widget.imaglocal,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContent extends StatelessWidget {
  final String imglocal;

  ImageContent({Key? key, required this.imglocal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width * 0.1,
        ),
        child: PhotoView(
          initialScale: PhotoViewComputedScale.contained * 1,
          minScale: PhotoViewComputedScale.contained * 1,
          imageProvider:Image.file(File(imglocal)).image
        ),
      ),
    );
  }
}
