import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.controller,
    required this.title,
    required this.icon,
    this.obscureText = false,
    this.isNumber = false,

    this.validator,
  });
  final String title;
  final IconData? icon;
  final bool obscureText;
  final bool isNumber;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                controller: controller,
                validator: validator,
                obscureText: obscureText,
                keyboardType: isNumber
                    ? TextInputType.number
                    : TextInputType.text,
                decoration: InputDecoration(
                  labelText: title,
                  floatingLabelStyle: TextStyle(
                    color: const Color.fromARGB(255, 93, 93, 93),
                  ),
                  suffixIcon: Icon(
                    icon,
                    color: const Color.fromARGB(255, 93, 93, 93),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 141, 183, 212),
                      width: 2,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 141, 183, 212),
                      width: 3,
                    ),
                  ),
                ),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
            SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
