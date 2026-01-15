import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // 2. Pass that key to the `IntroductionScreen` `key` param
      //key: _introKey,
      pages: [
        PageViewModel(
          title: 'Page One',
          bodyWidget: Column(
            children: [
              Text('fkjfjj'),
              ElevatedButton(onPressed: () {}, child: const Text('Start')),
            ],
          ),
        ),
        PageViewModel(
          title: 'Page Two',
          bodyWidget: const Text('That\'s all folks'),
        ),
      ],
      showNextButton: false,
      showDoneButton: false,
    );
  }
}

/*Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('intro1',style: const TextStyle(color: Colors.red, fontSize: 30),).tr(),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => context.setLocale(const Locale('en')),
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () => context.setLocale(const Locale('ar')),
              child: const Text('العربية'),
            ),
          ],
        ),
      ),
    );*/
