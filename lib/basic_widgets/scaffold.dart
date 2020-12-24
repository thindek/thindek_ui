part of thindek_ui;

/// Scaffold
///
/// [tftWhiteAppBar]
///
/// [tftDivider]
///
/// [tftSectionTitle]

Widget tftWhiteAppBar(BuildContext context, bool isCenter, {String title = ''}) {
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

Widget tftDivider(BuildContext context) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO), child: Divider());
}

Widget tftSectionTitle(BuildContext context, String title, String more, String route) {
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
          onTap: () {
            ExtendedNavigator.root.push(route);
          },
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
