import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:common_extension/common_extension.dart';
import 'package:car/utils/shared_pref_util.dart';
import 'package:car/navigation/route_names.dart';
import 'package:car/widgets/common/common_image.dart';
import 'package:car/constants/image_const.dart';
import 'package:car/theme/color_palette.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> _logout(BuildContext context) async {
    await SharedPrefUtil.clear();
    if (!context.mounted) return;
    context.go(RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CommonImage(
            imageUrl: ImageConst.userProfileLarge,
            width: 100,
            height: 100,
            radius: 50,
          ),
          const SizedBox(height: 16),
          Text('User Profile', style: context.headlineMedium),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.buttonDanger,
              foregroundColor: ColorPalette.textOnPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
