import 'package:fodoq/features/html/enums/html_type.dart';

abstract class HtmlServiceInterface {
  Future<String?> getHtmlText(HtmlType htmlType, String languageCode);
}
