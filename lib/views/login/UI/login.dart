import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:timeclock/views/login/bloc/login_bloc.dart';
import 'package:timeclock/views/userpin/UI/userpin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  bool _showPassword = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void showLoginError() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Invalid credentials',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.shade900,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var loginBloc = context.read<LoginBloc>();

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoadingState) {
          setState(() {
            _isLoading = true;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }
        if (state is LoginErrorState) {
          return showLoginError();
        }
        if (state is LoginLoadedState) {
          Get.to(() => const UserpinScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: BlurryModalProgressHUD(
          inAsyncCall: _isLoading,
          blurEffectIntensity: 4,
          progressIndicator: const SpinKitFadingCircle(
            color: Colors.greenAccent,
            size: 50.0,
          ),
          dismissible: false,
          opacity: 0.4,
          color: Colors.transparent,
          child: Stack(children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'imagesvg/Organization Login.png',
                  fit: BoxFit.fill,
                )),
            Positioned(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.070),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        //    height: MediaQuery.of(context).size.height / 4,
                        child: SvgPicture.asset(
                          'imagesvg/logo2.svg',

                          //  fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.040),
                    screenSize.width > 800
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(200, 0, 200, 14),
                            child: TextFormField(
                              validator: (value) => value == null
                                  ? null
                                  : value.isEmpty
                                      ? "please provide an email"
                                      : null,
                              //  obscureText: _changePassword,
                              controller: emailController,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(56, 70, 78, 1)
                                  // fontWeight: FontWeight.bold
                                  ),
                              cursorColor:
                                  const Color.fromRGBO(70, 185, 122, 1),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(199, 234, 215, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(70, 185, 122, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                labelText: "email",
                                hintStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(60, 74, 88, 1),
                                    fontWeight: FontWeight.w400),
                                labelStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(70, 185, 122, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                              autocorrect: false,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 40, 14),
                            child: TextFormField(
                              validator: (value) => value == null
                                  ? null
                                  : value.isEmpty
                                      ? "please provide an email"
                                      : null,
                              //  obscureText: _changePassword,
                              controller: emailController,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(56, 70, 78, 1)
                                  // fontWeight: FontWeight.bold
                                  ),
                              cursorColor:
                                  const Color.fromRGBO(70, 185, 122, 1),

                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(184, 204, 193, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(70, 185, 122, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                // contentPadding:
                                //     EdgeInsets.only(left: 10.0, right: 10.0, top: 64),
                                labelText: "Company",
                                hintStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(60, 74, 88, 1),
                                    fontWeight: FontWeight.w400),
                                labelStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(70, 185, 122, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                              autocorrect: false,
                            ),
                          ),
                    const SizedBox(
                      height: 0,
                    ),
                    screenSize.width > 800
                        ? Padding(
                            padding:
                                const EdgeInsets.fromLTRB(200, 14, 200, 14),
                            child: TextFormField(
                              validator: (value) => value == null
                                  ? null
                                  : value.isEmpty
                                      ? "please provide an password"
                                      : null,
                              controller: passwordController,
                              obscureText: _showPassword,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(56, 70, 78, 1)
                                  // fontWeight: FontWeight.bold
                                  ),
                              cursorColor:
                                  const Color.fromRGBO(70, 185, 122, 1),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: GestureDetector(
                                  onTap: _togglePasswordVisibility,
                                  child: _showPassword
                                      ? Icon(Icons.visibility_outlined,
                                          color: Colors.grey.shade800)
                                      : Icon(Icons.visibility_off_outlined,
                                          color: Colors.grey.shade800),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(199, 234, 215, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(70, 185, 122, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                labelText: "Password",
                                hintStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(60, 74, 88, 1),
                                    fontWeight: FontWeight.w400),
                                labelStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(70, 185, 122, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                              autocorrect: false,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(40, 14, 40, 14),
                            child: TextFormField(
                              validator: (value) => value == null
                                  ? null
                                  : value.isEmpty
                                      ? "please provide an password"
                                      : null,
                              controller: passwordController,
                              obscureText: _showPassword,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(56, 70, 78, 1)
                                  // fontWeight: FontWeight.bold
                                  ),
                              cursorColor:
                                  const Color.fromRGBO(70, 185, 122, 1),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                suffixIcon: GestureDetector(
                                  onTap: _togglePasswordVisibility,
                                  child: _showPassword
                                      ? Icon(Icons.visibility_outlined,
                                          color: Colors.grey.shade800)
                                      : Icon(Icons.visibility_off_outlined,
                                          color: Colors.grey.shade800),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromRGBO(199, 234, 215, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(70, 185, 122, 1)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                labelText: "Password",
                                hintStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(60, 74, 88, 1),
                                    fontWeight: FontWeight.w400),
                                labelStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(70, 185, 122, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                              autocorrect: false,
                            ),
                          ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    screenSize.width > 800
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(200, 0, 200, 14),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    //  height: 45,
                                    child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                          const Color.fromRGBO(70, 185, 122, 1),
                                        ),
                                        shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          loginBloc.add(LoginButtonPressedEvent(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ));
                                        }
                                      },
                                      child: Container(
                                        child: const Text(
                                          'SIGN IN',
                                          //   'Login',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const AutoSizeText(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(70, 185, 122, 1),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 40, 14),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.060,
                                    //  height: 45,
                                    child: TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                          const Color.fromRGBO(70, 185, 122, 1),
                                        ),
                                        shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        // Get.to(() =>const Userpin());
                                        if (_formKey.currentState!.validate()) {
                                          loginBloc.add(LoginButtonPressedEvent(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ));
                                        }
                                      },
                                      child: Container(
                                        child: const Text(
                                          'SIGN IN',
                                          //   'Login',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const AutoSizeText(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(70, 185, 122, 1),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ]),
                ),
              ),
            )
          ]),
        ));
      },
    );
  }
}
