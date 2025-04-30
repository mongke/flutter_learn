import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:io_app/component/io_input.dart';
import 'package:io_app/screen/bottom_bar/bottom_tabbar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,

      WidgetState.hovered,

      WidgetState.focused,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }

    return Colors.white;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Regular expression for validating email format
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/login_backgound_image.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 200,
              left: 30,
              right: 30,
              child: Column(
                children: [
                  Image.asset('assets/images/logo_with_text.png'),
                  const SizedBox(height: 20),
                  IOInput(
                    label: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 16),
                  IOInput(
                    label: 'Password',
                    controller: TextEditingController(),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            fillColor: WidgetStateProperty.resolveWith(
                              getColor,
                            ),
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                          const Text(
                            'Remember Username',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle forgot password logic here
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 2,
                            ), // Add some spacing between text and line
                            Container(
                              height: 1, // Line height
                              width: 120, // Adjust width as needed
                              color: Colors.white, // Line color
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, proceed with login
                            print('Email: ${_emailController.text}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        const BottomNavigationBarExample(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[350], // Grey background
                          minimumSize: const Size(
                            250,
                            60,
                          ), // Width 100, height 50
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Rounded corners
                          ),
                        ),
                        child: const Text('Login'),
                      ),

                      // Face Recognition Icon
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.purple, // Purple background
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white, // White border
                            width: 2,
                          ),
                          // Circular container
                        ),
                        child: IconButton(
                          // icon: const Icon(
                          //   Icons.face_unlock_sharp, // Face recognition icon
                          //   color: Colors.white,
                          //   size: 30, // White icon color
                          // ),
                          // icon: Image.asset(
                          //   'assets/images/face.png', // Replace with your face recognition icon
                          //   // color: Colors.white,
                          //   // width: 30,
                          //   // height: 30,
                          //   fit: BoxFit.contain
                          // ),
                          icon: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.white, // Apply white color overlay
                              BlendMode.srcIn, // Blend mode to apply the color
                            ),
                            child: SvgPicture.asset(
                              'assets/images/face.svg', // Path to your SVG file
                              fit: BoxFit.contain,
                              width: 40,
                              height: 40,
                            ),
                          ),
                          onPressed: () {
                            // Handle face recognition logic here
                            print('Face recognition triggered');
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the signup screen
                          print('Navigate to Sign Up screen');
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              Colors.white, // Text color for the button
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Register Here',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ), // Add some spacing between text and line
                            Container(
                              height: 1, // Line height
                              width: 120, // Adjust width as needed
                              color: Colors.white, // Line color
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
