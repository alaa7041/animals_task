
class ValidatorUtils {
  static const String _requiredFieldKey = 'This field is required';
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _requiredFieldKey;
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    } else if (!RegExp(r"^[\p{L} ,.'-]*$",
            caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(value)) {
      return 'Invalid name';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    } else if (!RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
      return 'Invalid password';
    }
    return null;
  }

  // vlidate password confirm
  static String? validatePasswordConfirm(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    } else if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  static String? validateHighSecurityPassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Invalid password';
      } else {
        return null;
      }
    }
  }

  static String? validateEGPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateUAEPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^(?:05\d{8}|\+9715\d{8})$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static String? validateSAPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^(05|5)\d{7,8}$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}

// {
  // "This field is required" : "هذا الحقل مطلوب",
  // "Email is required" : "البريد الالكتروني مطلوب",
  // "Invalid email address" : "بريد إلكتروني غير صالح",
  // "Name is required" : "الاسم مطلوب",
  // "Invalid name" : "اسم غير صالح",
  // "Password is required" : "كلمة المرور مطلوبة",
  // "Invalid password" :  "كلمة المرور غير صالحة",
  // "Phone number is required" : "رقم الهاتف مطلوب",
  // "Invalid phone number" : "رقم الهاتف غير صالح",
  // "Password does not match" : "كلمة المرور غير متطابقة",
// }
