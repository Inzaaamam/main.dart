import 'package:auth_app/app/style/typography/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'app/routes/constant.dart';
import 'app/routes/route_generator.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injection.initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth App',
      theme: AppThemes.themLight,
      initialRoute: Routes.splash,
      onGenerateRoute: RouteGenerator.generatorRoute,
    );
  }
}
