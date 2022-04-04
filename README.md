This package is a validation package which helps you to validate strings.If the string has correct format 
the validate method returns null and if string does not match to what you like validate method returns error message.

## Features
<h2>verity options:</h2></br>
    <b>1-min length</b></br>
    <b>2-max length</b></br>
    <b>3-required (not empty)</b></br>
    <b>4-is number</b> </br>
    <b>5-is alphabet</b></br>
    <b>6-is email</b></br>
    <b>7-contains a upperCase</b></br>
    <b>8-contains a special characters</b></br></br>

    
## Getting started

<p>For using this package you just to need add it to your pubspec.yaml file.</p>
<b>
strings_validator :last version </b>
  <br><br/>
After that import it where ever you want to use it.

<b>`import 'package:strings_validator/validation/validation.dart';`</b>



And finally call validate method on each string you are trying to validate.This method has two param first one is 
what option you want and second one is a map of message which you want to will be overrode

## Usage
<h2>options are:</h2>
<b> 1-max:3</b><br>
<b>2-min:2</b></br>
<b> 3-required</b></br>
<b>  4-number</b></br>
<b>  5-alpha</b></br>
<b>  6-email</b></br>
<b>  7-upperCase</b></br>
<b>  8-specialChar</br>
  </br></br>
  
```dart
 String test = 'this is your string';
 const String  pattern = 'min:6|max:12|email|required';
 Map<String,String> MyMessages= {
                         'max':'max length of your input should be 12 char',
                         'min':'min length of your input should be 6 char',
                         'email':'your input is not a email and its format is incorrect'
                       };
 String? result= test.validate(pattern,messages:MyMessages);
   print(result); //if string will be matched demonstrates null else demonstrates error message

```

## Additional information

You can contribute on github https://github.com/mjdarvishi
