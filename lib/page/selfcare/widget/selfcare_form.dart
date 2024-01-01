import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/enum/enum.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/page/login/provider/user_role_provider.dart';
import 'package:dc_selfcare/page/selfcare/provider/selfcare_form_provider.dart';
import 'package:dc_selfcare/routes/router.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

@RoutePage()
class SelfcareFormPage extends ConsumerStatefulWidget {
  const SelfcareFormPage({super.key});
  @override
  ConsumerState<SelfcareFormPage> createState() => _SelfcareFormPageState();
}

class _SelfcareFormPageState extends ConsumerState<SelfcareFormPage> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  final _bedtimeController = TextEditingController();
  final _wakeuptimeController = TextEditingController();
  void _showTimePicker(
      {required TextEditingController timeController,
      required void Function(String) onConfirm}) {
    DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      onConfirm: (date) {
        timeController.text = DateFormat('HH:mm').format(date);
        onConfirm(timeController.text);
      },
      currentTime: DateTime.now(),
      locale: LocaleType.jp,
    );
  }

  @override
  Widget build(BuildContext context) {
    final googleAuth = ref.watch(googleAuthProvider);
    final userRole = ref.watch(userRoleProvider);
    final selfcareForm = ref.watch(selfcareFormProvider);
    final selfcareFormNotifier = ref.watch(selfcareFormProvider.notifier);
    final router = AutoRouter.of(context);
    final today = DateTime.now().toLocal();
    final formattedDate = '${today.year}年${today.month}月${today.day}日';
    return Scaffold(
        appBar: AppBar(
          title: Text('$formattedDateのセルフケア',
              style: AppTheme.light().textTheme.h40),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                  key: _formKey,
                  // enabled: false,
                  onChanged: () {
                    _formKey.currentState!.save();
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                  skipDisabled: true,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        Row(children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: GestureDetector(
                                onTap: () => _showTimePicker(
                                    timeController: _bedtimeController,
                                    onConfirm: (val) {
                                      selfcareFormNotifier.setBedTime(
                                          bedTime: val);
                                    }),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: _bedtimeController,
                                    decoration: InputDecoration(
                                      labelText: '就寝時刻',
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.bed_outlined),
                                        onPressed: () => _showTimePicker(
                                            timeController: _bedtimeController,
                                            onConfirm: (val) {
                                              selfcareFormNotifier.setBedTime(
                                                  bedTime: val);
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: GestureDetector(
                                onTap: () => _showTimePicker(
                                    timeController: _wakeuptimeController,
                                    onConfirm: (val) {
                                      selfcareFormNotifier.setWakeUpTime(
                                          wakeUpTime: val);
                                    }),
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    controller: _wakeuptimeController,
                                    decoration: InputDecoration(
                                      labelText: '起床時刻',
                                      suffixIcon: IconButton(
                                        icon:
                                            const Icon(Icons.wb_sunny_outlined),
                                        onPressed: () => _showTimePicker(
                                            timeController:
                                                _wakeuptimeController,
                                            onConfirm: (val) {
                                              selfcareFormNotifier
                                                  .setWakeUpTime(
                                                      wakeUpTime: val);
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: FormBuilderSlider(
                            name: 'slider',
                            onChanged: (val) {
                              selfcareFormNotifier.setPoint(
                                  point: (_formKey.currentState!.value['slider']
                                          as double)
                                      .toInt());
                            },
                            min: 0.0,
                            max: 5.0,
                            maxValueWidget: (max) => const Column(children: [
                              Icon(Icons.thumb_up_alt_outlined),
                              Text('良い')
                            ]),
                            minValueWidget: (min) => const Column(children: [
                              Icon(Icons.thumb_down_alt_outlined),
                              Text('悪い')
                            ]),
                            initialValue: 3,
                            divisions: 5,
                            activeColor: AppTheme.light().appColors.primary,
                            inactiveColor: AppTheme.light().appColors.secondary,
                            decoration: InputDecoration(
                              labelText: '今日のコンディション',
                              labelStyle: AppTheme.light().textTheme.h50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: FormBuilderTextField(
                            name: 'message',
                            onChanged: (val) {
                              selfcareFormNotifier.setMessage(
                                  message: val ?? '');
                            },
                            decoration: InputDecoration(
                              labelText: 'その他伝えたいことがあれば記入してください',
                              labelStyle: AppTheme.light().textTheme.h30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (selfcareFormNotifier.isFormValidated()) {
                            final email = googleAuth.user.value?.email;
                            if (email != null &&
                                userRole.userRoleState.hasValue &&
                                userRole.userRoleState.value ==
                                    UserRoleTypes.user) {
                              if (await selfcareFormNotifier.submitSelfcareForm(
                                  email: email)) {
                                Fluttertoast.showToast(
                                    backgroundColor:
                                        AppTheme.light().appColors.primary,
                                    msg: "送信しました");
                                router.navigate(const SelfcareRoute());
                              } else {
                                Fluttertoast.showToast(
                                    backgroundColor:
                                        AppTheme.light().appColors.error,
                                    msg: "送信に失敗しました");
                              }
                            } else {
                              Fluttertoast.showToast(
                                  backgroundColor:
                                      AppTheme.light().appColors.error,
                                  msg: "ユーザ情報が取得できませんでした");
                            }
                          } else {
                            Fluttertoast.showToast(
                                backgroundColor:
                                    AppTheme.light().appColors.error,
                                msg: "起床時刻と就寝時刻は必ず入力してください");
                          }
                        },
                        child: Text(
                          '送信',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
