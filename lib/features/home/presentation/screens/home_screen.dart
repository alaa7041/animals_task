import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/colors.dart';
import '../components/home_app_bar.dart';
import '../components/pet_card.dart';
import '../components/pet_category_list.dart';
import '../components/search_field.dart';
import '../components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HomeAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.radius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            Gap(20),
            const PetCategoryList(),
            Gap(20),
            SectionTitle(title: 'Categories'),
            Gap(20),
            Expanded(
              flex: 2,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return PetCard(isHorizontal: true);
                  },
                  separatorBuilder: (context, index) => Gap(10),
                  itemCount: 5),
            ),
          ],
        ),
      ),
    );
  }
}
