import 'package:animal_app/core/networking/api_constants.dart';
import 'package:animal_app/core/networking/api_error_model.dart';
import 'package:dio/dio.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseStatusCode {
  // Success codes (don't use these for error handling!)
  static const int SUCCESS = 200; // success with data
  static const int CREATED = 201; // success - resource created
  static const int ACCEPTED = 202; // success - request accepted
  static const int NO_CONTENT = 204; // success with no data

  // Error codes
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; // failure, API rejected request
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API, LOGIC ERROR
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side

  // Local status codes (for Dio errors)
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTORISED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;
  static const String NOT_FOUND = ApiErrors.notFoundError;

  // Local status messages
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.NO_CONTENT,
            error: [ResponseMessage.NO_CONTENT]);
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.BAD_REQUEST,
            error: [ResponseMessage.BAD_REQUEST]);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.FORBIDDEN,
            error: [ResponseMessage.FORBIDDEN]);
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.UNAUTORISED,
            error: [ResponseMessage.UNAUTORISED]);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.NOT_FOUND,
            error: [ResponseMessage.NOT_FOUND]);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.INTERNAL_SERVER_ERROR,
            error: [ResponseMessage.INTERNAL_SERVER_ERROR]);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.CONNECT_TIMEOUT,
            error: [ResponseMessage.CONNECT_TIMEOUT]);
      case DataSource.CANCEL:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.CANCEL,
            error: [ResponseMessage.CANCEL]);
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.RECIEVE_TIMEOUT,
            error: [ResponseMessage.RECIEVE_TIMEOUT]);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.SEND_TIMEOUT,
            error: [ResponseMessage.SEND_TIMEOUT]);
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.CACHE_ERROR,
            error: [ResponseMessage.CACHE_ERROR]);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.NO_INTERNET_CONNECTION,
            error: [ResponseMessage.NO_INTERNET_CONNECTION]);
      case DataSource.DEFAULT:
        return ApiErrorModel(
            statusCode: ResponseStatusCode.DEFAULT,
            error: [ResponseMessage.DEFAULT]);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusCode != null) {
        // Only try to parse as error if status code indicates an error (400+)
        if (error.response!.statusCode! >= 400) {
          try {
            return ApiErrorModel.fromJson(error.response!.data);
          } catch (e) {
            // If parsing fails, return a default error
            return DataSource.DEFAULT.getFailure();
          }
        }
      }
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.unknown:
      if (error.response != null && error.response?.statusCode != null) {
        if (error.response!.statusCode! >= 400) {
          try {
            return ApiErrorModel.fromJson(error.response!.data);
          } catch (e) {
            return DataSource.DEFAULT.getFailure();
          }
        }
      }
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}