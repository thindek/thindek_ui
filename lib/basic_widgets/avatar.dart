part of thindek_ui;

Widget tdkCircleAvatar(double length, String avatar, Color borderColor, double borderWidth) {
  return Container(
    width: length,
    height: length,
    decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth), borderRadius: BorderRadius.circular(length / 2)),
    child: ClipOval(
      child: tdkImage(avatar),
    ),
  );
}

Widget tdkSquareAvatar(double length, String avatar, Color borderColor, double borderWidth) {
  return Container(
    width: length,
    height: length,
    decoration: BoxDecoration(border: Border.all(color: borderColor, width: borderWidth), borderRadius: Radii.r0),
    child: ClipRRect(borderRadius: Radii.r0, child: tdkImage(avatar)),
  );
}
