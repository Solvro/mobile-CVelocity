import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'error_response_model.dart';

extension WrapWithError<T> on Future<T> {
  Future<Either<T, ErrorResponseModel>> wrapWithError() async {
    try {
      return Left(await this);
    } on DioException catch (e) {
      return Right(ErrorResponseModel.fromJson(e.response?.data));
    }
  }
}

extension IsError<T> on Either<T, ErrorResponseModel> {
  bool get isError => isRight;
}
