import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeclock/views/userpin/UI/widgets/AnalogWatch.dart';
import 'package:timeclock/views/userpin/UI/widgets/TextFormField.dart';
import '../../home/UI/home.dart';
import '../bloc/user_pin_bloc.dart';


class UserpinScreen extends StatefulWidget {
  const UserpinScreen({Key? key}) : super(key: key);
  @override
  State<UserpinScreen> createState() => _UserpinScreenState();
}

class _UserpinScreenState extends State<UserpinScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  final userIdController = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

 

  void showUserIdError() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Invalid User ID',
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    userIdController.dispose();
    // _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var userPinBloc = context.read<UserPinBloc>();

    return BlocConsumer<UserPinBloc, UserPinState>(
      listener: (context, state) async {
        if (state is UserPinErrorState) {
          return showUserIdError();
        }
        if (state is UserPinCompletedState) {
          userIdController.clear();

          // Get.to(Home(cameras: Value,));
          Get.to(() => Home(
                // cameras: value,
                idd: state.id,
                // cameraController: _cameraController,
              ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // AnalogWatch
                  const AnalogWatchWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height / 20.00),
                  screenSize.width > 800
                      ? const TextFormWidget()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    width: screenSize.width * 0.190,
                                    child:
                                        SvgPicture.asset('imagesvg/logo.svg'),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 0, 0, 0),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) => value == null
                                            ? null
                                            : value.isEmpty
                                                ? "User ID is not valid"
                                                : null,
                                        controller: userIdController,
                                        obscureText: _showPassword,
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                Color.fromRGBO(56, 70, 78, 1)),
                                        cursorColor: const Color.fromRGBO(
                                            70, 185, 122, 1),
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          suffixIcon: GestureDetector(
                                            onTap: _togglePasswordVisibility,
                                            child: _showPassword
                                                ? Icon(
                                                    Icons.visibility_outlined,
                                                    color: Colors.grey.shade800)
                                                : Icon(
                                                    Icons
                                                        .visibility_off_outlined,
                                                    color:
                                                        Colors.grey.shade800),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      199, 234, 215, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color.fromRGBO(
                                                      70, 185, 122, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          contentPadding: const EdgeInsets.only(
                                              left: 10.0, right: 10.0, top: 64),
                                          labelText: "Enter ID",
                                          hintStyle: const TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                Color.fromRGBO(70, 185, 122, 1),
                                          ),
                                          labelStyle: const TextStyle(
                                            fontSize: 16.0,
                                            color:
                                                Color.fromRGBO(60, 74, 88, 1),
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
                        ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20.00),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                    child: state is UserPinLoadingState
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromRGBO(70, 185, 122, 1),
                                ),
                                strokeWidth: 4.0,
                              ),
                            ),
                          )
                        : TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                const Color.fromRGBO(70, 185, 122, 1),
                              ),
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setBool('login', true);
                                //here we add th event
                                userPinBloc.add(SubmitUserIdEvent(
                                    UserID: userIdController.text));
                              }
                            },
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: const Center(
                                child: Text(
                                  'Enter',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20.00),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
