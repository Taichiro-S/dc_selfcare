import 'package:auto_route/auto_route.dart';
import 'package:dc_selfcare/page/login/provider/google_auth_provider.dart';
import 'package:dc_selfcare/page/login/provider/user_role_provider.dart';
import 'package:dc_selfcare/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  bool _ageHasError = false;
  bool _genderHasError = false;

  var genderOptions = ['Male', 'Female', 'Other'];

  void _onChanged(dynamic val) {}
  final _bedtimeController = TextEditingController();
  final _wakeuptimeController = TextEditingController();
  void _showTimePicker({required TextEditingController timeController}) {
    DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      onConfirm: (date) {
        timeController.text = DateFormat('HH:mm').format(date);
      },
      currentTime: DateTime.now(),
      locale: LocaleType.jp,
    );
  }

  @override
  Widget build(BuildContext context) {
    final googleAuth = ref.watch(googleAuthProvider);
    final userRole = ref.watch(userRoleProvider);
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
                  // debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                initialValue: const {
                  'movie_rating': 5,
                  'best_language': 'Dart',
                  'age': '13',
                  'gender': 'Male',
                  'languages_filter': ['Dart']
                },
                skipDisabled: true,
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
                                timeController: _bedtimeController),
                            child: AbsorbPointer(
                              // これでTextField内の操作を無効化
                              child: TextFormField(
                                controller: _bedtimeController,
                                decoration: InputDecoration(
                                  labelText: '就寝時刻',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.access_time),
                                    onPressed: () => _showTimePicker(
                                        timeController: _bedtimeController),
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
                                timeController: _wakeuptimeController),
                            child: AbsorbPointer(
                              // これでTextField内の操作を無効化
                              child: TextFormField(
                                controller: _wakeuptimeController,
                                decoration: InputDecoration(
                                  labelText: '起床時刻',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.access_time),
                                    onPressed: () => _showTimePicker(
                                        timeController: _wakeuptimeController),
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
                        onChanged: _onChanged,
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
                          labelStyle: AppTheme.light().textTheme.h60,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: FormBuilderCheckboxGroup<String>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: '今の気持ち',
                            labelStyle: AppTheme.light().textTheme.h60,
                          ),

                          name: 'mood',
                          // initialValue: const ['Dart'],
                          options: const [
                            FormBuilderFieldOption(value: '元気'),
                            FormBuilderFieldOption(value: 'スッキリしている'),
                            FormBuilderFieldOption(value: '落ち着いている'),
                            FormBuilderFieldOption(value: '眠い'),
                            FormBuilderFieldOption(value: '疲れた'),
                            FormBuilderFieldOption(value: 'やる気が出ない'),
                            FormBuilderFieldOption(value: '落ち込んでいる'),
                            FormBuilderFieldOption(value: 'イライラしている'),
                          ],
                          onChanged: _onChanged,
                          separator: const VerticalDivider(
                            width: 10,
                            thickness: 5,
                            color: Colors.red,
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            debugPrint(_formKey.currentState?.value.toString());
                          } else {
                            debugPrint(_formKey.currentState?.value.toString());
                            debugPrint('validation failed');
                          }
                        },
                        child: Text(
                          '送信',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _formKey.currentState?.reset();
                        },
                        child: Text(
                          'Reset',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
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
