import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/main_screen/main_screen.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login to your account'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FormWidget(),
          const SizedBox(
            height: 50,
          ),
          Text(
            'In order ti use the editing and rating capabilities of TMB, as well as get personal recomtndations you will need to login to your account.            If you do not have an account, registering for an accaunt is free and simple',
            style: textStyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: Text('Register')),
          const SizedBox(
            height: 50,
          ),
          Text(
            'If you signed up but didnt get your verification email, click here to have it resent ',
            style: textStyle,
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(onPressed: () {}, child: Text('Verify email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      //Navigator.of(context).pushNamed('/main_screen');
      Navigator.of(context).pushReplacementNamed('/main_screen');

      errorText = null;
    } else {
      errorText = "Hе верный логин или пароль";
      print('show error');
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    final textFieldDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
      fillColor: Colors.red,
      focusColor: Colors.red,
      hoverColor: Colors.red,
    );
    final errorText = this.errorText;

    final color = const Color(0xFF01B4E4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          // спринт оператор - дарт - позволяет добавлять подмассив из виджетово
          Text(
            errorText,
            style: TextStyle(fontSize: 17, color: Colors.red),
          ),
          SizedBox(
            height: 20,
          ),
        ],
        Text('Username', style: textStyle),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _auth();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  )),
              child: Text('Login'),
            ),
            SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: () {
                _resetPassword();
              },
              style: AppButtonStyle.linkButton,
              child: Text(
                'Reset password',
              ),
            ),
          ],
        )
      ],
    );
  }
}
