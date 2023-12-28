import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/routes/router.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class UsersListPage extends ConsumerWidget {
  const UsersListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('ユーザ一覧', style: AppTheme.light().textTheme.h60),
        ),
        body: const Center(
          child: Text('ユーザ一覧ページ'),
        ));
  }
}
