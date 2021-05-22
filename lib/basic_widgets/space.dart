part of thindek_ui;

class TDKSpace extends StatelessWidget {
  final int size;

  const TDKSpace({Key key, this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    switch (size) {
      case 1:
        {
          return SizedBox(height: autoFontSize(15));
        }
        break;
      case 2:
        {
          return SizedBox(height: autoFontSize(30));
        }
        break;
      case 3:
        {
          return SizedBox(height: autoFontSize(45));
        }
        break;
    }
    return Container();
  }
}
