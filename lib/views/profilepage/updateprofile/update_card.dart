import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/views/profilepage/updateprofile/update_mail.dart';
import 'package:yakit_asistan/views/profilepage/updateprofile/update_name.dart';
import 'package:yakit_asistan/views/profilepage/updateprofile/update_password.dart';

class UpdateProfileCardContent extends ConsumerWidget {
  const UpdateProfileCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int updateProfile = ref.watch(updateProfileProvider);
    return updateProfile == 0
        ? UpdateMailCard()
        : (updateProfile == 1 ? UpdatePasswordCard() : UpdateUserNameCard());
  }
}
