import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class RichTextParser extends StatelessWidget {
  final String text;
  final Color textCololr;
  const RichTextParser({
    super.key,
    required this.text,
    this.textCololr = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(
      data: text,
      shrinkWrap: true,
      markdownGenerator: MarkdownGenerator(
        richTextBuilder: (span) => span is TextSpan
            ? Text.rich(
                span,
                textScaler: TextScaler.linear(.9),
              )
            : Text.rich(span),
      ),
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
