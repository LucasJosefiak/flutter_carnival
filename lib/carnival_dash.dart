import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: "default", type: CarnivalDash)
Widget greenContainerUseCase(BuildContext context) {
  return const CarnivalDash();
}

class CarnivalDash extends StatefulWidget {
  const CarnivalDash({super.key});

  @override
  State<CarnivalDash> createState() => _CarnivalDashState();
}

class _CarnivalDashState extends State<CarnivalDash>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final ConfettiController confettiController;

  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 1.1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceInOut),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConfettiWidget(
          confettiController: confettiController,
          blastDirectionality: BlastDirectionality
              .explosive, // Change to BlastDirectionality.directional for directional confetti
          shouldLoop: false, // Set to true to loop the animation
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple,
          ], // Define your own colors
        ),
        GestureDetector(
          child: ScaleTransition(
              scale: scaleAnimation, child: Image.asset('assets/dash.png')),
          onTap: () {
            animationController.forward().then(
                  (_) => animationController.reverse(),
                );
            confettiController.play();
          },
        ),
      ],
    );
  }
}
