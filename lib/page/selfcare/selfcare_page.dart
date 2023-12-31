import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/page/login/provider/user_role_provider.dart';
import 'package:dc_selfcare/routes/router.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class SelfcarePage extends ConsumerWidget {
  const SelfcarePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final userRole = ref.watch(userRoleProvider);
    final router = AutoRouter.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('セルフケアフォーム', style: AppTheme.light().textTheme.h60),
        ),
        body: Center(
            child: OutlinedButton(
                onPressed: () async {
                  router.pushNamed('/selfcare_form');
                },
                child: const Text('セルフケアを入力する'))));
  }
}
