class TExceptions {
  final String message;

  const TExceptions(
      [this.message = "An Unknown error occurred"]);

  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Email already exists.');
      case 'invalid-email':
        return const TExceptions('Email is not valid or badly formatted.');
      case 'weak-password':
        return const TExceptions('Please enter a strong password.');
      case 'user-disabled':
        return const TExceptions('This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const TExceptions('Invalid Details, Please create an account.');
      case 'wrong-password':
        return const TExceptions('Incorrect password, please try again.');
      case 'too-many-requests':
        return const TExceptions('Too many requests, Service Temporarily blocked.');
      case 'too-many-argument':
        return const TExceptions('An invalid argument was provided to an Authentication method.');
      case 'invalid-password':
        return const TExceptions('Invalid password, please try again.');
      case 'invalid-phone-number':
        return const TExceptions('The provided Phone Number is invalid.');
      case 'operation-not-allowed':
        return const TExceptions('The provided sign-in provider is disabled for your Firebase project.');
      case 'session-cookie-expired':
        return const TExceptions('The provided Firebase session cookie is expired.');
      case 'uid-already-exists':
        return const TExceptions('The provided uid is already in use by an existing user.');
      default:
        return const TExceptions();
    }
  }
}
