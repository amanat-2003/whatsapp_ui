import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      // showPhoneCode: true,
      searchAutofocus: true,
      countryListTheme: CountryListThemeData(
        backgroundColor: backgroundColor
      ),
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
              child: CustomButton(text: 'NEXT', onPressed: () {}),
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
