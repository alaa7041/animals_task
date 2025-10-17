import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text.dart';

class PetCategoryList extends StatelessWidget {
  const PetCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Dogs', 'Cats', 'Birds', 'Rabbits'];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: i == 0
                ? ColorsManager.primary
                : ColorsManager.lightMintBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: AppText(
            title: categories[i],
            style: Styles.bodyRegular().copyWith(
              color: i == 0 ? Colors.white : ColorsManager.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
