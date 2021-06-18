part of thindek_ui;

class TDKFullContent extends StatelessWidget {
  final String? content;

  const TDKFullContent({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: 10.sp),
        child: Text(
          content!,
          style: TextStyle(fontSize: bodyF.sp),
        ));
  }
}

class TDKExpandableContent extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;
  final bool? expand;
  final Color labelColor;

  const TDKExpandableContent(
      {Key? key, required this.text, required this.maxLines, this.style, this.expand, required this.labelColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TDKExpandableContentState(text, maxLines, style, expand, labelColor);
  }
}

// ignore: camel_case_types
class _TDKExpandableContentState extends State<TDKExpandableContent> {
  final String text;
  final int maxLines;
  final TextStyle? style;
  bool? expand;
  final Color labelColor;

  _TDKExpandableContentState(this.text, this.maxLines, this.style, this.expand, this.labelColor) {
    if (expand == null) {
      expand = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: text, style: style);
      final tp = TextPainter(text: span, maxLines: maxLines, textDirection: TextDirection.ltr);
      tp.layout(maxWidth: size.maxWidth);

      if (tp.didExceedMaxLines) {
        return Stack(
          children: <Widget>[
            expand!
                ? Container(child: Text(text, style: style))
                : Container(
                    child: ExtendedText(text,
                        maxLines: maxLines,
                        style: style,
                        overflowWidget: TextOverflowWidget(
                            child: Text(
                          '...        ',
                          style: TextStyle(color: labelColor),
                        ))),
                  ),
            // Text(text ?? '', maxLines: maxLines, overflow: TextOverflow.ellipsis, style: style),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    expand = !expand!;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(expand! ? '收起^' : '展开',
                      style: TextStyle(fontSize: style != null ? style!.fontSize : null, color: labelColor)),
                ),
              ),
            ),
          ],
        );
      } else {
        return Text(text, style: style);
      }
    });
  }
}

class TDKDisplayContent extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;
  final bool? expand;
  final Color labelColor;

  const TDKDisplayContent(
      {Key? key, required this.text, required this.maxLines, this.style, this.expand, required this.labelColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TDKDisplayContentState(text, maxLines, style, expand, labelColor);
  }
}

// ignore: camel_case_types
class _TDKDisplayContentState extends State<TDKDisplayContent> {
  final String text;
  final int maxLines;
  final TextStyle? style;
  bool? expand;
  final Color labelColor;

  _TDKDisplayContentState(this.text, this.maxLines, this.style, this.expand, this.labelColor) {
    if (expand == null) {
      expand = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: text, style: style);
      final tp = TextPainter(text: span, maxLines: maxLines, textDirection: TextDirection.ltr);
      tp.layout(maxWidth: size.maxWidth);

      if (tp.didExceedMaxLines) {
        return Stack(
          children: <Widget>[
            expand!
                ? Container(child: Text(text, style: style))
                : Container(
                    child: ExtendedText(text,
                        maxLines: maxLines,
                        style: style,
                        overflowWidget: TextOverflowWidget(
                            child: Text(
                          '... 查看全部',
                          style: TextStyle(color: labelColor),
                        ))),
                  ),
            // Text(text ?? '', maxLines: maxLines, overflow: TextOverflow.ellipsis, style: style),
          ],
        );
      } else {
        return Text(text, style: style);
      }
    });
  }
}
