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
