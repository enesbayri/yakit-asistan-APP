import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/authpages/forgot_password_page/forgot_password_content.dart';
import 'package:yakit_asistan/views/authpages/widgets/page_scaffold.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginRegisterPagesScaffold(
      child: ForgotPasswordPageContent(),
    );
  }
}
