import 'package:flutter/material.dart';
import 'package:gachtaxi_app/common/constants/spacing.dart';
import 'package:gachtaxi_app/common/constants/typography.dart';
import 'package:gachtaxi_app/common/util/user_storage.dart';

class Pofile extends StatelessWidget {
  const Pofile({super.key});

  Future<Map<String, String?>> _loadUserInfo() async {
    final nickname = await UserStorage.getNickname();
    final studentNumber = await UserStorage.getStudentNumber();
    final profilePicture = await UserStorage.getProfilePicture();

    return {
      'nickname': nickname,
      'studentNumber': studentNumber,
      'profilePicture': profilePicture,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: _loadUserInfo(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        final nickname = snapshot.data!['nickname'] ?? '닉네임 없음';
        final studentNumber = snapshot.data!['studentNumber'] ?? '00000000';
        final profilePicture = snapshot.data!['profilePicture'];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: profilePicture != null && profilePicture.isNotEmpty
                  ? Image.network(
                profilePicture,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                'assets/icons/profile_on_icon.svg',
                width: 56,
                height: 56,
              ),
            ),
            const SizedBox(width: AppSpacing.spaceCommon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nickname,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppTypography.fontSizeLarge,
                  ),
                ),
                Text(
                  '학번 : $studentNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: AppTypography.fontWeightSemibold,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
