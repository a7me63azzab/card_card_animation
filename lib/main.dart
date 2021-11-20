import 'dart:math';

import 'package:card_animation/flip_card_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Random random = Random();

  late AnimationController firstController;
  late Animation firstAnimation;
  late AnimationController secondController;
  late Animation secondAnimation;
  late AnimationController thirdController;
  late Animation thirdAnimation;

  late AnimationController firstScaleController;
  late Animation firstScaleAnimation;
  late AnimationController secondScaleController;
  late Animation secondScaleAnimation;
  late AnimationController thirdScaleController;
  late Animation thirdScaleAnimation;

  @override
  void initState() {
    firstController = AnimationController(
        // animate 0 to 1 over duration specified
        duration: const Duration(milliseconds: 800),
        vsync: this);

    firstAnimation = Tween<double>(begin: 20, end: 210).animate(firstController)
      ..addListener(() {
        setState(() {});
      });
    secondController = AnimationController(
        // animate 0 to 1 over duration specified
        duration: const Duration(milliseconds: 800),
        vsync: this);

    secondAnimation =
        Tween<double>(begin: 40, end: 430).animate(secondController)
          ..addListener(() {
            setState(() {});
          });

    thirdController = AnimationController(
        // animate 0 to 1 over duration specified
        duration: const Duration(milliseconds: 800),
        vsync: this);

    thirdAnimation = Tween<double>(begin: 60, end: 650).animate(thirdController)
      ..addListener(() {
        setState(() {});
      });

    //=----------------------------=-=//
    firstScaleController = AnimationController(
        // animate 0 to 1 over duration specified
        duration: const Duration(milliseconds: 800),
        vsync: this);

    firstScaleAnimation =
        Tween<double>(begin: 0.859, end: 1).animate(firstScaleController)
          ..addListener(() {
            setState(() {});
          });
    secondScaleController = AnimationController(
        // animate 0 to 1 over duration specified
        duration: const Duration(milliseconds: 800),
        vsync: this);

    secondScaleAnimation =
        Tween<double>(begin: 0.889, end: 1).animate(secondScaleController)
          ..addListener(() {
            setState(() {});
          });

    thirdScaleController = AnimationController(
        // animate 0 to 1 over duration specified
        duration: const Duration(milliseconds: 800),
        vsync: this);

    thirdScaleAnimation =
        Tween<double>(begin: 0.95, end: 1).animate(thirdScaleController)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Card Animation"),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(PageRouteBuilder(pageBuilder: (_, __, ___) {
                return const FlipCardView();
              }));
            },
            icon: const Icon(Icons.forward),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  thirdController.forward();
                  secondController.forward();
                  firstController.forward();
                  firstScaleController.forward();
                  secondScaleController.forward();
                  thirdScaleController.forward();
                },
                icon: const Icon(Icons.done)),
            IconButton(
                onPressed: () {
                  thirdController.reverse();
                  secondController.reverse();
                  firstController.reverse();

                  firstScaleController.reverse();
                  secondScaleController.reverse();
                  thirdScaleController.reverse();
                },
                icon: const Icon(Icons.close)),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, bottom: 100),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4(
                    firstScaleAnimation.value,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0.002,
                    0,
                    0,
                    0,
                    1,
                  )
                    // ..translate(1,0,0)
                    // ..rotateX(x)
                    // ..rotateY(y)
                    // ..rotateZ(z)

                    ..setEntry(3, 2, 0.001),
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails details) {
                      setState(() {
                        // y = y - details.delta.dx / 100;
                        // x = x + details.delta.dy / 100;
                        // // z = z + details.delta.dx / 100;
                      });
                    },
                    child: const CardWidget(
                      num: 0,
                    ),
                  ),
                ),
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4(
                    secondScaleAnimation.value,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0.002,
                    0,
                    firstAnimation.value,
                    0,
                    1,
                  )

                    // ..rotateX(x)
                    // ..rotateY(y)
                    // ..rotateZ(z)
                    ..setEntry(3, 2, 0.001),
                  child: GestureDetector(
                    onTap: () {
                      // firstController.forward();
                    },
                    // onPanUpdate: (DragUpdateDetails details) {
                    //   setState(() {
                    //     // y = y - details.delta.dx / 100;
                    //     // x = x + details.delta.dy / 100;
                    //     // z = z + details.delta.dx / 100;
                    //   });
                    // },
                    child: const CardWidget(
                      num: 1,
                    ),
                  ),
                ),
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4(
                    thirdScaleAnimation.value,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0.002,
                    0,
                    secondAnimation.value,
                    0,
                    1,
                  )

                    // ..rotateX(x)
                    // ..rotateY(y)
                    // ..rotateZ(z)
                    ..setEntry(3, 2, 0.001),
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails details) {
                      setState(() {
                        // y = y - details.delta.dx / 100;
                        // x = x + details.delta.dy / 100;
                        // z = z + details.delta.dx / 100;
                      });
                    },
                    child: const CardWidget(
                      num: 2,
                    ),
                  ),
                ),
                Transform(
                  alignment: FractionalOffset.center,
                  transform: Matrix4(
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0.002,
                    0,
                    thirdAnimation.value,
                    0,
                    1,
                  )

                    // ..rotateX(x)
                    // ..rotateY(y)
                    // ..rotateZ(z)
                    ..setEntry(3, 2, 0.001),
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails details) {
                      setState(() {
                        // y = y - details.delta.dx / 100;
                        // x = x + details.delta.dy / 100;
                        // z = z + details.delta.dx / 100;
                      });
                    },
                    child: const CardWidget(
                      num: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        // body: Stack(
        //   overflow: Overflow.visible,
        //   children: [
        //     Positioned(
        //       top: 0,
        //       left: 10,
        //       right: 10,
        //       child: CardWidget(
        //         num: random.nextInt(100),
        //       ),
        //     ),
        //     Positioned(
        //       top: 30,
        //       left: 10,
        //       right: 10,
        //       child: CardWidget(
        //         num: random.nextInt(100),
        //       ),
        //     ),
        //     Positioned(
        //       top: 60,
        //       left: 10,
        //       right: 10,
        //       child: CardWidget(
        //         num: random.nextInt(100),
        //       ),
        //     ),
        //     Positioned(
        //       top: 90,
        //       left: 10,
        //       right: 10,
        //       child: CardWidget(
        //         num: random.nextInt(100),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}

class CardWidget extends StatelessWidget {
  final int num;
  const CardWidget({Key? key, required this.num}) : super(key: key);

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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
