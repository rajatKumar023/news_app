import 'package:flutter/material.dart';

abstract class Styles {
  static const BLACK_COLOR = Colors.black;
  static const WHITE_COLOR = Colors.white;
  static const GREEN_COLOR = Colors.green;
  static const BLUE_COLOR = Colors.blue;
  static const GREY_COLOR = Colors.grey;
  static const RED_COLOR = Colors.red;
  static const TRANSPARENT_COLOR = Colors.transparent;

  static const String FOOD_IMAGE_URL = 'assets/food.jpg';
  static const String HEALTH_IMAGE_URL = 'assets/health.jpg';
  static const String MUSIC_IMAGE_URL = 'assets/music.jpg';
  static const String CRIME_IMAGE_URL = 'assets/crime.jpg';
  static const String BUSINESS_IMAGE_URL = 'assets/business.jpg';
  static const String WILDLIFE_IMAGE_URL = 'assets/wildlife.jpg';
  static const String JOBS_IMAGE_URL = 'assets/jobs.jpg';
  static const String CULTURE_IMAGE_URL = 'assets/culture.jpg';
  static const String TRADE_IMAGE_URL = 'assets/trade.jpg';
  static const String TOURISM_IMAGE_URL = 'assets/tourism.jpg';

  static const List<String> searchAssets = [
    FOOD_IMAGE_URL,
    HEALTH_IMAGE_URL,
    MUSIC_IMAGE_URL,
    CRIME_IMAGE_URL,
    BUSINESS_IMAGE_URL,
    WILDLIFE_IMAGE_URL,
    JOBS_IMAGE_URL,
    CULTURE_IMAGE_URL,
    TRADE_IMAGE_URL,
    TOURISM_IMAGE_URL,
  ];

  static const List<String> searchAssetsTag = [
    'Food',
    'Health',
    'Music',
    'Crime',
    'Business',
    'Wildlife',
    'Jobs',
    'Culture',
    'Trade',
    'Tourism',
  ];
}
