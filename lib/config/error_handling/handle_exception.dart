import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/values/app_response_error_messages.dart';

class NetworkException {
  static String getMessageError(Exception exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return AppResponseErrorMessages.connectionTimeoutMessage;

        case DioExceptionType.sendTimeout:
          return AppResponseErrorMessages.sendTimeoutMessage;

        case DioExceptionType.receiveTimeout:
          return AppResponseErrorMessages.receiveTimeoutMessage;

        case DioExceptionType.badCertificate:
          return AppResponseErrorMessages.badCertificateMessage;

        case DioExceptionType.badResponse:
          return _handleMessageResponse(exception);

        case DioExceptionType.cancel:
          return AppResponseErrorMessages.requestCancelledMessage;

        case DioExceptionType.connectionError:
          return AppResponseErrorMessages.connectionErrorMessage;

        case DioExceptionType.unknown:
          return AppResponseErrorMessages.unknownErrorMessage;
        case DioExceptionType.transformTimeout:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    } else if (exception is FirebaseAuthException) {
      // Handle specific Firebase Auth errors gracefully
      return _handleFirebaseAuthException(exception);
    } else if (exception is FirebaseException) {
      // Handle general Firebase errors (Firestore, Core, etc.)
      return exception.message ??
          AppResponseErrorMessages.unexpectedErrorMessage;
    } else {
      return AppResponseErrorMessages.unexpectedErrorMessage;
    }
  }

  static String _handleFirebaseAuthException(FirebaseAuthException e) {
    // Return custom/localized messages based on the Firebase error code if available,
    // otherwise fallback to the exception's message or a default string.
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'operation-not-allowed':
        return 'Operation not allowed. Please check your Firebase console settings.';
      case 'network-request-failed':
        return AppResponseErrorMessages.connectionErrorMessage;
      default:
        return e.message ??
            'An authentication error occurred. Please try again.';
    }
  }

  static String _handleMessageResponse(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      if (data is Map<String, dynamic>) {
        if (data['message'] != null) {
          return data['message'].toString();
        }
        if (data['error'] != null) {
          return data['error'].toString();
        }
      }

      switch (statusCode) {
        case 400:
          return AppResponseErrorMessages.error400;
        case 401:
          return AppResponseErrorMessages.error401;
        case 403:
          return AppResponseErrorMessages.error403;
        case 404:
          return AppResponseErrorMessages.error404;
        case 408:
          return AppResponseErrorMessages.error408;
        case 429:
          return AppResponseErrorMessages.error429;
        case 500:
          return AppResponseErrorMessages.error500;
        case 502:
          return AppResponseErrorMessages.error502;
        case 503:
          return AppResponseErrorMessages.error503;
        case 504:
          return AppResponseErrorMessages.error504;
        default:
          return 'Server error (${statusCode ?? 'unknown'}). Please try again.';
      }
    }

    return AppResponseErrorMessages.defaultError;
  }
}
