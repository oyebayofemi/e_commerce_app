import 'package:e_commerce_app/model/userModel.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/services.dart/authService.dart';
import 'package:e_commerce_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        StreamProvider<UserModel?>(
          catchError: (User, UserModel) => null,
          create: (context) => context.read<AuthService>().onAuthStateChanged,
          initialData: null,
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(1080, 2340),
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: Wrapper(),
        ),
      ),
    );
  }
}
