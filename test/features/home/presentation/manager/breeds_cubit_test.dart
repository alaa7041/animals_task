import 'package:animals_task/core/network_utils/api_error_model.dart';
import 'package:animals_task/features/home/data/models/breeds_model.dart';
import 'package:animals_task/features/home/data/repo/breeds_repo.dart';
import 'package:animals_task/core/network_utils/api_result.dart';
import 'package:animals_task/features/home/presentation/manager/breeds_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBreedsRepo extends Mock implements BreedsRepo {}

void main() {
  late BreedsCubit cubit;
  late MockBreedsRepo mockRepo;

  setUp(() {
    mockRepo = MockBreedsRepo();
    cubit = BreedsCubit(mockRepo);
  });

  tearDown(() {
    cubit.close();
  });

  group('BreedsCubit Tests', () {
    final breedsList = [
      BreedModel(id: "1", name: 'Golden Retriever'),
      BreedModel(id: "2", name: 'Bulldog'),
    ];

    blocTest<BreedsCubit, BreedsState>(
      'emits [BreedsLoading, BreedsSuccess] when fetchBreeds succeeds',
      build: () {
        when(() => mockRepo.getBreeds()).thenAnswer(
          (_) async => ApiResult.success(breedsList),
        );
        return cubit;
      },
      act: (cubit) => cubit.fetchBreeds(),
      expect: () => [
        BreedsLoading(),
        BreedsSuccess(breedsList),
      ],
      verify: (_) {
        verify(() => mockRepo.getBreeds()).called(1);
      },
    );

    blocTest<BreedsCubit, BreedsState>(
      'emits [BreedsLoading, BreedsError] when fetchBreeds fails',
      build: () {
        when(() => mockRepo.getBreeds()).thenAnswer(
          (_) async => ApiResult.error(
            ApiErrorModel(
              message: 'Network Error',
            )
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.fetchBreeds(),
      expect: () => [
        BreedsLoading(),
        isA<BreedsError>(),
      ],
    );
  });
}
