import 'package:flutter/material.dart';
import 'package:yakit_asistan/views/profilepage/profile.dart';

class MyProfilePageScaffold extends StatelessWidget {
  const MyProfilePageScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: MyProfile(),
    );
  }
}
