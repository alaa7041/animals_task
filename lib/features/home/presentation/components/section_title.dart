import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: title,
      style: Styles.font20Bold(),
    );
  }
}
