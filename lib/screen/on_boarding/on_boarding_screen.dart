import 'package:flutter/material.dart';
import 'package:io_app/component/io_gap.dart';
import 'package:io_app/theme/io_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool isImageBig = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: 200,
      end: 300,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _animateImage() {
    if (isImageBig) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    isImageBig = !isImageBig;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                color: IOColors.primary500,
                child: Column(
                  children: [
                    Spacer(),
                    Center(
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return SizedBox(
                            width: _animation.value,
                            height: _animation.value,
                            child: child,
                          );
                        },
                        child: const Image(
                          image: AssetImage('assets/images/logo_1.png'),
                        ),
                      ),
                    ),
                    Text(
                      "WE ARE ONE WORLD",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IoGap(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        "Create a team and participate in the tournament",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
              Container(color: IOColors.primary400),
              Container(color: IOColors.success300),
            ],
          ),

          // Dot indicators
            Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
              dotHeight: 4,
              dotWidth: 20,
              dotColor: Colors.white.withValues(alpha: 0.5),
              activeDotColor: Colors.white,
              ),
            ),
          ),

          // Floating button
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _animateImage,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: IOColors.primary500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
