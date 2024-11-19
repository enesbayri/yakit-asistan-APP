import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yakit_asistan/database/hive_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/router/router.dart';
import 'package:yakit_asistan/services/api_request_control.dart';
import 'package:yakit_asistan/services/permission_service.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/views/home.dart/home_page.dart';
import 'bloc/dataBloc/bloc.dart';
import 'bloc/fuelCostBloc/bloc.dart';
import 'bloc/networkBloc/bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // GetIt ile bağımlılıkları kaydediyoruz
  getitSetup();

  // Paralel async işlemler
  await Future.wait([
    hiveSetup(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);

  // Gerekli olmayan işlemleri daha sonra yapacağız
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorUiHelper.appBgColor,
    systemNavigationBarDividerColor: ColorUiHelper.appBgColor,
    statusBarColor: ColorUiHelper.appTransparentColor,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Uygulamayı başlatıyoruz
  runApp(const ProviderScope(child: FuelAssistant()));
}

class FuelAssistant extends StatefulWidget {
  const FuelAssistant({super.key});

  @override
  State<FuelAssistant> createState() => _FuelAssistantState();
}

class _FuelAssistantState extends State<FuelAssistant>
    with TickerProviderStateMixin {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isInitialized) {
        // Animasyonları başlat
        AnimationControll.createAnimations(this, context);

        // Ekran boyutlarını al
        _getScreenSize();

        // Gerekli olmayan işlemleri lazy olarak başlat
        _lazyInitialization();

        _isInitialized = true;
      }
    });
  }

  // Lazy Initialization ile açılış sonrası işlemler
  void _lazyInitialization() {
    Future.microtask(() async {
      getLocation(); // Konum verisi başlat
      apiRequestControl(); // API kontrolleri
      await MobileAds.instance.initialize(); // Reklam servisi
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FuelAssistantBloc(),
        ),
        BlocProvider(
          create: (context) => FuelCostBloc(),
        ),
        BlocProvider(
          create: (context) => NetworkBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Yakıt Asistan',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: ColorUiHelper.appbarTextColor),
          useMaterial3: true,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        onGenerateRoute: Routes.onGenerateRoute,
        home: const HomePage(),
      ),
    );
  }

  void _getScreenSize() {
    // Ekran ölçülerini alıyoruz
    startScreenSized(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
  }

  @override
  void dispose() {
    AnimationControll.controllersDispose();
    super.dispose();
  }
}