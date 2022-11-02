import 'package:flutter/material.dart';
import 'package:funky_app/views/jump.dart';
import 'package:funky_app/views/spin.dart';
import 'package:funky_app/views/zoom.dart';
import 'dart:math';

class FunkyHomeView extends StatefulWidget {
  const FunkyHomeView({super.key, required this.title});

  final String title;

  @override
  State<FunkyHomeView> createState() => _FunkyHomeViewState();
}

class _FunkyHomeViewState extends State<FunkyHomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            buildButton(context, "Zoom", _openZoomView),
            const SizedBox(height: 30,),
            buildButton(context, "Spin", _openSpinView),
            const SizedBox(height: 30,),
            buildButton(context, "Jump", _openJumpView),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  _openZoomView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return const ZoomView();
          }
      )
    );
  }

  _openSpinView(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return const SpinView();
            }
        )
    );
  }

  _openJumpView(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return const JumpView();
            }
        )
    );
  }
}

Widget buildButton(
    BuildContext context,
    String label,
    void Function(BuildContext context) navigateFunction
    ) {
  final random = Random();
  return ClipRRect(
    borderRadius: BorderRadius.circular(4),
    child: Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                      1.0
                  ),
                  Color.fromRGBO(
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                      1.0
                  ),
                  Color.fromRGBO(
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                      1.0
                  ),
                ],
              ),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size(100, 16),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {navigateFunction(context);},
          child: Text(label),
        ),
      ],
    ),
  );
}
