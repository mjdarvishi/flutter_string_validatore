//exceptions class

import 'package:strings_validator/validation/exceptions/exceptions.dart';
import 'package:strings_validator/validation/messages.dart';

//main class for all validations
class MainValidator {
  Map<String, String>? messages;
  Message errors = Message();
  //if message pass to method it will override
  MainValidator(Map? messages) {
    if (messages != null) {
      for (var param in messages.entries) {
        switch (param.key) {
          case 'required':
            errors.empty = param.value;
            break;
          case 'min':
            errors.minLength = param.value;
            break;
          case 'max':
            errors.maxLength = param.value;
            break;
          case 'number':
            errors.number = param.value;
            break;
          case 'alpha':
            errors.alpha = param.value;
            break;
          case 'email':
            errors.email = param.value;
            break;
          case 'upperCase':
            errors.existUpperCase = param.value;
            break;
          case 'specialChar':
            errors.existSepChar = param.value;
            break;
        }
      }
    }
  }
}

//abstract class with provide a basic class for all kind of out validation
abstract class Validator extends MainValidator {
  Validator(messages) : super(messages);

  String? validate(String input);
}

//check max length
class MaxLengthValidator extends Validator {
  int size;
  MaxLengthValidator(messages, {required this.size}) : super(messages);

  @override
  String? validate(String input) {
    try {
      if (input.length > size) {
        throw LengthFormatException(errors.maxLength);
      }
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }
}

//check min length
class MinLengthValidator extends Validator {
  int size;
  MinLengthValidator(messages, {required this.size}) : super(messages);

  @override
  String? validate(String input) {
    try {
      if (input.length < size) {
        throw LengthFormatException(errors.minLength);
      }
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }
}

//check empty value
class RequiredValidator extends Validator {
  RequiredValidator(messages) : super(messages);

  @override
  String? validate(String input) {
    try {
      if (input.isEmpty) {
        throw EmptyException(errors.empty);
      }
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }
}

//check number format
class NumberValidator extends Validator {
  NumberValidator(messages) : super(messages);

  @override
  String? validate(String input) {
    try {
      if (!RegExp(r'^-?[0-9]+$').hasMatch(input)) {
        throw NumberException(errors.number);
      }
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }
}

//check alphabet format
class AlphabetValidator extends Validator {
  AlphabetValidator(messages) : super(messages);

  @override
  String? validate(String input) {
    try {
      if (!RegExp(r'^[a-zA-Z_]*$').hasMatch(input)) {
        throw AlphabetException(errors.alpha);
      }
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }
}

//check email format
class EmailValidator extends Validator {
  EmailValidator(messages) : super(messages);

  @override
  String? validate(String input) {
    try {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(input)) {
        throw FormatException(errors.email);
      }
    } on BaseException catch (e) {
      return e.message;
    }
    return null;
  }
}

//check upper case
class UpperCaseValidator extends Validator {
  UpperCaseValidator(messages) : super(messages);

  @override
  String? validate(String input) {
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(input)) {
      throw UpperCasePasswordException(errors.existUpperCase);
    }
    return null;
  }
}

//check special chat in string
class SpecialCharacterValidator extends Validator {
  SpecialCharacterValidator(messages) : super(messages);

  @override
  String? validate(String input) {
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(input)) {
      throw SepCharacterPasswordException(errors.existSepChar);
    }
    return null;
  }
}

//validation for string
//max:3
//min:2
//required
//number
//alpha
//email
//upperCase
//specialChar

//main method for validating string
extension StringValidation on String {
  String? validate(String param, {Map<String, String>? messages}) {
    String? errMessage;
    List<String> params = param.split('|').reversed.toList();
    for (var item in params) {
      if (!item.contains(':')) {
        switch (item) {
          case 'required':
            errMessage =
                RequiredValidator(messages).validate(this) ?? errMessage;
            break;
          case 'number':
            errMessage = NumberValidator(messages).validate(this) ?? errMessage;
            break;
          case 'alpha':
            errMessage =
                AlphabetValidator(messages).validate(this) ?? errMessage;
            break;
          case 'email':
            errMessage = EmailValidator(messages).validate(this) ?? errMessage;
            break;
          case 'upperCase':
            errMessage =
                UpperCaseValidator(messages).validate(this) ?? errMessage;
            break;
          case 'specialChar':
            errMessage = SpecialCharacterValidator(messages).validate(this) ??
                errMessage;
            break;
        }
      } else {
        List<String> items = item.split(':');
        switch (items[0]) {
          case 'max':
            errMessage = MaxLengthValidator(messages, size: int.parse(items[1]))
                    .validate(this) ??
                errMessage;
            break;
          case 'min':
            errMessage = MinLengthValidator(messages, size: int.parse(items[1]))
                    .validate(this) ??
                errMessage;
            break;
        }
      }
    }
    return errMessage;
  }
}
