import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/utils.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text.dart';

class PetCard extends StatelessWidget {
  final bool isHorizontal;
  const PetCard({super.key, this.isHorizontal = false});

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
                  AppText(title: 'Charlie', style: Styles.h3Regular()),
                  AppText(title: 'Golden Retriever', style: Styles.bodySmall()),
                  const SizedBox(height: 8),
                  AppText(title: '2 years old', style: Styles.labelSmall()),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
