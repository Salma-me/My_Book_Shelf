import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errMessage: 'Request not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'Internal server error, please try later',
      );
    } else {
      return ServerFailure(
        errMessage: 'Oops there was an error, please try later',
      );
    }
  }

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Recieve Timeout with ApiServer');
      case DioExceptionType.badCertificate:
      return ServerFailure(
        errMessage: 'Bad certificate from the server',
      );
      case DioExceptionType.badResponse:
              return ServerFailure.fromResponse(
        dioError.response!.statusCode!,
        dioError.response!.data,
      );
      case DioExceptionType.cancel:
      return ServerFailure(
        errMessage: 'Request to the server was cancelled',
      );
      case DioExceptionType.connectionError:
      return ServerFailure(
        errMessage: 'No internet connection',
      );
      case DioExceptionType.unknown:
      return ServerFailure(
        errMessage: 'Unexpected error occurred, please try again',
      );
      default:
            return ServerFailure(
        errMessage: 'Oops there was an error, please try later',
      );
    }
  }
}
