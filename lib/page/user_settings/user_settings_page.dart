import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_ui/settings_ui.dart';

@RoutePage()
class UserSettingsPage extends ConsumerWidget {
  const UserSettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('プライバシーポリシー'),
                onPressed: (context) {
                  router.push(const PrivacyPolicyRoute());
                },
              ),
              SettingsTile.navigation(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('アカウント'),
                  onPressed: (context) {
                    googleAuth.user.when(data: (user) {
                      if (user != null) {
                        AutoRouter.of(context).pushNamed('/login');
                      } else {
                        router.push(const LoginRoute());
                      }
                    }, loading: () {
                      EasyLoading.show();
                    }, error: (error, stack) {
                      Fluttertoast.showToast(msg: 'エラーが発生しました。再度お試しください。');
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
