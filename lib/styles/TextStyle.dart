import 'package:flutter/material.dart';

var WelcomeTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24,
  shadows: List.of(
    {
      Shadow(blurRadius: 10, color: Colors.grey, offset: Offset(10, 10)),
      Shadow(blurRadius: 10, color: Colors.grey, offset: Offset(10, 10))
    },
  ),
);

const TitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize:28
);

const SecondaryHeaderTextStyles = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const BodyTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 18
);

const captionTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 14
);