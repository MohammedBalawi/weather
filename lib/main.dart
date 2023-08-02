import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:weather/pages/home/home_screen.dart';
import 'package:weather/pages/screen/launch_screen.dart';
import 'package:weather/utils/Binding/HomeBinding.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => const LaunchScreen());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/launch_screen' : (context) => const LaunchScreen(),
        '/home_screen' : (context) =>  HomeScreen(),
      },
      getPages: [
        GetPage(
          name: '/home',
          page: () => LaunchScreen(),
          binding: HomeBinding(),

        )
      ],
    );
  }
}
