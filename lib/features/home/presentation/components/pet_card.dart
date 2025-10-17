import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text.dart';

class PetCard extends StatelessWidget {
  final bool isHorizontal;
  final String name, describtion, lifeSpan;


  const PetCard({super.key, this.isHorizontal = false, required this.name, required this.describtion, required this.lifeSpan});

  @override
  Widget build(BuildContext context) {
    final image = "animal_1";

    return Container(
      width: isHorizontal ? double.infinity : 160,
      margin: isHorizontal ? const EdgeInsets.only(bottom: 12) : null,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorsManager.cardBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment:
            isHorizontal ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              Utils.getAssetPNGPath(image),
              width: isHorizontal ? 80 : 140.width,
              height: isHorizontal ? 80 : 140.height,
              fit: BoxFit.cover,
            ),
          ),
          if (isHorizontal) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(title: name, style: Styles.h3Regular()),
                  AppText(title: describtion, style: Styles.bodySmall()),
                  Gap(8),
                  AppText(title: lifeSpan, style: Styles.labelSmall()),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
