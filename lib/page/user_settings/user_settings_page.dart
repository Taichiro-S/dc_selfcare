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
                  router.pushNamed('/privacy_policy');
                },
              ),
              SettingsTile.navigation(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('アカウント'),
                  onPressed: (context) {
                    googleAuth.user.when(data: (user) {
                      if (user != null) {
                        router.pushNamed('/account');
                      } else {
                        router.pushNamed('/login');
                      }
                    }, loading: () {
                      EasyLoading.show();
                    }, error: (error, stack) {
                      Fluttertoast.showToast(msg: 'エラーが発生しました');
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
