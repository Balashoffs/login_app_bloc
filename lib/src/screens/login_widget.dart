import 'package:flutter/material.dart';
import 'package:login_app_bloc/src/blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children:[
          emailWidget(bloc),
          passwordWidget(bloc),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailWidget(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot){
        return TextField(
          onChanged:   bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Email Adress',
              hintText: 'you@example.com',
              errorText: snapshot.error,
          ),
        );
      },
    );



  }

  Widget passwordWidget(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
          labelText: 'Password',
          errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot){
        return RaisedButton(
          onPressed: snapshot.hasData ? (){
            bloc.submit();
          }:null,
          child: Text('Submit'),
          color: Colors.blue,
        );
      },
    );
  }

}