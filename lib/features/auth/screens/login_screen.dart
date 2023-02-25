import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void sendPhoneNumberToOTPScreen() {
    String phoneNumber = phoneController.text.trim();
    if (phoneNumber.isNotEmpty && country != null) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Please fill out all the fields');
    }
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      // showPhoneCode: true,
      searchAutofocus: true,
      countryListTheme: const CountryListThemeData(backgroundColor: backgroundColor),
      onSelect: (Country value) {
        setState(() {
          country = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                const Text(
                  'WhatsApp will need to verify your phone number.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: pickCountry,
                  child: const Text(
                    'Pick country',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: screenSize.width * 0.75,
                  child: Row(
                    children: [
                      if (country != null)
                        Text(
                          '+${country!.phoneCode}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                                hintText: 'phone number')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenSize.width * 0.25,
              child: CustomButton(
                  text: 'NEXT', onPressed: sendPhoneNumberToOTPScreen),
            )
          ],
        ),
      ),
      //
      // Pick country
      // phone number
      // NEXT
    );
  }
}
