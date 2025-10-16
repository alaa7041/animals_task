import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class PetCard extends StatelessWidget {
  final bool isHorizontal;
  const PetCard({super.key, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    final image = 'assets/images/dog.png';

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
              image,
              width: isHorizontal ? 80 : 140,
              height: isHorizontal ? 80 : 140,
              fit: BoxFit.cover,
            ),
          ),
          if (isHorizontal) ...[
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Charlie', style: Styles.h3Regular()),
                  Text('Golden Retriever', style: Styles.bodySmall()),
                  const SizedBox(height: 8),
                  Text('2 years old', style: Styles.labelSmall()),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
