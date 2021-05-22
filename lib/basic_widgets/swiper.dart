part of thindek_ui;

class TDKSwiper extends StatelessWidget {
  final double ratio;
  final List<Map> imageList;
  final dynamic typeRedirect;

  const TDKSwiper({Key key, this.ratio, this.imageList, this.typeRedirect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * MARGIN_RATIO,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * (1 - 2 * MARGIN_RATIO) * ratio,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  image: DecorationImage(
                    image: NetworkImage(
                      imageList[index]['image'],
                    ),
                    fit: BoxFit.cover,
                  )),
            );
          },
          itemCount: imageList.length,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(0),
          ),
          // control: SwiperControl(),
          loop: true,
          autoplay: true,
          duration: 1000,
          onTap: typeRedirect,
        ),
      ),
    );
  }
}
