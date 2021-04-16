part of thindek_ui;

class TDKCircleAvatar extends StatelessWidget {
  final double length;
  final String avatar;
  final Color borderColor;
  final double borderWidth;

  const TDKCircleAvatar({Key key, this.length, this.avatar, this.borderColor, this.borderWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular(length / 2)),
      child: ClipOval(
        child: TDKImage(url: avatar),
      ),
    );
  }
}

class TDKSquareAvatar extends StatelessWidget {
  final double length;
  final String avatar;
  final Color borderColor;
  final double borderWidth;

  const TDKSquareAvatar({Key key, this.length, this.avatar, this.borderColor, this.borderWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: length,
      decoration: BoxDecoration(border: Border.all(color: borderColor, width: borderWidth), borderRadius: TDKRadii.r0),
      child: ClipRRect(borderRadius: TDKRadii.r0, child: TDKImage(url: avatar)),
    );
  }
}
