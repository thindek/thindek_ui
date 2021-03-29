part of thindek_ui;

Widget tdkSwiper(BuildContext context, double ratio, List<Map> imageList, dynamic typeRedirect) {
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
                borderRadius: BorderRadius.circular(autoWidth(15.0)),
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
