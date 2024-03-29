/// Copyright (C) -> see copyright_notice.txt in root dir
///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 16. 12. 2023
///
import 'package:flutter/cupertino.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';

/// Displays an icon, fallback if anything bad happens or icon is null.
class ImageWithFallback extends StatefulWidget {
  final String? icon;
  final String fallback;
  final double height;
  final double width;

  const ImageWithFallback(
      {super.key,
      required this.fallback,
      required this.icon,
      required this.height,
      required this.width});

  @override
  State<StatefulWidget> createState() => _ImageWithFallback();
}

class _ImageWithFallback extends State<ImageWithFallback> {
  NetworkImage? _image;

  String appendTimeToUrl(String url) {
    int nowParam = DateTime.now().millisecond;
    return '$url#$nowParam';
  }

  @override
  void initState() {
    super.initState();

    String iconUrl = appendTimeToUrl(
        ImageUrlLoader.getServedImageUrl(widget.icon, widget.fallback));
    _image = NetworkImage(iconUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                onError: (error, stack) {
                  setState(() {
                    _image = NetworkImage(appendTimeToUrl(widget.fallback));
                  });
                },
                image: _image!)));
  }
}
