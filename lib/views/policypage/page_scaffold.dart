import 'package:flutter/material.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/policypage/page_content.dart';

class PolicyPageScaffold extends StatelessWidget {
  const PolicyPageScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorUiHelper.appBgColor,
      body: Container(
        color: ColorUiHelper.appMainColor.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: PolicyPageContent(),
        ),
      ),
    );
  }
}
