

part of 'breeds_cubit.dart';

abstract class BreedsState extends Equatable {
  const BreedsState();

  @override
  List<Object?> get props => [];
}

class BreedsInitial extends BreedsState {}

class BreedsLoading extends BreedsState {}

class BreedsSuccess extends BreedsState {
  final List<BreedModel> breeds;

  const BreedsSuccess(this.breeds);

  @override
  List<Object?> get props => [breeds];
}

class BreedsError extends BreedsState {
  final String message;

  const BreedsError(this.message);

  @override
  List<Object?> get props => [message];
}
