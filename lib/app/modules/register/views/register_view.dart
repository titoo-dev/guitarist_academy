import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../shared/widgets/dismiss_keyboard.dart';
import '../../../shared/widgets/dynamic_brightness.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return DissmisKeyboard(
      child: DynamicBrightness(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 60.0),

                // creata an account text
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Create an account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: FormBuilder(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16.0,
                      children: [
                        // label: Email
                        Text(
                          'Name',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'John Doe',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),

                        Text(
                          'Email',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        FormBuilderTextField(
                          name: 'email',
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                            prefixIcon: Icon(LineIcons.envelope),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),

                        // label: Password
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        FormBuilderTextField(
                          name: 'password',
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '********',
                            prefixIcon: Icon(LineIcons.lock),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ]),
                        ),

                        // confirm password
                        Text(
                          'Confirm Password',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),

                        FormBuilderTextField(
                          name: 'confirm_password',
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '********',
                            prefixIcon: Icon(LineIcons.lock),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(6),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ElevatedButton(
                    onPressed: controller.checkFormValidity,
                    child: Text('Sign Up'),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color ??
                            Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: ' Sign in',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.navigateToLogin,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
