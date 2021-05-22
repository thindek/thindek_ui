part of thindek_ui;

/// Scaffold
///
/// [tdkWhiteAppBar]
///
/// [tdkDivider]
///
/// [tdkSectionTitle]

Widget tdkWhiteAppBar(BuildContext context, bool isCenter, {String title = ''}) {
  return AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * 0.06,
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    centerTitle: isCenter,
    title: Text(
      title,
    ),
  );
}

Widget tdkDivider(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO), child: Divider());
}

class TDKSectionTitle extends StatelessWidget {
  final String title;
  final String more;
  final Function route;

  const TDKSectionTitle({Key key, this.title, this.more, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO),
      height: autoFontSize(80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: autoFontSize(bodyF),
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () => route,
            child: Row(
              children: [
                Text(
                  more,
                  style: TextStyle(
                    fontSize: autoFontSize(25),
                    color: Colors.black38,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black38,
                  size: autoFontSize(20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
