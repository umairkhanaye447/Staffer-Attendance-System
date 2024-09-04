import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:timeclock/views/home/bloc/check_in_chck_out_bloc.dart';
import 'package:timeclock/views/login/UI/login.dart';
import 'package:timeclock/views/login/bloc/login_bloc.dart';
import 'package:timeclock/views/userpin/bloc/user_pin_bloc.dart';
import 'views/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations to landscape mode only
  SystemChrome.setPreferredOrientations(
    [
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ],
  );

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  // String? token = prefs.getString('token');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => UserPinBloc()),
        BlocProvider(create: (_) => AttendanceBloc()),
      ],
      child: MyApp(
          // initialRoute: (isLoggedIn && token != null) ? '/home' : '/login',
          ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // final String initialRoute;

  const MyApp(
      // {
      // required this.initialRoute,
      //  Key? key
      //  }
      )
      : super(key: null);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      // initialRoute: initialRoute,
      // routes: {
      //   '/welcome': (context) => const Welcome(),
      //   '/login': (context) => const Login(),
      //   '/home': (context) => const UserpinScreen(),
      // },
    );
  }
}
