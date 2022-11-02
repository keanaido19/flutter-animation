import 'package:flutter/material.dart';

class SpinView extends StatefulWidget {
  const SpinView({Key? key}) : super(key: key);

  @override
  State<SpinView> createState() => _SpinViewState();
}

class _SpinViewState extends State<SpinView> with TickerProviderStateMixin {
  bool _isSpinning = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false)..stop();

  late final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        title: const Text('Spin Spin Spin'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RotationTransition(
                  turns: _animation,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/wethinkcode-logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_isSpinning) {
                      _isSpinning = false;
                      _controller.stop();
                    } else {
                      _isSpinning = true;
                      _controller.repeat();
                    }
                  });
                },
                child: Text(_isSpinning ? 'stop' : 'spin'),
              )
            ],
          )
      ),
    );
  }
}
