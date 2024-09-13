import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'enesbayri1@gmail.com',
  );

  Future<void> launch(title) async {
    switch (title) {
      case "Gmail":
        await launchUrl(_emailLaunchUri);
        break;
      case "LinkedIn":
        await launchUrl(
            Uri.parse("https://www.linkedin.com/in/enes-bayri-8121282a3/"));
        break;
      case "Github":
        await launchUrl(Uri.parse("https://github.com/enesbayri"));
        break;
      case "İnstagram":
        await launchUrl(Uri.parse("https://www.instagram.com/eness_bayrii/"));
        break;
    }
  }
}
