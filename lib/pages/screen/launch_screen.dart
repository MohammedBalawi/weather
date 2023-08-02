import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacementNamed(context,'/home_screen');
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.cyanAccent.shade100 ,
              Colors.cyan.shade400 ,
            ]
          ),
        ),
        child: Text('Weather',style: GoogleFonts.aBeeZee(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
    );
  }
}
