import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tdd/core/errors/exceptions.dart';

import 'package:tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tdd/features/number_trivia/domain/repositories/number_trivia_repository.dart';

import '../datasources/number_trivia_remote_data_source.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;

  NumberTriviaRepositoryImpl(this.numberTriviaRemoteDataSource);

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      try {
        final remoteTrivia =
            await numberTriviaRemoteDataSource.getConcreteNumberTrivia(number);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
