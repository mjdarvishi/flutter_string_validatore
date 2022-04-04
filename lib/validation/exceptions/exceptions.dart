//exceptions class

class BaseException implements Exception{
  final String? message;

  BaseException(this.message);
}
class FormatException extends BaseException {
  FormatException(message) : super(message);
}
class EmptyException extends BaseException {

  EmptyException(message) : super(message);
}
class NumberException extends BaseException {
  NumberException(message) : super(message);
}
class AlphabetException extends BaseException {

  AlphabetException(message) : super(message);
}

class UpperCasePasswordException extends BaseException{
    UpperCasePasswordException(message) : super( message);
}
class NumberPasswordException extends BaseException{
  NumberPasswordException(message) : super(message);
}
class SepCharacterPasswordException extends BaseException{
  SepCharacterPasswordException(message) : super(message);
}
class LengthFormatException extends BaseException {
  LengthFormatException(message) : super(message);
}
