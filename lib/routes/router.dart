import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/account/account_page.dart';
// import 'package:dc_selfcare/page/landing/landing_page.dart';
import 'package:dc_selfcare/page/login/login_page.dart';
import 'package:dc_selfcare/page/privacy_policy/privacy_policy_page.dart';
import 'package:dc_selfcare/page/selfcare/selfcare_page.dart';
import 'package:dc_selfcare/page/selfcare/widget/selfcare_form.dart';
import 'package:dc_selfcare/page/user_settings/user_settings_page.dart';
import 'package:dc_selfcare/page/users_list/users_list_page.dart';
import 'package:dc_selfcare/root_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: RootRoute.page, children: [
          // AutoRoute(path: 'landing', page: LandingRoute.page),
          AutoRoute(path: 'selfcare', page: SelfcareRoute.page),
          AutoRoute(path: 'users_list', page: UsersListRoute.page),
          AutoRoute(path: 'user_settings', page: UserSettingsRoute.page),
        ]),
        AutoRoute(path: '/selfcare_form', page: SelfcareFormRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/account', page: AccountRoute.page),
        AutoRoute(path: '/privacy_policy', page: PrivacyPolicyRoute.page),
      ];
}
