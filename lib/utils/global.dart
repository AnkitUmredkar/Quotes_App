import 'package:flutter/material.dart';

Color bgColor = const Color(0xff101012);
Color buttonColor = const Color(0xff8A98B7);
// todo------------------------------> Popular
List popularImage = [
  'assets/images/HomePage_Images/love.jpg',
  'assets/images/HomePage_Images/life.jpg',
  'assets/images/HomePage_Images/work.jpg',
  'assets/images/HomePage_Images/mom.jpg',
  'assets/images/HomePage_Images/friends.jpg',
  'assets/images/HomePage_Images/motivation.jpg',
];

List popularText = [
  'Love  ',
  'Life  ',
  'Work  ',
  'Mom  ',
  'Friendship  ',
  'Motivation  ',
];

// todo------------------------------> Motivation
List motivationImage = [
  'assets/images/HomePage_Images/Motivation_Images/inspiration.jpg',
  'assets/images/HomePage_Images/Motivation_Images/motivation.jpg',
  'assets/images/HomePage_Images/Motivation_Images/courage.jpg',
  'assets/images/HomePage_Images/Motivation_Images/freedome.jpg',
  'assets/images/HomePage_Images/Motivation_Images/intelligence.jpg',
  'assets/images/HomePage_Images/Motivation_Images/knowledge.jpg',
];

List motivationText = [
  'Inspiration  ',
  'Motivation  ',
  'Courage  ',
  'Freedom  ',
  'Intelligence  ',
  'Knowledge  ',
];

// todo------------------------------> Feelings
List feelingsImage = [
  'assets/images/HomePage_Images/Feelings_Images/alone.jpg',
  'assets/images/HomePage_Images/Feelings_Images/sad.jpg',
  'assets/images/HomePage_Images/Feelings_Images/trust.jpg',
  'assets/images/HomePage_Images/Feelings_Images/revenge.jpg',
  'assets/images/HomePage_Images/Feelings_Images/attitude.jpg',
  'assets/images/HomePage_Images/Feelings_Images/angry.jpg',
];

List feelingsText = [
  'Alone  ',
  'Sad  ',
  'Trust  ',
  'Revenge  ',
  'Attitude  ',
  'Anger  ',
];

// todo------------------------------> Family
List familyImage = [
  'assets/images/HomePage_Images/Family_Images/family.jpg',
  'assets/images/HomePage_Images/Family_Images/mom.jpg',
  'assets/images/HomePage_Images/Family_Images/dad.jpg',
  'assets/images/HomePage_Images/Family_Images/home.jpg',
  'assets/images/HomePage_Images/Family_Images/friends.jpg',
  'assets/images/HomePage_Images/Family_Images/parenting.jpg',
];

List familyText = [
  'Family  ',
  'Mom  ',
  'Dad  ',
  'Home  ',
  'Friends  ',
  'Parenting  ',
];

// todo------------------------------> Moments
List momentsImage = [
  'assets/images/HomePage_Images/Moments_Images/anniversary.jpg',
  'assets/images/HomePage_Images/Moments_Images/birthday.jpg',
  'assets/images/HomePage_Images/Moments_Images/dating.jpg',
  'assets/images/HomePage_Images/Moments_Images/wedding.jpg',
  'assets/images/HomePage_Images/Moments_Images/romantic.jpg',
  'assets/images/HomePage_Images/Moments_Images/death.jpg',
];

List momentsText = [
  'Anniversary  ',
  'Birthday  ',
  'Romantic  ',
  'Wedding  ',
  'Dating  ',
  'Death  ',
];

// todo------------------------------> Other
List otherImage = [
  'assets/images/HomePage_Images/Other/god.jpg',
  'assets/images/HomePage_Images/Other/age.jpg',
  'assets/images/HomePage_Images/Other/change.jpg',
  'assets/images/HomePage_Images/Other/communication.jpg',
  'assets/images/HomePage_Images/Other/env.jpg',
  'assets/images/HomePage_Images/Other/dreams.jpg',
];

List otherText = [
  'God  ',
  'Age  ',
  'change  ',
  'communication  ',
  'environment  ',
  'dreams  ',
];

Text headingOfHomepage(double width, String data) {
  return Text(
    data,
    style: TextStyle(
        color: Colors.white, fontFamily: 'gc_m', fontSize: width * 0.053),
  );
}
