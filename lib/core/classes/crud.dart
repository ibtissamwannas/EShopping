import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_shopping/core/classes/status_request.dart';
import 'package:e_shopping/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.failure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
