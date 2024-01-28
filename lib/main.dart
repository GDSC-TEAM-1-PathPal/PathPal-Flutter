import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pathpal/screens/dp/login.dart';
import 'package:pathpal/screens/vt/car_main.dart';
import 'package:pathpal/screens/vt/login.dart';
import 'package:pathpal/screens/vt/progress_1.dart';
import 'package:pathpal/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:pathpal/widgets/navbar.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //파이어베이스 연결 코드
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ko', 'KO'),
        title: 'pathpal',
        theme: ThemeData(
          colorScheme: appColorScheme(), // 컬러 테마 적용
          textTheme: appTextTheme(), //폰트 테마 적용
          useMaterial3: true,
        ),
        home: VtLogin() //Disabled persion 로그인 화면
        );
  }
}
