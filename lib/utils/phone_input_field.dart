import 'package:flutter/material.dart';
import 'app_constants.dart';

// Widget for phone number input

class PhoneNumberInputField extends StatefulWidget {
  String selectedCountryCode;
  TextEditingController phoneInputcontroller;

  PhoneNumberInputField({
    super.key,
    required this.selectedCountryCode,
    required this.phoneInputcontroller,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PhoneNumberInputFieldState createState() => _PhoneNumberInputFieldState();
}

class _PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  String selectedCountryCode = '+1'; // Default country code
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.08,
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          color: AppColors.loginPhoneInputFieldBGColor,
          borderRadius: BorderRadius.circular(
            30,
          ),
          border: Border.all(
            color: AppColors.hintTextColor,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.2,
            child: DropdownButtonFormField<String>(
              iconEnabledColor: Colors.black,
              elevation: 0,
              value: widget.selectedCountryCode,
              onChanged: (String? newValue) {
                setState(() {
                  widget.selectedCountryCode = newValue!;
                });
              },
              decoration: const InputDecoration(
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              items: <String>[
                '+91',
                '+1',
                '+44',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.hintTextColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 10), // Add some spacing
          SizedBox(
            width: size.width * 0.5,
            child: TextFormField(
              controller: widget.phoneInputcontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  color: AppColors.hintTextColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
