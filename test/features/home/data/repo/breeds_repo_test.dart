import 'package:animals_task/core/network_utils/api_error_model.dart';
import 'package:animals_task/core/network_utils/api_service.dart';
import 'package:animals_task/core/network_utils/network_status_info.dart';
import 'package:animals_task/features/home/data/models/breeds_model.dart';
import 'package:animals_task/features/home/data/repo/breeds_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'breeds_repo_test.mocks.dart';

@GenerateMocks([ApiService, NetworkStatusInfo])
void main() {
  late BreedsRepo breedsRepo;
  late MockApiService mockApiService;
  late MockNetworkStatusInfo mockNetworkStatusInfo;

  setUp(() {
    mockApiService = MockApiService();
    mockNetworkStatusInfo = MockNetworkStatusInfo();
    breedsRepo = BreedsRepo(mockApiService, mockNetworkStatusInfo);
  });

  group('BreedsRepo Tests', () {
    test('should return success when API call succeeds', () async {
      final mockBreeds = [BreedModel(id: 'abys', name: 'Abyssinian')];

      when(mockNetworkStatusInfo.isConnected).thenAnswer((_) async => true);
      when(mockApiService.getBreeds()).thenAnswer((_) async => mockBreeds);

      final result = await breedsRepo.getBreeds();

      result.when(
        success: (data) {
          expect(data, isA<List<BreedModel>>());
          expect(data.first.name, 'Abyssinian');
        },
        error: (error) =>
            fail('Expected success but got error: ${error.message}'),
      );
    });

    test('should return error when there is no internet', () async {
      when(mockNetworkStatusInfo.isConnected).thenAnswer((_) async => false);

      final result = await breedsRepo.getBreeds();

      result.when(
        success: (_) => fail('Expected error but got success'),
        error: (error) {
          expect(error, isA<ApiErrorModel>());
          expect(error.message, contains('No internet'));
        },
      );
    });
  });
}
