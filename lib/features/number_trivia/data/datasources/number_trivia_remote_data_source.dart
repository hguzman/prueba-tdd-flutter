import 'package:http/http.dart' as http;
import 'package:tdd/core/errors/exceptions.dart';
import 'dart:convert';
import 'package:tdd/features/number_trivia/data/models/number_trivia_model.dart';

class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    var url = 'http://numbersapi.com/$number';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      NumberTriviaModel.fromJson(json.decode(response.body));
      return jsonDecode(response.body);
    } else {
      throw ServerException();
    }
  }
}
