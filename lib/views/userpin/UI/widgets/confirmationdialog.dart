import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutConfirmationDialog extends StatefulWidget {
  final Function onConfirm;

  const LogoutConfirmationDialog({required this.onConfirm, Key? key}) : super(key: key);

  @override
  _LogoutConfirmationDialogState createState() => _LogoutConfirmationDialogState();
}

class _LogoutConfirmationDialogState extends State<LogoutConfirmationDialog> {
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _checkPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPassword = prefs.getString('loginPassword');

    if (_passwordController.text == savedPassword) {
      widget.onConfirm();
      Navigator.of(context).pop();
    } else {
      setState(() {
        _errorMessage = 'Incorrect password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Logout'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Please enter your company password to logout.'),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              errorText: _errorMessage.isEmpty ? null : _errorMessage,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _checkPassword,
          child: const Text('Confirm'),
        ),
      ],
    );
  }
}
