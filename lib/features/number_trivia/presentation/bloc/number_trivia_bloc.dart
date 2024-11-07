import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

import '../../domain/entities/number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;

  NumberTriviaBloc(this.getConcreteNumberTrivia)
      : super(NumberTriviaInitial()) {
    on<GetTriviaForConcreteNumber>((event, emit) async {
      emit(Loading());
      final result = await getConcreteNumberTrivia(Params(number: 2));
      result.fold(
        (l) => emit(Error(message: 'prolemas')),
        (r) => emit(Loaded(trivia: r)),
      );
    });
  }
}
