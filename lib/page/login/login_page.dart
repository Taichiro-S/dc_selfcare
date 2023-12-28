import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/page/login/widget/google_login_button.dart';
import 'package:dc_selfcare/page/login/widget/google_logout_button.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:dc_selfcare/widget/custom_circle_avator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("ログイン")),
        body: googleAuth.user.when(
          data: (user) {
            if (user != null) {
              return SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        CustomCircleAvator(
                          imageUrl: user.photoURL,
                          radius: 40,
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          user.displayName ?? 'No Name',
                          style: AppTheme.light().textTheme.h40,
                        ),
                        Text(
                          user.email!,
                          style: AppTheme.light().textTheme.h20,
                        ),
                        const GoogleLogOutButton(),
                        const Divider(),
                      ])));
            } else {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text('ログインしていません', style: AppTheme.light().textTheme.h50),
                    const SizedBox(height: 10),
                    const GoogleLogInButton()
                  ]));
            }
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            Fluttertoast.showToast(
                backgroundColor: AppTheme.light().appColors.error,
                msg: "エラーが発生しました");
            return const Text('エラーが発生しました');
          },
        ));
  }
}
