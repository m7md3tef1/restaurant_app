part of '../view.dart';

class ImageBadge extends StatefulWidget {
  ImageBadge({super.key, this.img});
  late List? img;
  @override
  State<ImageBadge> createState() => _ImageBadgeState();
}

class _ImageBadgeState extends State<ImageBadge> {
  bool isFav = true;
  var i;
  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      position: badge.BadgePosition.bottomEnd(end: 80.w, bottom: -20.h),
      badgeColor: ColorManager.primaryColor,
      // badgeStyle: const badge.BadgeStyle(
      //   badgeColor: ColorManager.primaryColor,
      // ),
      badgeContent: InkWell(
        onTap: () {
          setState(() {
            isFav = !isFav;
          });
        },
        child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Center(
                child: Icon(
              isFav ? Icons.favorite_border : Icons.favorite,
              size: 33.r,
              color: Colors.white,
            ))),
      ),
      child: Container(
        height: 370.h,
        width: 1.sw,
        child: Stack(children: [
          Swiper(
              itemBuilder: ((context, index) {
                return Container(
                  height: 370.h,
                  width: 1.sw,
                  child: Image(
                    // width: 1.sw,
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.img![index].toString()),
                  ),
                );
              }),
              itemCount: widget.img!.length),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 50.w),
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child:   CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorManager.primaryColor,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorManager.primaryColor,
                    child: const Icon(
                      Icons.share,
                      color: ColorManager.whiteColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 220.h, left: 25.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: ColorManager.greyColor,
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                        size: 12,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                InkWell(
                  // onTap: () {
                  //   setState(() {
                  //     img = widget.image[index+1];
                  //     print(img.toString());
                  //   });
                  // },
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: ColorManager.greyColor,
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                      size: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
