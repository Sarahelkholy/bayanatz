abstract class AppResponseErrorMessages {
  AppResponseErrorMessages._();

  // Network & General Errors
  static const String connectionTimeoutMessage =
      'Connection timeout.\nPlease check your internet connection and try again.';

  static const String sendTimeoutMessage =
      'Request took too long to send.\nPlease try again.';

  static const String receiveTimeoutMessage =
      'Server took too long to respond.\nPlease try again later.';

  static const String badCertificateMessage =
      'Security certificate error.\nPlease try again later.';

  static const String requestCancelledMessage = 'Request was cancelled.';

  static const String connectionErrorMessage =
      'No internet connection.\nPlease check your network.';

  static const String unknownErrorMessage =
      'Something went wrong.\nPlease try again.';

  static const String unexpectedErrorMessage =
      'Unexpected error occurred.\nPlease try again.';

  // Firebase Auth Errors
  static const String userNotFound = 'No user found for that email.';
  static const String wrongPassword = 'Wrong password provided for that user.';
  static const String emailAlreadyInUse =
      'The account already exists for that email.';
  static const String invalidEmail = 'The email address is badly formatted.';
  static const String weakPassword = 'The password provided is too weak.';
  static const String userDisabled = 'This user has been disabled.';
  static const String operationNotAllowed =
      'Operation not allowed. Please check your Firebase console settings.';
  static const String firebaseAuthDefault =
      'An authentication error occurred. Please try again.';

  // HTTP / API Status Code Keys (Localization keys)
  static const String error400 = 'errors.error400';
  static const String error401 = 'errors.error401';
  static const String error403 = 'errors.error403';
  static const String error404 = 'errors.error404';
  static const String error408 = 'errors.error408';
  static const String error429 = 'errors.error429';
  static const String error500 = 'errors.error500';
  static const String error502 = 'errors.error502';
  static const String error503 = 'errors.error503';
  static const String error504 = 'errors.error504';
  static const String defaultError = 'errors.defaultError';
}
