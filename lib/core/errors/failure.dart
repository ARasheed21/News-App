import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

    factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timed out. Please check your internet and try again.');

      case DioExceptionType.transformTimeout:
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Request timed out while sending data. Please try again.');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Server took too long to respond. Please try again.');

      case DioExceptionType.badCertificate:
        return const ServerFailure('Secure connection failed. Please contact support.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode ?? 0, 
          e.response?.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure('The request was canceled.');

      case DioExceptionType.connectionError:
        return const ServerFailure('No internet connection. Please connect to Wi-Fi or mobile data.');

      case DioExceptionType.unknown:
        if (e.message != null && e.message!.contains('SocketException')) {
          return const ServerFailure('No internet connection.');
        }
        return const ServerFailure('An unexpected error occurred. Please try again later.');
    }
  }


  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 || statusCode == 422) {
      return ServerFailure(_extractMessageFromResponse(response));
    }
    
    switch (statusCode) {
      case 404:
        return const ServerFailure('The requested resource was not found.');
      case 500:
      case 502:
      case 503:
      case 504:
        return const ServerFailure('The server is currently undergoing maintenance. Please try again shortly.');
      default:
        return const ServerFailure('Something went wrong. Please try again.');
    }
  }


  /// Safely extracts the error message from various API JSON structures
  static String _extractMessageFromResponse(dynamic response) {
    if (response == null) {
      return 'Authentication or validation error occurred.';
    }

    try {
      // Handles: response['error']['message']
      if (response is Map && response['error'] is Map && response['error']['message'] != null) {
        return response['error']['message'].toString();
      }
      
      // Handles common alternative: response['message']
      if (response is Map && response['message'] != null) {
        return response['message'].toString();
      }
      
      // Handles list-style validation errors: response['errors'][0]['message']
      if (response is Map && response['errors'] is List && response['errors'].isNotEmpty) {
        final firstError = response['errors'][0];
        if (firstError is Map && firstError['message'] != null) {
          return firstError['message'].toString();
        }
      }
    } catch (_) {
      // Fallback if parsing fails due to unexpected format type changes
    }

    return 'Invalid request details. Please check your data.';
  }

}
