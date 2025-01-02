import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../shared/theme.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 14.0,
            children: [
              //  change user name
              FormBuilder(
                key: controller.userNameFormKey,
                child: ExpansionTile(
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: colorScheme.primary, width: 1.0),
                  ),
                  tilePadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  collapsedTextColor: kOnPrimaryContainer,
                  collapsedIconColor: kOnPrimaryContainer,
                  iconColor: colorScheme.primary,
                  textColor: colorScheme.primary,
                  collapsedBackgroundColor: colorScheme.primary,
                  title: Text('Change User Name'),
                  leading: Icon(LineIcons.user),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8.0,
                      ),
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            decoration: InputDecoration(
                              hintText: 'John Doe',
                              prefixIcon: Icon(Icons.person_outline),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                color: colorScheme.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Validate',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              FormBuilder(
                key: controller.passwordFormKey,
                child: ExpansionTile(
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: colorScheme.primary, width: 1.0),
                  ),
                  tilePadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  collapsedTextColor: kOnPrimaryContainer,
                  collapsedIconColor: kOnPrimaryContainer,
                  iconColor: colorScheme.primary,
                  textColor: colorScheme.primary,
                  collapsedBackgroundColor: colorScheme.primary,
                  title: Text('Change Password'),
                  leading: Icon(LineIcons.lock),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8.0,
                      ),
                      child: Column(
                        spacing: 8.0,
                        children: [
                          FormBuilderTextField(
                            name: 'old_password',
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Old Password',
                              prefixIcon: Icon(LineIcons.lock),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'new_password',
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'New Password',
                              prefixIcon: Icon(LineIcons.lock),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                color: colorScheme.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Validate',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // delete account
              MaterialButton(
                color: kErrorColor,
                padding: EdgeInsets.all(20.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: controller.deleteAccount,
                child: Row(
                  children: [
                    Icon(Icons.delete, color: kOnPrimaryContainer),
                    SizedBox(width: 8.0),
                    Text('Delete Account',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              // logout
              MaterialButton(
                color: kWarningColor,
                padding: EdgeInsets.all(20.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: controller.logout,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: kOnPrimaryContainer),
                    SizedBox(width: 8.0),
                    Text('Logout', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
