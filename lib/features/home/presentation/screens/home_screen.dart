import 'package:animals_task/core/di/dependency_injection.dart';
import 'package:animals_task/core/global/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/colors.dart';
import '../../domain/cubit/breeds_cubit.dart';
import '../components/home_app_bar.dart';
import '../components/pet_card.dart';
import '../components/pet_category_list.dart';
import '../components/search_field.dart';
import '../components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BreedsCubit>()..fetchBreeds(),
      child: Scaffold(
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
              BlocBuilder<BreedsCubit, BreedsState>(
                builder: (context, state) {
                  if (state is BreedsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BreedsSuccess) {
                    return Expanded(
                      flex: 2,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final breed = state.breeds[index];
                            //breed.name
                            return PetCard(
                              isHorizontal: true,
                              name: breed.name,
                              describtion: breed.description ?? "",
                              lifeSpan: breed.lifeSpan ?? "",
                            );
                          },
                          separatorBuilder: (context, index) => Gap(10),
                          itemCount: state.breeds.length),
                    );
                  }
                  return Center(child: Text("error"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
