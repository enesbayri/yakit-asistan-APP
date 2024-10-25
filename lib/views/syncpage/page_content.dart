import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/animation_control.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/alert_dialog_delete.dart';
import 'package:yakit_asistan/views/commonwidgets/page_name_bar.dart';
import 'package:yakit_asistan/views/syncpage/db_name_card.dart';
import 'package:yakit_asistan/views/syncpage/progress_screen.dart';
import 'package:yakit_asistan/views/syncpage/selected_db_card.dart';
import 'package:yakit_asistan/views/syncpage/start_sync_button.dart';
import 'package:yakit_asistan/views/syncpage/state_card.dart';

class SynchroPageContents extends ConsumerStatefulWidget {
  const SynchroPageContents({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SynchroPageContentsConsumerState();
}

class _SynchroPageContentsConsumerState
    extends ConsumerState<SynchroPageContents>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    createAnimation();
  }

  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => AlertDialogForDelete.showWarningDialog(
        // ignore: use_build_context_synchronously
        context: context,
        title: "Veri Senkronizasyonunda Dikkat!",
        onButtonPressed: () {
          Navigator.of(context).pop();
        },
        content: Text(
          "Burada telefonunuzdaki ve giriş yaptığınız hesabınızdaki(sunucu) verileri eşitleyeceksiniz. Yeni veri eklendiğinde internet bağlantı durumuna göre hesabınıza veya telefonunuza kaydedecektir. Bu yüzden yeni veriler eklendiğinde verilerinizi telefonunuza yada hesabınıza eşitlemenizi öneririz.",
          style: TextStyleHelper.syncWarningSubtitleStyle,
        ),
      ),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: screen.height * 0.12,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SyncSelectDBCard(
                dbTag: "server",
                imageUrl: "assets/sync/db.png",
                radius: 60,
                padding: 10.0,
                borderRadius: 60,
                isborder: true,
                onPressed: () {
                  String? currentDB = ref.read(syncCurrenDBProvider);
                  currentDB == "server"
                      ? ref.read(syncCurrenDBProvider.notifier).state = null
                      : ref.read(syncCurrenDBProvider.notifier).state =
                          "server";
                },
              ),
              const SyncDBNameCard(
                title: "Sunucu",
              )
            ],
          ),
        ),
        SyncCenterStateCard(),
        SyncStartButton(),
        Positioned(
          bottom: screen.height * 0.07,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SyncSelectDBCard(
                dbTag: "local",
                imageUrl: "assets/sync/localDB.png",
                radius: 60,
                padding: 10.0,
                borderRadius: 60,
                isborder: true,
                onPressed: () {
                  String? currentDB = ref.read(syncCurrenDBProvider);
                  currentDB == "local"
                      ? ref.read(syncCurrenDBProvider.notifier).state = null
                      : ref.read(syncCurrenDBProvider.notifier).state = "local";
                },
              ),
              const SyncDBNameCard(
                title: "Telefon",
              )
            ],
          ),
        ),
        ProgressSyncScreen(),
        Positioned(
          left: 0,
          top: 5,
          child: PageNameBar(
            pageName: "Senkronizasyon",
            color: ColorUiHelper.syncPageMainColor,
            width: screen.width * 0.7,
          ),
        )
      ],
    );
  }

  void createAnimation() {
    AnimationControll.createSyncPageAnimation(this, context);
  }

  @override
  void dispose() {
    AnimationControll.syncDispose();
    super.dispose();
  }
}
