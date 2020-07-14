import 'package:flutter/material.dart';
import 'package:example/utils.dart';
import 'dart:math' as math;
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'example_page.dart';
import 'package:intl/intl.dart';

final oCcy = new NumberFormat("#,##0.00", "en_US");

/// Example 03
final customWidth03 =
    CustomSliderWidths(trackWidth: 1, progressBarWidth: 20, shadowWidth: 50);
final customColors03 = CustomSliderColors(
    trackColor: HexColor('#90E3D0'),
    progressBarColors: [HexColor('#FFC84B'), HexColor('#00BFD5')],
    shadowColor: HexColor('#5FC7B0'),
    shadowMaxOpacity: 0.05);

final info03 = InfoProperties(
    bottomLabelStyle: TextStyle(
        color: HexColor('#002D43'), fontSize: 20, fontWeight: FontWeight.w700),
    bottomLabelText: 'Goal',
    mainLabelStyle: TextStyle(
        color: Color.fromRGBO(97, 169, 210, 1),
        fontSize: 30.0,
        fontWeight: FontWeight.w200),
    modifier: (double value) {
      final kcal = value.toInt();
      return '$kcal kCal';
    });
final CircularSliderAppearance appearance03 = CircularSliderAppearance(
    customWidths: customWidth03,
    customColors: customColors03,
    infoProperties: info03,
    size: 250.0,
    startAngle: 180,
    angleRange: 340);
final viewModel03 = ExampleViewModel(
    appearance: appearance03,
    min: 500,
    max: 2300,
    value: 1623,
    pageColors: [HexColor('#D9FFF7'), HexColor('#FFFFFF')]);
final example03 = ExamplePage(
  viewModel: viewModel03,
);

/// Example 04
final customWidth04 =
    CustomSliderWidths(trackWidth: 4, progressBarWidth: 20, shadowWidth: 40);
final customColors04 = CustomSliderColors(
    trackColor: HexColor('#CCFF63'),
    progressBarColor: HexColor('#00FF89'),
    shadowColor: HexColor('#B0FFDA'),
    shadowMaxOpacity: 0.5, //);
    shadowStep: 20);
final info04 = InfoProperties(
    mainLabelStyle: TextStyle(
        color: HexColor('#54826D'),
        fontSize: 24.0,
        fontWeight: FontWeight.w600),
    modifier: (double value) {
      final temp = value.toInt();
      final amount = value.toInt() * 123.78;
      return '$temp Years\n\n£${oCcy.format(amount)}\nper month';
    });
final CircularSliderAppearance appearance04 = CircularSliderAppearance(
    counterClockwise: true,
    customWidths: customWidth04,
    customColors: customColors04,
    infoProperties: info04,
    startAngle: 180,
    angleRange: 180,
    size: 300.0,
    animationEnabled: true);
final viewModel04 = ExampleViewModel(
    appearance: appearance04,
    min: 1,
    max: 5,
    value: 1,
    pageColors: [Colors.white, HexColor('#F1F1F1')]);
final example04 = ExamplePage(
  viewModel: viewModel04,
);

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView(
      controller: controller,
      children: <Widget>[
        //example03,
        example04,
      ],
    ));
  }
}

double degreeToRadians(double degree) {
  return (math.pi / 180) * degree;
}
