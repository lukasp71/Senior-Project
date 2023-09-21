import "package:flutter/material.dart";

const textIntputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2.0)));

class AppColors {
  AppColors._();

  static const Color orangeWeb = Color(0xFFf59400);
  static const Color white = Color(0xFFf5f5f5);
  static const Color lightGrey = Color(0xFFd2d7df);
  static const Color burgundy = Color(0xFF880d1e);
}

class NewsApiConstants {
  NewsApiConstants._();
  static const newsApiKey = 'ee8499f0e2a249f2a58e02a35a679c90';
  static const mediaStackApi = 'c49733599aae1bec5427af9a7bc5234b';
  static const articles = 'articles';
  static const mediaStackData = 'data';
  static const id = 'id';
  static const name = 'name';
  static const source = 'source';
  static const author = 'author';
  static const title = 'title';
  static const image = 'image';
  static const description = 'description';
  static const url = 'url';
  static const urlToImage = 'urlToImage';
  static const publishedAt = 'publishedAt';
  static const content = 'content';
  static const language = 'language';
  static const category = 'category';
  static const country = 'country';
}

class Sizes {
  Sizes._();

  static const double dimen_0 = 0;
  static const double dimen_1 = 1;
  static const double dimen_2 = 2;
  static const double dimen_4 = 4;
  static const double dimen_6 = 6;
  static const double dimen_8 = 8;
  static const double dimen_10 = 10;
  static const double dimen_12 = 12;
  static const double dimen_14 = 14;
  static const double dimen_16 = 16;
  static const double dimen_18 = 18;
  static const double dimen_20 = 20;
  static const double dimen_22 = 22;
  static const double dimen_24 = 24;
  static const double dimen_26 = 26;
  static const double dimen_28 = 28;
  static const double dimen_30 = 30;
  static const double dimen_32 = 32;
  static const double dimen_34 = 34;
  static const double dimen_36 = 36;
  static const double dimen_38 = 38;
  static const double dimen_40 = 40;
  static const double dimen_42 = 42;
  static const double dimen_44 = 44;
  static const double dimen_46 = 46;
  static const double dimen_48 = 48;
  static const double dimen_50 = 50;
  static const double dimen_64 = 64;
  static const double dimen_80 = 80;
  static const double dimen_100 = 100;
  static const double dimen_105 = 105;
  static const double dimen_110 = 110;
  static const double dimen_120 = 120;
  static const double dimen_140 = 140;
  static const double dimen_150 = 150;
  static const double dimen_160 = 160;
  static const double dimen_200 = 200;
  static const double dimen_230 = 230;
  static const double dimen_250 = 250;

  static const double dimen_300 = 300;
}

const kTextInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: AppColors.lightGrey,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.lightGrey, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.lightGrey, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_10)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
    borderRadius: BorderRadius.all(
      Radius.circular(Sizes.dimen_10),
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.5),
    borderRadius: BorderRadius.all(
      Radius.circular(Sizes.dimen_10),
    ),
  ),
);
const Widget horizontal5 = SizedBox(width: 5.0);
const Widget horizontal10 = SizedBox(width: 10.0);
const Widget horizontal15 = SizedBox(width: 15.0);
const Widget horizontal20 = SizedBox(width: 20.0);
const Widget horizontal25 = SizedBox(width: 25.0);

const Widget vertical5 = SizedBox(height: 5.0);
const Widget vertical10 = SizedBox(height: 10.0);
const Widget vertical15 = SizedBox(height: 15.0);
const Widget vertical20 = SizedBox(height: 20.0);

const Widget vertical25 = SizedBox(height: 25.0);
const Widget vertical30 = SizedBox(height: 30.0);

const Widget vertical50 = SizedBox(height: 50.0);
const Widget vertical120 = SizedBox(height: 120.0);

Widget spacedDivider = Column(
  children: const <Widget>[
    vertical25,
    Divider(color: Colors.blueGrey, height: 5.0),
    vertical25,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);
