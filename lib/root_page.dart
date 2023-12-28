import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/enum/enum.dart';
import 'package:dc_selfcare/page/login/login_page.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/page/login/provider/user_role_provider.dart';
import 'package:dc_selfcare/routes/router.dart';
import 'package:dc_selfcare/theme/app_colors.dart';
import 'package:dc_selfcare/widget/bottom_navigation_widget.dart';
import 'package:dc_selfcare/widget/circle_loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class RootPage extends ConsumerWidget {
  const RootPage({super.key});
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
    return googleAuth.user.when(
      data: (user) {
        if (user != null) {
          return userRoleAsync.userRoleState.when(
            data: (userRole) {
              if (userRole == UserRoleTypes.user) {
                return const BottomNavigationWidget(
                  routes: [SelfcareRoute(), UserSettingsRoute()],
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.self_improvement),
                      label: 'セルフケア',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: '設定',
                    ),
                  ],
                );
              } else if (userRole == UserRoleTypes.admin) {
                return const BottomNavigationWidget(
                  routes: [UsersListRoute(), UserSettingsRoute()],
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.people),
                      label: '利用者一覧',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: '設定',
                    ),
                  ],
                );
              } else {
                return const LoginPage();
              }
            },
            loading: () => const Center(child: CircleLoadingWidget()),
            error: (err, stack) {
              Fluttertoast.showToast(
                  backgroundColor: AppColors.light().error, msg: "エラーが発生しました");
              return const Text('エラーが発生しました');
            },
          );
        } else {
          return const LoginPage();
        }
      },
      loading: () => const Center(child: CircleLoadingWidget()),
      error: (err, stack) {
        Fluttertoast.showToast(
            backgroundColor: AppColors.light().error, msg: "エラーが発生しました");
        return const Text('エラーが発生しました');
      },
    );
  }
}
