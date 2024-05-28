import 'package:flutter/material.dart';
import 'package:t_gpt/routes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: const Text(
                'Using this software,you can ask you'
                'questions and receive articles using'
                'artificial intelligence assistant',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Text(
              'You AI Assistant',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueAccent.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset('assets/onboarding.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(45),
                  elevation: 0,
                  backgroundColor: Colors.blueAccent.shade700,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.home, (route) => false);
                },
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
