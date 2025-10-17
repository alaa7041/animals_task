import 'package:animals_task/features/home/data/repo/breeds_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network_utils/api_result.dart';
import '../../data/models/breeds_model.dart';

part 'breeds_state.dart';

class BreedsCubit extends Cubit<BreedsState> {
  final BreedsRepo repository;

  BreedsCubit(this.repository) : super(BreedsInitial());

  static BreedsCubit get(context) => BlocProvider.of(context);

  List<BreedModel> breeds = [];

  Future<void> fetchBreeds() async {
    emit(BreedsLoading());
    final ApiResult<List<BreedModel>> response = await repository.getBreeds();

    response.when(
      success: (data) {
        breeds = data;
        emit(BreedsSuccess(breeds));
      },
      error: (error) {
        emit(BreedsError(error.message ?? "Something went wrong"));
      },
    );
  }
}
