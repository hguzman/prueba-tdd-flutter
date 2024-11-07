part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaState {}

class NumberTriviaInitial extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({required this.trivia});

  @override
  List<Object> get props => [trivia];
}

class Error extends NumberTriviaState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
