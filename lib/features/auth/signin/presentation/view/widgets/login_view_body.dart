import 'package:flutter/material.dart';
import 'package:smart_home/features/auth/signin/presentation/view/widgets/login_action_text.dart';
import 'package:smart_home/features/auth/signin/presentation/view/widgets/login_buttons.dart';
import 'package:smart_home/features/auth/signin/presentation/view/widgets/login_conditions.dart';
import 'package:smart_home/features/auth/signin/presentation/view/widgets/login_logo_view.dart';
import 'package:smart_home/features/auth/signin/presentation/view/widgets/login_text_form_feilds.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            LoginLogoView(),
            SizedBox(height: 16),
            LoginTextFormFeilds(),
            LoginActionText(),
            SizedBox(height: 18),
            LoginButtons(),
            Spacer(),
            LoginConditions(),
          ],
        ),
      ),
    );
  }
}
