import 'package:strings_validator/validation/validation.dart';

void testMethod() {
  // options are:
  //max:3
  //min:2
  //required
  //number
  //alpha
  //email
  //upperCase
  //specialChar
  String test = 'this is your string';
  const pattern = 'min:6|max:12|email|required';
  Map<String,String> myMessages= {
    'max':'max length of your input should be 12 char',
    'min':'min length of your input should be 6 char',
    'email':'your input is not a email and its format is incorrect'
  };
  var result= test.validate(pattern,messages:myMessages);
  // ignore: avoid_print
  print(result); //if string will be matched demonstrates null else demonstrates error message

}
