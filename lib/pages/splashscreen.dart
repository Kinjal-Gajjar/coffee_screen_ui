
import 'package:coffee_screen/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscrren extends StatefulWidget {
  const Splashscrren({Key? key}) : super(key: key);

  @override
  State<Splashscrren> createState() => _SplashscrrenState();
}

class _SplashscrrenState extends State<Splashscrren>
    with TickerProviderStateMixin {
  bool copAnimated = false;
  bool animateCafeText = false;
  late AnimationController _coffeeController;
  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cafeBrown,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(copAnimated ? 40.0 : 0.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                    visible: !copAnimated,
                    child: Lottie.asset('assets/coffee-love.json',
                        onLoaded: (composition) {
                      _coffeeController
                        ..duration = composition.duration
                        ..forward();
                    })),
                Visibility(
                    visible: copAnimated,
                    child: Image.asset(
                      'assets/coffeepic2.png',
                      height: 190.0,
                      width: 190.0,
                    )),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCafeText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      'C A F É',
                      style: TextStyle(fontSize: 50.0, color: cafeBrown),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const BottomPart()),
        ],
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Find The Best Coffee for You',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Lorem ipsum dolor sit amet, adipiscing elit. '
              'Nullam pulvinar dolor sed enim eleifend efficitur.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
