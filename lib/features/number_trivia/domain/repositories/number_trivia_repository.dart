import 'package:dartz/dartz.dart';
import 'package:tdd/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../core/errors/failures.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
}
