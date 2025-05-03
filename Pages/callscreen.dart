import 'package:flutter/material.dart';

import '../../../Widgets/custombtn.dart';


class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
        child: Column(
          children: [
            const Text(''),
            const Spacer(),
            Center(child: Image.asset('images/callprofile.png')),
            Center(child: Image.asset('images/callkeyboard.png')),
            const Spacer(),
            CustomButton(text: 'Call Ended', onTap: () {})
          ],
        ),
      ),
    );
  }
}
