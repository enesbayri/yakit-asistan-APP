import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/authpages/login_page/login_form.dart';
import 'package:yakit_asistan/views/authpages/widgets/page_scaffold.dart';

class LoginPageContent extends StatelessWidget {
  const LoginPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoginRegisterPagesScaffold(
      child: LoginFormContents(),
    );
  }
}
