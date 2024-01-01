import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/enum/enum.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/page/login/provider/user_role_provider.dart';
import 'package:dc_selfcare/page/login/widget/google_logout_button.dart';
import 'package:dc_selfcare/routes/router.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:dc_selfcare/widget/circle_loading_widget.dart';
import 'package:dc_selfcare/widget/custom_circle_avator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final userRoleAsync = ref.watch(userRoleProvider);
    ref.listen<AsyncValue<User?>>(
        googleAuthProvider.select((state) => state.user), (_, user) {
      if (user.value != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(userRoleProvider.notifier).checkUserRole(user: user.value!);
        });
      }
    });
    final router = AutoRouter.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "アカウント",
            style: AppTheme.light().textTheme.h60,
          ),
        ),
        body: googleAuth.user.when(
          data: (user) {
            if (user != null) {
              return userRoleAsync.userRoleState.when(
                  loading: () => const Center(child: CircleLoadingWidget()),
                  error: (err, stack) {
                    return const Text('エラーが発生しました');
                  },
                  data: (userRole) {
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
                                user.displayName ?? '名前が設定されていません',
                                style: AppTheme.light().textTheme.h40,
                              ),
                              Text(
                                user.email!,
                                style: AppTheme.light().textTheme.h20,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              userRole == UserRoleTypes.admin
                                  ? const Text('スタッフとしてログインしています')
                                  : userRole == UserRoleTypes.user
                                      ? const Text('利用者としてログインしています')
                                      : const Text('このユーザは登録されていません'),
                              const SizedBox(
                                height: 10,
                              ),
                              const Center(
                                child: GoogleLogOutButton(),
                              )
                            ])));
                  });
            } else {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text('ユーザが存在しません', style: AppTheme.light().textTheme.h50),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        router.navigate(const LoginRoute());
                      },
                      child: const Text('ログインページに戻る'),
                    )
                  ]));
            }
          },
          loading: () => const Center(child: CircleLoadingWidget()),
          error: (err, stack) {
            Fluttertoast.showToast(
                backgroundColor: AppTheme.light().appColors.error,
                msg: "ログイン中にエラーが発生しました");
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('ログイン中にエラーが発生しました',
                      style: AppTheme.light().textTheme.h50),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      router.navigate(const LoginRoute());
                    },
                    child: const Text('ログインページに戻る'),
                  )
                ]));
          },
        ));
  }
}
