import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/screen_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';

class SyncCenterStateCard extends ConsumerWidget {
  SyncCenterStateCard({
    super.key,
  });
  final screen = locator<ScreenSizeHelper>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? currentDB = ref.watch(syncCurrenDBProvider);
    String text = (currentDB == null
        ? "Veri eşitleme konumu seçin!"
        : (currentDB == "synchronized"
            ? "Veriler senkronize edildi!"
            : (currentDB == "SyncError"
                ? "Senkronizasyon Hatası"
                : (currentDB == "local"
                    ? "Sunucudaki verileriniz ve telefonunuzdaki veriler telefon hafızasında eşitlenecektir."
                    : "Telefondaki verileriniz ve sunucudaki veriler sunucunuzda eşitlenecektir."))));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: screen.width * 0.9,
          height: screen.height * 0.12,
          decoration: BoxDecoration(
              border:
                  Border.all(color: ColorUiHelper.syncPageMainColor, width: 2),
              borderRadius: BorderRadius.circular(16),
              color: ColorUiHelper.appBgColor.withOpacity(0.7)),
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyleHelper.syncCenterTitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
