import 'package:flutter/cupertino.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/services/auth_service.dart';
import 'package:yakit_asistan/views/home.dart/page_navigation.dart';

class AuthControllPage extends StatefulWidget {
  const AuthControllPage({super.key});

  @override
  State<AuthControllPage> createState() => _AuthControllPageState();
}

class _AuthControllPageState extends State<AuthControllPage> {
  final AuthService auth = locator<AuthService>();

  @override
  void initState() {
    super.initState();
    startAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return const PageNavigation();
  }

  void startAuthentication() {
    debugPrint("başladıııııııııııııııııııııııııııııııııııııı");
    auth.userState().listen((user) {
      debugPrint("devredeeeeeeeeeeeeeee");
      if (user == null) {
        debugPrint("attıııııııııııııııııı");
        setState(() {
          Navigator.of(context).pushReplacementNamed("LoginPage");
        });
      }
    });
  }
}
