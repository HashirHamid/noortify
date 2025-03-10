import 'package:flutter/material.dart';
import 'package:noortify/shared_widgets/button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 210,
                width: screenWidth,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SizedBox(
                        width: screenWidth * 0.88,
                        child: Image.asset("assets/images/curved-lines.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Noortify",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 72,
                      color: Color.fromARGB(255, 255, 153, 54),
                    ),
              ),
              Text(
                "Your security is our priority. Secure your Home with our services.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Color.fromARGB(255, 97, 97, 97),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 175,
                width: screenWidth * 0.33,
                child: Image.asset("assets/images/straight-lines.png"),
              ),
              const SizedBox(height: 8),
              Center(
                child: Button(
                  onPressed: () {},
                  text: "Sign up",
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "I have an account. ",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Color.fromARGB(255, 97, 97, 97),
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 97, 97, 97),
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(70, 32),
                    ),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
