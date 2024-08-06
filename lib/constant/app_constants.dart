
import 'size_constants.dart';
import 'app_endpoints.dart';
import 'color_resources.dart';
import 'image_resources.dart';
import 'string_constants.dart';
import 'style.dart';

class AppConstants {
  static  String fontFamily = 'GeorgiaFamily';

  static AppEndpoints endPoints = AppEndpoints();

  static StringConstants get stringConstant => StringConstants();

  static ColorStyle get colorStyle => ColorStyle();

  static ImageResources get imageResource => ImageResources();

  static TxtStyle get txtStyle => TxtStyle();

  static SizeConstants get sizeConstants => SizeConstants();
}