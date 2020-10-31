import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ub/defaultTheme/model/DTProductModel.dart';
import 'package:ub/defaultTheme/utils/DTDataProvider.dart';
import 'package:ub/defaultTheme/utils/DTWidgets.dart';
import 'package:ub/main/utils/AppWidget.dart';
import 'package:ub/main/utils/rating_bar.dart';

import '../../main.dart';
import 'DTDrawerWidget.dart';
import 'DTProductDetailScreen.dart';

class DTCategoryDetailScreen extends StatefulWidget {
  static String tag = '/DTCategoryDetailScreen';

  @override
  DTCategoryDetailScreenState createState() => DTCategoryDetailScreenState();
}

class DTCategoryDetailScreenState extends State<DTCategoryDetailScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = (dynamicWidth(context)) / 2;
    double cardHeight = context.height() / 5;

    return Scaffold(
      appBar: appBar(context, 'Grid View'),
      drawer: DTDrawerWidget(),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (_, index) {
          DTProductModel data = getProducts()[index];

          return Container(
            decoration: boxDecorationRoundedWithShadow(8,
                backgroundColor: appStore.appBarColor),
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 110,
                  width: context.width(),
                  child: Stack(
                    children: [
                      Image.network(
                        data.image,
                        fit: BoxFit.cover,
                        height: isMobile ? 110 : 180,
                        width: context.width(),
                      ).cornerRadiusWithClipRRect(8),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: data.isLiked.validate()
                            ? Icon(Icons.favorite, color: Colors.red, size: 16)
                            : Icon(Icons.favorite_border, size: 16),
                      ),
                    ],
                  ),
                ),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.name,
                        style: primaryTextStyle(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    4.height,
                    Row(
                      children: [
                        RatingBar(
                          onRatingChanged: (r) {},
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          initialRating: data.rating,
                          maxRating: 5,
                          filledColor: Colors.yellow,
                          size: 14,
                        ),
                        5.width,
                        Text('${data.rating}',
                            style: secondaryTextStyle(size: 12)),
                      ],
                    ),
                    4.height,
                    Row(
                      children: [
                        priceWidget(data.discountPrice),
                        8.width,
                        priceWidget(data.price, applyStrike: true),
                      ],
                    ),
                  ],
                ).paddingAll(8),
              ],
            ),
          ).onTap(() async {
            int index =
                await DTProductDetailScreen(productModel: data).launch(context);
            if (index != null) appStore.setDrawerItemIndex(index);
          });
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.width() > 1550
              ? 4
              : context.width() > 1080
                  ? 3
                  : 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: cardWidth / cardHeight,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: getProducts().length,
      ),
    );
  }
}
