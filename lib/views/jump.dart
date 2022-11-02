import 'package:flutter/material.dart';

class JumpView extends StatefulWidget {
  const JumpView({Key? key}) : super(key: key);

  @override
  State<JumpView> createState() => _JumpViewState();
}

class _JumpViewState extends State<JumpView> {
  double _x = 0.0;
  double _y = 0.0;
  double _translation = 25.0;
  Curve _curve = Curves.easeOutExpo;

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
        title: const Text('Jumping Jack'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 1, child: Container()),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      bottom: _y,
                      left: _x,
                      duration: const Duration(milliseconds: 100),
                      curve: _curve,
                      child: const Icon(Icons.directions_walk, size: 50,),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () async {
                  await _jump();
                },
                child: const Text("Jump"),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          )
      ),
    );
  }

  _jump() async {
    double maxWidth = MediaQuery.of(context).size.width;
    if (_x + 75 > maxWidth) {
      _translation = -25;
    } else if (_x - 25 < 0) {
      _translation = 25;
    }

    _curve = Curves.easeOutQuad;
    setState(() {
      _y += 50;
      _x += _translation;
    });
    await Future.delayed(const Duration(milliseconds: 100), (){});
    _curve = Curves.easeInQuad;
    setState(() {
      _y -= 50;
      _x += _translation;
    });
  }
}
