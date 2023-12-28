import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/login_page.dart';
import 'package:dc_selfcare/page/privacy_policy/privacy_policy_page.dart';
import 'package:dc_selfcare/page/user_settings/user_settings_page.dart';
import 'package:dc_selfcare/root_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: RootRoute.page, children: [
          AutoRoute(path: 'user_settings', page: UserSettingsRoute.page),
        ]),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/privacy_policy', page: PrivacyPolicyRoute.page),
      ];
}
