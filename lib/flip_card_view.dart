import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardView extends StatefulWidget {
  const FlipCardView({Key? key}) : super(key: key);

  @override
  _FlipCardViewState createState() => _FlipCardViewState();
}

class _FlipCardViewState extends State<FlipCardView>
    with SingleTickerProviderStateMixin {
  late AnimationController _flipAnimationController;
  late Animation _flipAnimation;

  // ignore: prefer_final_fields
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    _flipAnimationController = AnimationController(
        // animate 0 to 1 over duration specified
        duration: const Duration(milliseconds: 800),
        vsync: this);

    _flipAnimation =
        Tween<double>(begin: 1, end: 0).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            _animationStatus = status;
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Flip Card Animation"),
      ),
      body: ClipPath(
                clipper: TriangleClipPath(),
                child: const FlipCardWidget(
                  num: 0,
                ),
              )
      
      // Transform(
      //   alignment: FractionalOffset.bottomCenter,
      //   transform: Matrix4.identity()
      //     ..setEntry(3, 2, 0.002)
      //     ..rotateX(pi * _flipAnimation.value),
      //   child: GestureDetector(
      //     onTap: () {
      //       if (_animationStatus == AnimationStatus.dismissed) {
      //         _flipAnimationController.forward();
      //       } else {
      //         _flipAnimationController.reverse();
      //       }
      //     },
      //     child: ClipPath(
      //       clipper: TriangleClipPath(),
      //       child: const FlipCardWidget(
      //         num: 0,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class TriangleClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, 30);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstPoint = Offset((size.width/2) - 20, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    // var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    // var secondPoint = Offset(size.width, size.height - 30);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondPoint.dx, secondPoint.dy);
    
    path.lineTo((size.width/2) + 40, size.height - 20);
    path.lineTo(size.width, 30);
    path.lineTo(size.width, 0);

    //----------
    // path.lineTo(0.0, size.height - 30);
    // var firstControlPoint = Offset(size.width / 4, size.height);
    // var firstPoint = Offset(size.width / 2, size.height);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstPoint.dx, firstPoint.dy);
    // var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    // var secondPoint = Offset(size.width, size.height - 30);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondPoint.dx, secondPoint.dy);

    // path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FlipCardWidget extends StatelessWidget {
  final int num;
  const FlipCardWidget({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color color = Colors.primaries[num % Colors.primaries.length];

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(25),
      height: 200,
      decoration: BoxDecoration(
        // color: Colors.black,
        color: () {
          if (num == 0) {
            return Colors.red;
          } else if (num == 1) {
            return Colors.blue;
          } else if (num == 2) {
            return Colors.blueAccent;
          } else if (num == 3) {
            return Colors.cyanAccent;
          }
        }(),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.3),
        //     blurRadius: 30,
        //     offset: const Offset(0, 4), // Shadow position
        //   ),
        // ],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
