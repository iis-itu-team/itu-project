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

  @override
  void initState() {
    super.initState();

    int nowParam = DateTime.now().millisecond;
    String iconUrl =
        ImageUrlLoader.getServedImageUrl(widget.icon, widget.fallback);
    String url = '$iconUrl#$nowParam';
    _image = NetworkImage(url);
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
                },
                image: _image!)));
  }
}
