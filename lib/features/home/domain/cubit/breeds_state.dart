part of 'breeds_cubit.dart';

abstract class BreedsState {}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {}

class BreedsSuccess extends BreedsState {
  final List<BreedModel> breeds;
  BreedsSuccess(this.breeds);
}

class BreedsError extends BreedsState {
  final String message;
  BreedsError(this.message);
}
