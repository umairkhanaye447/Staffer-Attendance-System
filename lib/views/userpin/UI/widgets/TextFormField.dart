import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({super.key});

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  final userIdController = TextEditingController();
  bool _showPassword = false;

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return
     Padding(
      padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
      child: Container(
        child: Row(
          children: [
            Container(
              width: screenSize.width * 0.250,
              child: SvgPicture.asset('imagesvg/logo.svg'),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null
                        ? null
                        : value.isEmpty
                            ? "User ID is not valid"
                            : null,
                    controller: userIdController,
                    obscureText: !_showPassword,
                    style: const TextStyle(
                        fontSize: 16.0, color: Color.fromRGBO(56, 70, 78, 1)),
                    cursorColor: const Color.fromRGBO(70, 185, 122, 1),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(199, 234, 215, 1)),
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(70, 185, 122, 1)),
                          borderRadius: BorderRadius.circular(5.0)),
                      contentPadding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 64),
                      labelText: "Enter ID",
                      hintStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(70, 185, 122, 1),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 16.0,
                        color: Color.fromRGBO(60, 74, 88, 1),
                      ),
                    ),
                    autocorrect: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
