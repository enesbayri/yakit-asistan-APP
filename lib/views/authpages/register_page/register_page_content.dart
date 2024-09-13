import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/authpages/register_page/register_form.dart';
import 'package:yakit_asistan/views/authpages/widgets/page_scaffold.dart';

class RegisterPageContent extends StatelessWidget {
  const RegisterPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoginRegisterPagesScaffold(
      child: RegisterFormContents(),
    );
  }
}
