import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/page/users_list/repository/selfcare_timeline_repository.dart';
import 'package:dc_selfcare/page/users_list/repository/users_list_repository.dart';
import 'package:dc_selfcare/service/format_datetime.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class UsersListPage extends ConsumerWidget {
  const UsersListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final allUsersAsync = ref.watch(usersListProvider);
    final selfcareHistoriesAsync = ref.watch(selfcareTimelineProvider);
    final router = AutoRouter.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('利用者一覧', style: AppTheme.light().textTheme.h60),
        ),
        body: allUsersAsync.when(
          data: (users) {
            if (users.isEmpty) {
              return const Center(child: Text('利用者がいません'));
            }
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                    title: Text(user.name),
                    subtitle: Text(formatDateTime(user.selfcareUpdatedAt)));
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) {
            Fluttertoast.showToast(msg: e.toString());
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
