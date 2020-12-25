part of thindek_ui;

Widget tdkImage(
  String url, {
  double width,
  double height,
  EdgeInsetsGeometry margin,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radii.r6,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        child: SkeletonAnimation(
            child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: Radii.r6,
            color: Colors.grey[300],
          ),
        )),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

class SkeletonAnimation extends StatefulWidget {
  final Widget child;
  final Color shimmerColor;
  final Color gradientColor;
  final Curve curve;

  SkeletonAnimation(
      {@required this.child,
      this.shimmerColor = Colors.white54,
      this.gradientColor = const Color.fromARGB(0, 244, 244, 244),
      this.curve = Curves.fastOutSlowIn,
      Key key})
      : super(key: key);

  @override
  _SkeletonAnimationState createState() => _SkeletonAnimationState();
}

class _SkeletonAnimationState extends State<SkeletonAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Positioned.fill(
            child: ClipRect(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FractionallySizedBox(
                widthFactor: .2,
                alignment: AlignmentGeometryTween(
                  begin: Alignment(-1.0 - .2 * 3, .0),
                  end: Alignment(1.0 + .2 * 3, .0),
                ).chain(CurveTween(curve: widget.curve)).evaluate(_controller),
                child: child,
              );
            },
            child: DecoratedBox(
                decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                widget.gradientColor,
                widget.shimmerColor,
              ]),
            )),
          ),
        ))
      ],
    );
  }
}
