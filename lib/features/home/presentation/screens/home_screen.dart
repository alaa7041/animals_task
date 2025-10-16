import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../components/home_app_bar.dart';
import '../components/search_field.dart';
import '../components/pet_category_list.dart';
import '../components/section_title.dart';
import '../components/pet_card.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            const SizedBox(height: 20),
            const PetCategoryList(),
            const SizedBox(height: 20),
            SectionTitle(title: 'Popular Pets'),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, i) => const PetCard(),
              ),
            ),
            const SizedBox(height: 24),
            SectionTitle(title: 'Recommended'),
            const SizedBox(height: 12),
            Column(
              children: List.generate(3, (_) => const PetCard(isHorizontal: true)),
            ),
          ],
        ),
      ),
    );
  }
}
