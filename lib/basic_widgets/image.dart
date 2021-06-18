part of thindek_ui;

/// Image
///

class TDKImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final BorderRadiusGeometry? radius;
  final EdgeInsetsGeometry? margin;

  const TDKImage({Key? key, required this.url, required this.width, required this.height, this.radius, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url!,
      imageBuilder: (context, imageProvider) => Stack(
        children: [
          Container(
            height: height,
            width: width,
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: radius,
              color: Colors.white,
            ),
          ),
          Container(
            height: height,
            width: width,
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: radius,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
              ),
            ),
          ),
        ],
      ),
      placeholder: (context, url) {
        return Container(
          child: SkeletonAnimation(
              child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: radius,
              color: Colors.grey[300],
            ),
          )),
        );
      },
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.grey[200],
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: Colors.black38,
              ),
              Text(
                error.toString(),
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TDKMultiImages extends StatelessWidget {
  final List imageList;

  const TDKMultiImages({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (imageList.length) {
      case 1:
        {
          return _oneImage(context, imageList);
        }

      case 2:
        {
          return _twoImages(context, imageList);
        }

      case 3:
        {
          return _threeImages(context, imageList);
        }

      case 4:
        {
          return _fourImages(context, imageList);
        }

      case 5:
        {
          return _fiveImages(context, imageList);
        }

      case 6:
        {
          return _sixImages(context, imageList);
        }

      case 7:
        {
          return _sevenImages(context, imageList);
        }

      case 8:
        {
          return _eightImages(context, imageList);
        }

      case 9:
        {
          return _nineImages(context, imageList);
        }
    }
    return Container();
  }
}

Widget _oneImage(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO - 2 * IMG_GAP_RATIO) / 3,
              minHeight: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO - 2 * IMG_GAP_RATIO) / 3,
              maxWidth: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO - 2 * IMG_GAP_RATIO) * 0.75,
              maxHeight: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO - 2 * IMG_GAP_RATIO) * 0.7,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.w),
              child: Image(
                image: AssetImage('assets/images/logo_white.png'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    ],
  );
}

Widget _twoImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          SizedBox(
            width: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
          ),
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _threeImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _fourImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _fiveImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          SizedBox(
            width: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
          ),
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _sixImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _sevenImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _eightImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          SizedBox(
            width: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
          ),
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _nineImages(BuildContext context, List _motionImageList) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).size.width * IMG_GAP_RATIO,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
          _singleImage(context, 'imageUrl'),
        ],
      ),
    ],
  );
}

Widget _singleImage(BuildContext context, String imageUrl) {
  return TDKImage(
    url: imageUrl,
    width: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO - 2 * IMG_GAP_RATIO) / 3,
    height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO - 2 * IMG_GAP_RATIO) / 3,
  );
}

class SkeletonAnimation extends StatefulWidget {
  final Widget child;
  final Color shimmerColor;
  final Color gradientColor;
  final Curve curve;

  SkeletonAnimation(
      {required this.child,
      this.shimmerColor = Colors.white54,
      this.gradientColor = const Color.fromARGB(0, 244, 244, 244),
      this.curve = Curves.fastOutSlowIn,
      Key? key})
      : super(key: key);

  @override
  _SkeletonAnimationState createState() => _SkeletonAnimationState();
}

class _SkeletonAnimationState extends State<SkeletonAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
                ).chain(CurveTween(curve: widget.curve)).evaluate(_controller)!,
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
