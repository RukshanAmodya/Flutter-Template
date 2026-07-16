class Validators {
  Validators._();

  // Email Validator
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Password Validator (Minimum 8 chars, 1 letter, 1 number)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final uppercaseRegExp = RegExp(r'[A-Z]');
    final lowercaseRegExp = RegExp(r'[a-z]');
    final digitsRegExp = RegExp(r'[0-9]');
    final specialRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!uppercaseRegExp.hasMatch(value) || !lowercaseRegExp.hasMatch(value)) {
      return 'Password must contain both uppercase and lowercase letters';
    }
    if (!digitsRegExp.hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!specialRegExp.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  // Phone Number Validator
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    // Matches most mobile numbers format
    final phoneRegExp = RegExp(r'^\+?[0-9]{9,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // Standard Required Field Validator
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }
}
