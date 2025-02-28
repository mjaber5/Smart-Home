import 'package:flutter/material.dart';
import 'package:smart_home/features/auth/register/presentation/view/widgets/signup_button.dart';
import 'package:smart_home/features/auth/register/presentation/view/widgets/signup_conditions_view_body.dart';
import 'package:smart_home/features/auth/register/presentation/view/widgets/signup_text_body.dart';
import 'package:smart_home/features/auth/register/presentation/view/widgets/signup_text_form_feild.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignupTextBody(),
              SignupTextFormFeild(),
              ConditionsViewBody(),
              SignupButton(),
            ],
          ),
        ),
      ),
    );
  }
}
