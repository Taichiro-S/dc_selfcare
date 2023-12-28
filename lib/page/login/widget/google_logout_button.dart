import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoogleLogOutButton extends ConsumerWidget {
  const GoogleLogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    return ElevatedButton(
      onPressed: () async {
        try {
          await googleAuthNotifier.signOut();
          Fluttertoast.showToast(
              backgroundColor: AppTheme.light().appColors.primary,
              msg: "ログアウトしました");
        } catch (e) {
          Fluttertoast.showToast(
              backgroundColor: AppTheme.light().appColors.primary,
              msg: "ログアウトに失敗しました");
        }
        router.pop();
      },
      child: const Text('ログアウト'),
    );
  }
}
