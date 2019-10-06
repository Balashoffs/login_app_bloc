import 'package:flutter/material.dart';
import 'package:login_app_bloc/src/blocs/provider.dart';
import 'package:login_app_bloc/src/screens/login_widget.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
        title: 'Log in!',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }

}