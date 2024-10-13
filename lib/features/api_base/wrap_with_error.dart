import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:logger/logger.dart';

import 'error_response_model.dart';

extension WrapWithError<T> on Future<T> {
  Future<Either<T, ErrorResponseModel>> wrapWithError() async {
    try {
      return Left(await this);
    } on DioException catch (e) {
      Logger().e(e.response?.data);
      try {
        return Right(ErrorResponseModel.fromJson(e.response?.data));
      } catch (e2) {
        return Right(ErrorResponseModel(
            error: e.response?.data.toString() ?? 'Unknown error'));
      }
    }
  }
}

extension IsError<T> on Either<T, ErrorResponseModel> {
  bool get isError => isRight;
}
