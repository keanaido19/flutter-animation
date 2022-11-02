import 'package:flutter/material.dart';

class ZoomView extends StatefulWidget {
  const ZoomView({Key? key}) : super(key: key);

  @override
  State<ZoomView> createState() => _ZoomViewState();
}

class _ZoomViewState extends State<ZoomView> {
  bool _isZoomed = false;
  double _width = 120.0;
  double _height = 120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Make me Move'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/images/wethinkcode-logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
            const SizedBox(height: 30.0),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (_isZoomed) {
                      _isZoomed = false;
                      _width /= 2;
                      _height /= 2;
                    } else {
                      _isZoomed = true;
                      _width *= 2;
                      _height *= 2;
                    }
                  });
                },
                icon: const Icon(Icons.zoom_in, size: 30.0,),
            )
          ],
        )
      ),
    );
  }
}
