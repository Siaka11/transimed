import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transimed/ui/screens/home_screen.dart';
import 'package:transimed/ui/widgets/constant.dart';

class LoadingScreens extends StatefulWidget {
  const LoadingScreens({super.key});

  @override
  State<LoadingScreens> createState() => _LoadingScreensState();
}

class _LoadingScreensState extends State<LoadingScreens> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextScreen();
    });
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/netflix_logo_1.png'),
          SpinKitFadingCircle(
            color: kSecondColor,
            size: 20,
          )
        ],
      ),
    );
  }

  
}
