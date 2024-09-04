import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:timeclock/views/login/UI/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // _checkLoginStatus();
  }

  // Future<void> _checkLoginStatus() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   var sharedPreferences = await SharedPreferences.getInstance();
  //   bool isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;
  //   String? token = sharedPreferences.getString('token');

  //   // Adding a slight delay to ensure the loader is shown
  //   await Future.delayed(const Duration(seconds: 1));

  //   setState(() {
  //     _isLoading = false;
  //   });

  //   if (isLoggedIn && token != null) {
  //     // Navigate to Home screen if logged in
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const UserpinScreen()),
  //     );
  //   } else {
  //     // Navigate to Login screen if not logged in
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const Login()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlurryModalProgressHUD(
        inAsyncCall: _isLoading,
        progressIndicator: const SpinKitFadingCircle(
          color: Colors.greenAccent,
          size: 50.0,
        ),
        dismissible: false,
        opacity: 0.4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: SvgPicture.asset('imagesvg/Welcome (1).svg'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    width: screenSize.width * 0.190,
                    child: SvgPicture.asset('imagesvg/logo.svg'),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: screenSize.width > 800
                        ? screenSize.height * 0.18
                        : screenSize.height * 0.12,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: AutoSizeText(
                      'WELCOME TO',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: screenSize.width > 800 ? 24.0 : 13.0,
                        color: const Color.fromRGBO(51, 51, 51, 1),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: AutoSizeText(
                      'THE STAFFER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.width > 800 ? 64.0 : 25.0,
                        color: const Color.fromRGBO(70, 185, 122, 1),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: screenSize.width * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: AutoSizeText(
                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using.',
                        style: TextStyle(
                          height: screenSize.width > 800 ? 1.5 : 1.0,
                          fontSize: screenSize.width > 800 ? 18.0 : 15.0,
                          color: const Color.fromRGBO(59, 76, 102, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.10,
                ),
                Container(
                  width: screenSize.width * 0.250,
                  height: screenSize.height * 0.07,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          const Color.fromRGBO(70, 185, 122, 1),
                        ),
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        // Adding a slight delay to ensure the loader is shown
                        await Future.delayed(const Duration(milliseconds: 500));
                        Get.to(const Login());
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: screenSize.height * 0.02,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
