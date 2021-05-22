part of thindek_ui;

class TDKSpace extends StatelessWidget {
  final int size;

  const TDKSpace({Key key, this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    switch (size) {
      case 1:
        {
          return SizedBox(height: 15.sp);
        }
        break;
      case 2:
        {
          return SizedBox(height: 30.sp);
        }
        break;
      case 3:
        {
          return SizedBox(height: 40.sp);
        }
        break;
    }
    return Container();
  }
}
