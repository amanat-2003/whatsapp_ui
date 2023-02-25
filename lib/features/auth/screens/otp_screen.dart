// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerWidget {
  static const routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvider).verifyOTP(
          context,
          verificationId,
          userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifying your number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30, width: double.infinity),
          const Text(
            'We have sent an SMS with a code.',
            textScaleFactor: 1.05,
          ),
          // const SizedBox(height: 15),
          SizedBox(
            width: screenSize.width / 2,
            child: TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  hintText: '- - - - - -',
                  // alignLabelWithHint: true,
                  hintStyle: TextStyle(
                    fontSize: 30,
                  )),
              onChanged: (value) {
                if (value.length == 6) {
                  verifyOTP(
                    ref,
                    context,
                    value.trim(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
