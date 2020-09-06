import 'package:flutter/material.dart';
import 'package:tyba_test_project/common/color_palette.dart';

class ImageLoader extends StatefulWidget {
  final String imageURL;
  final ImageProvider placeholder;
  final double width;
  final double height;

  ImageLoader(
      {@required this.placeholder, this.width, this.height = 0, this.imageURL});

  @override
  _ImageLoaderState createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  NetworkImage _networkImage;
  bool _coverMounted = false;
  bool _loadDefaultOnError = false;

  @override
  void initState() {
    super.initState();
    _networkImage = NetworkImage(widget.imageURL);
    _networkImage
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((image, synchronousCall) {
          if (mounted) {
            setState(() {
              _coverMounted = true;
              _loadDefaultOnError = false;
            });
          }
        }, onError: (exception, stackTrace) {
          setState(() {
            _coverMounted = true;
            _loadDefaultOnError = true;
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      foregroundDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: _loadDefaultOnError ? 1.0 : 0.1,
            child: widget.height != 0
                ? SizedBox(
                    width: widget.width,
                    height: widget.height ?? widget.width,
                    child: Image(image: widget.placeholder, fit: BoxFit.cover),
                  )
                : Image(image: widget.placeholder, fit: BoxFit.cover),
          ),
          if (!_coverMounted) ...[
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.Primary),
              ),
            ),
          ],
          if (_networkImage != null) ...[
            AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: _coverMounted ? 1.0 : 0.0,
                child: Image(
                  image: _networkImage,
                  fit: BoxFit.cover,
                  width: widget.width,
                )),
          ]
        ],
      ),
    );
  }
}
