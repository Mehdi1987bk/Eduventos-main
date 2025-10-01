import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_math/flutter_html_math.dart';

/// Расширение для flutter_html, обрабатывающее MathML → TeX → FlutterMath
class CustomMathExtension extends MathHtmlExtension {
  @override
  InlineSpan buildMathWidget(String tex, BuildContext context) {
    try {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Math.tex(
          tex,
          mathStyle: MathStyle.display,
        ),
      );
    } catch (e) {
      print("❌ Ошибка при рендере TeX: $e");
      return const TextSpan(text: 'Ошибка формулы');
    }
  }
}

/// Универсальный HTML-виджет с поддержкой формул
class FormulaHtmlWidget extends StatelessWidget {
  final String? html;
  final double? fontSize;
  final Color? colors;

  FormulaHtmlWidget({super.key, this.html, this.fontSize = 19, this.colors = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Html(
          data: html,
          style: {
            "*": Style(
              fontSize: FontSize(fontSize ?? 19),
              color: colors,
            ),
            "p": Style(
              margin: Margins.symmetric(vertical: 8),
            ),
            "h1": Style(
              fontSize: FontSize.xxLarge,
              fontWeight: FontWeight.bold,
            ),
            "h2": Style(
              fontSize: FontSize.xLarge,
              fontWeight: FontWeight.bold,
            ),
            "h3": Style(
              fontSize: FontSize.large,
              fontWeight: FontWeight.bold,
            ),
            "h4": Style(
              fontSize: FontSize.medium,
              fontWeight: FontWeight.bold,
            ),
            "h5": Style(
              fontSize: FontSize.small,
              fontWeight: FontWeight.bold,
            ),
            "h6": Style(
              fontSize: FontSize.xSmall,
              fontWeight: FontWeight.bold,
            ),
            "b": Style(
              fontWeight: FontWeight.bold,
            ),
            "strong": Style(
              fontWeight: FontWeight.bold,
            ),
            "i": Style(
              fontStyle: FontStyle.italic,
            ),
            "em": Style(
              fontStyle: FontStyle.italic,
            ),
            "u": Style(
              textDecoration: TextDecoration.underline,
            ),
            "s": Style(
              textDecoration: TextDecoration.lineThrough,
            ),
            "sub": Style(
              fontSize: FontSize.smaller,
              verticalAlign: VerticalAlign.sub,
            ),
            "sup": Style(
              fontSize: FontSize.smaller,
              verticalAlign: VerticalAlign.sup,
            ),
            "blockquote": Style(
              margin: Margins.all(16),
              padding: HtmlPaddings.all(12),
              backgroundColor: const Color(0xFFEFEFEF),
              border: Border(
                left: BorderSide(color: Colors.grey, width: 4),
              ),
            ),
            "pre": Style(
              backgroundColor: const Color(0xFFF4F4F4),
              padding: HtmlPaddings.all(12),
              fontFamily: "Courier",
            ),
            "ul": Style(
              padding: HtmlPaddings.only(left: 20),
            ),
            "ol": Style(
              padding: HtmlPaddings.only(left: 20),
            ),
            "li": Style(
              margin: Margins.symmetric(vertical: 4),
            ),
            "table": Style(
              backgroundColor: const Color(0xFFF8F8F8),
              border: Border.all(color: Colors.grey),
            ),
            "th": Style(
              padding: HtmlPaddings.all(6),
              backgroundColor: const Color(0xFFE0E0E0),
            ),
            "td": Style(
              padding: HtmlPaddings.all(6),
              border: Border.all(color: Colors.grey),
            ),
            "a": Style(
              textDecoration: TextDecoration.underline,
              color: Colors.blue,
            ),
            "img": Style(
              width: Width.auto(),
              height: Height.auto(),
            ),
            "hr": Style(
              margin: Margins.symmetric(vertical: 16),
              border: Border(
                top: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
            "span": Style(), // общие стили, можно кастомизировать
          },
          extensions: [
            CustomMathExtension(), // если используется MathML в CKEditor
          ],
        ));
  }
}