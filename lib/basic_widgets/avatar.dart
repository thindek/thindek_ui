part of thindek_ui;

Widget tftCircleAvatar(double length, String avatar, Color borderColor, double borderWidth) {
  return Container(
    width: length,
    height: length,
    decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular(length / 2)),
    child: ClipOval(
      child: tftImage(avatar),
    ),
  );
}

Widget tftSquareAvatar(double length, String avatar, Color borderColor, double borderWidth) {
  return Container(
    width: length,
    height: length,
    decoration: BoxDecoration(border: Border.all(color: borderColor, width: borderWidth), borderRadius: Radii.r0),
    child: ClipRRect(borderRadius: Radii.r0, child: tftImage(avatar)),
  );
}
