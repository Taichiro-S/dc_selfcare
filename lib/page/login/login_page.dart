import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/widget/google_login_button.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ディーキャリア セルフケア",
            style: AppTheme.light().textTheme.h60,
          ),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text('ディーキャリアで発行されたグーグルアカウントでログインしてください',
                style: AppTheme.light().textTheme.h30),
          ),
          const GoogleLogInButton()
        ])));
  }
}
