import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:food_blueprint/src/utils/image_loader.dart';

class ImageWithFallback extends StatefulWidget {
  final String? icon;
  final String fallback;
  final double height;
  final double width;

  const ImageWithFallback(
      {super.key,
      required this.fallback,
      this.icon,
      required this.height,
      required this.width});

  @override
  State<StatefulWidget> createState() => _ImageWithFallback();
}

class _ImageWithFallback extends State<ImageWithFallback> {
  NetworkImage? _image;

  @override
  void initState() {
    super.initState();
    developer.log(widget.fallback);
    _image = NetworkImage(
        ImageUrlLoader.getServedImageUrl(widget.icon, widget.fallback));
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
                    _image = NetworkImage(widget.fallback);
                  });
                  developer.log(error.toString());
                },
                image: _image!)));
  }
}
