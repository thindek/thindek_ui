part of thindek_ui;

Widget tdkFullContent(BuildContext context, String content) {
  return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO, vertical: autoFontSize(10)),
      child: Text(
        content,
        style: TextStyle(fontSize: autoFontSize(bodyF)),
      ));
}

// ignore: camel_case_types
class tdkExpandableContent extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final bool expand;
  final Color labelColor;

  const tdkExpandableContent({Key key, this.text, this.maxLines, this.style, this.expand, this.labelColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _tdkExpandableContentState(text, maxLines, style, expand, labelColor);
  }
}

// ignore: camel_case_types
class _tdkExpandableContentState extends State<tdkExpandableContent> {
  final String text;
  final int maxLines;
  final TextStyle style;
  bool expand;
  final Color labelColor;

  _tdkExpandableContentState(this.text, this.maxLines, this.style, this.expand, this.labelColor) {
    if (expand == null) {
      expand = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      final span = TextSpan(text: text ?? '', style: style);
      final tp = TextPainter(text: span, maxLines: maxLines, textDirection: TextDirection.ltr);
      tp.layout(maxWidth: size.maxWidth);

      if (tp.didExceedMaxLines) {
        return Stack(
          children: <Widget>[
            expand
                ? Container(child: Text(text ?? '', style: style))
                : Container(
                    child: ExtendedText(text ?? '',
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
                    expand = !expand;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(expand ? '收起^' : '展开',
                      style: TextStyle(fontSize: style != null ? style.fontSize : null, color: labelColor)),
                ),
              ),
            ),
          ],
        );
      } else {
        return Text(text ?? '', style: style);
      }
    });
  }
}
