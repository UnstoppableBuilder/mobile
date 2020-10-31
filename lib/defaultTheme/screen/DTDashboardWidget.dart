import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ub/defaultTheme/model/CategoryModel.dart';
import 'package:ub/defaultTheme/model/DTProductModel.dart';
import 'package:ub/defaultTheme/screen/DTCartScreen.dart';
import 'package:ub/defaultTheme/screen/DTCategoryDetailScreen.dart';
import 'package:ub/defaultTheme/screen/DTSearchScreen.dart';
import 'package:ub/defaultTheme/screen/DTSignInScreen.dart';
import 'package:ub/defaultTheme/utils/DTDataProvider.dart';
import 'package:ub/defaultTheme/utils/DTWidgets.dart';
import 'package:ub/main.dart';
import 'package:ub/main/utils/AppColors.dart';
import 'package:ub/main/utils/AppConstant.dart';
import 'package:ub/main/utils/AppWidget.dart';
import 'package:ub/main/utils/rating_bar.dart';

import 'DTProductDetailScreen.dart';

class DTDashboardWidget extends StatefulWidget {
  static String tag = '/DTDashboardWidget';

  @override
  DTDashboardWidgetState createState() => DTDashboardWidgetState();
}

class DTDashboardWidgetState extends State<DTDashboardWidget> {
  var selectedIndex = 0;
  var pages = List<Widget>();
  var categories = List<CategoryModel>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    categories.add(CategoryModel(
        name: 'Electronics',
        icon: 'images/defaultTheme/category/electronics.png'));
    categories.add(CategoryModel(
        name: 'TV & Appliances', icon: 'images/defaultTheme/category/Tv.png'));
    categories.add(CategoryModel(
        name: 'Men', icon: 'images/defaultTheme/category/Man.png'));
    categories.add(CategoryModel(
        name: 'Women', icon: 'images/defaultTheme/category/women.png'));
    categories.add(CategoryModel(
        name: 'Baby & Kids', icon: 'images/defaultTheme/category/kids.png'));
    categories.add(CategoryModel(
        name: 'Home & Furniture',
        icon: 'images/defaultTheme/category/furniture.png'));
    categories.add(CategoryModel(
        name: 'Fashion', icon: 'images/defaultTheme/category/fashion.png'));
    categories.add(CategoryModel(
        name: 'Sports', icon: 'images/defaultTheme/category/sports.png'));
    categories.add(CategoryModel(
        name: 'Jewellery', icon: 'images/defaultTheme/category/jewelry.png'));
    categories.add(CategoryModel(
        name: 'Stationary',
        icon: 'images/defaultTheme/category/stationary.png'));
    categories.add(CategoryModel(
        name: 'Shoes', icon: 'images/defaultTheme/category/Shoes.png'));
    categories.add(CategoryModel(
        name: 'Watch', icon: 'images/defaultTheme/category/Watch.png'));
    categories.add(CategoryModel(
        name: 'Electronics',
        icon: 'images/defaultTheme/category/electronics.png'));
    categories.add(CategoryModel(
        name: 'TV & Appliances', icon: 'images/defaultTheme/category/Tv.png'));
    categories.add(CategoryModel(
        name: 'Men', icon: 'images/defaultTheme/category/Man.png'));
    categories.add(CategoryModel(
        name: 'Women', icon: 'images/defaultTheme/category/women.png'));
    categories.add(CategoryModel(
        name: 'Baby & Kids', icon: 'images/defaultTheme/category/kids.png'));
    categories.add(CategoryModel(
        name: 'Home & Furniture',
        icon: 'images/defaultTheme/category/furniture.png'));
    categories.add(CategoryModel(
        name: 'Fashion', icon: 'images/defaultTheme/category/fashion.png'));
    categories.add(CategoryModel(
        name: 'Sports', icon: 'images/defaultTheme/category/sports.png'));
    categories.add(CategoryModel(
        name: 'Jewellery', icon: 'images/defaultTheme/category/jewelry.png'));
    categories.add(CategoryModel(
        name: 'Stationary',
        icon: 'images/defaultTheme/category/stationary.png'));
    categories.add(CategoryModel(
        name: 'Shoes', icon: 'images/defaultTheme/category/Shoes.png'));
    categories.add(CategoryModel(
        name: 'Watch', icon: 'images/defaultTheme/category/Watch.png'));

    pages = [
      Container(
          child: Image.network(SampleImageUrl,
              height: isMobile ? 150 : 350, fit: BoxFit.cover)),
      Container(
          child: Image.network(SampleImageUrl2,
              height: isMobile ? 150 : 350, fit: BoxFit.cover)),
      Container(
          child: Image.network(SampleImageUrl3,
              height: isMobile ? 150 : 350, fit: BoxFit.cover)),
      Container(
          child: Image.network(SampleImageUrl4,
              height: isMobile ? 150 : 350, fit: BoxFit.cover)),
    ];

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget searchTxt() {
      return Container(
        width: dynamicWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: viewLineColor),
        ),
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(AntDesign.search1, color: appStore.textSecondaryColor),
            10.width,
            Text('Search',
                style: boldTextStyle(color: appStore.textSecondaryColor)),
          ],
        ),
        padding: EdgeInsets.all(10),
      ).onTap(() {
        DTSearchScreen().launch(context);
      });
    }

    Widget horizontalList() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 8, top: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: categories.map((e) {
            return Container(
              width: isMobile ? 100 : 120,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(isMobile ? 8 : 12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: appColorPrimary),
                    child: Image.asset(e.icon,
                        height: 30, width: 30, color: white),
                  ),
                  4.height,
                  Text(e.name,
                      style: primaryTextStyle(size: 12),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ).onTap(() {
              DTCategoryDetailScreen().launch(context);
            });
          }).toList(),
        ),
      );
    }

    Widget mobileWidget() {
      return Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: appColorPrimary,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                    ),
                  ).visible(false),
                  Column(
                    children: [
                      10.height,
                      searchTxt(),
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 230,
                        child: Stack(
                          children: [
                            PageView(
                              scrollDirection: Axis.horizontal,
                              children: pages,
                              onPageChanged: (index) {
                                selectedIndex = index;
                                setState(() {});
                              },
                            ).cornerRadiusWithClipRRect(8),
                            AnimatedPositioned(
                              duration: Duration(seconds: 1),
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: DotIndicator(
                                  pages: pages,
                                  selectedIndex: selectedIndex,
                                  indicatorColor: appColorPrimary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              10.height,
              Text('Horizontal ListView', style: boldTextStyle()).paddingAll(8),
              horizontalList(),
              20.height,
              Text('ListView', style: boldTextStyle()).paddingAll(8),
              ListView.builder(
                padding: EdgeInsets.all(8),
                itemBuilder: (_, index) {
                  DTProductModel data = getProducts()[index];

                  return Container(
                    decoration: boxDecorationRoundedWithShadow(8,
                        backgroundColor: appStore.appBarColor),
                    margin: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 110,
                          width: 126,
                          child: Stack(
                            children: [
                              Image.network(
                                data.image,
                                fit: BoxFit.cover,
                                height: 110,
                                width: 126,
                              ).cornerRadiusWithClipRRect(8),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: data.isLiked.validate()
                                    ? Icon(Icons.favorite,
                                        color: Colors.red, size: 16)
                                    : Icon(Icons.favorite_border, size: 16),
                              ),
                            ],
                          ),
                        ),
                        8.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(data.name,
                                style: primaryTextStyle(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            4.height,
                            Row(
                              children: [
                                IgnorePointer(
                                  child: RatingBar(
                                    onRatingChanged: (r) {},
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    initialRating: data.rating,
                                    maxRating: 5,
                                    filledColor: Colors.yellow,
                                    size: 14,
                                  ),
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
                        ).paddingAll(8).expand(),
                      ],
                    ),
                  ).onTap(() async {
                    int index = await DTProductDetailScreen(productModel: data)
                        .launch(context);
                    if (index != null) appStore.setDrawerItemIndex(index);
                  });
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: getProducts().length,
              ),
            ],
          ),
        ),
      );
    }

    Widget webWidget() {
      double cardWidth = (dynamicWidth(context)) / 2;
      double cardHeight = context.height() / 5;

      return SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/app/app_icon.png', height: 100),
                  searchTxt().expand(),
                  25.width,
                  Container(
                    padding:
                        EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
                    decoration: BoxDecoration(
                        color: appColorPrimary,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('Sign In',
                        style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    DTSignInScreen().launch(context);
                  }),
                  16.width,
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.shopping_cart,
                        size: 30, color: appStore.iconColor),
                  ).onTap(() {
                    DTCartScreen().launch(context);
                  }),
                  16.width
                ],
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: context.width(),
                decoration: boxDecoration(
                    showShadow: true, radius: 10, bgColor: Colors.transparent),
                height: 280,
                child: Stack(
                  children: [
                    PageView(
                      scrollDirection: Axis.horizontal,
                      children: pages,
                      onPageChanged: (index) {
                        selectedIndex = index;
                        setState(() {});
                      },
                    ).cornerRadiusWithClipRRect(8),
                    AnimatedPositioned(
                      duration: Duration(seconds: 1),
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: DotIndicator(
                          pages: pages,
                          selectedIndex: selectedIndex,
                          indicatorColor: appColorPrimary),
                    ),
                  ],
                ),
              ),
              Text('Horizontal ListView', style: boldTextStyle()).paddingAll(8),
              8.height,
              horizontalList(),
              8.height,
              Text('GridView', style: boldTextStyle()).paddingAll(8),
              8.height,
              GridView.builder(
                padding: EdgeInsets.all(8),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  DTProductModel data = getProducts()[index];

                  return Container(
                    decoration: boxDecorationRoundedWithShadow(8,
                        backgroundColor: appStore.appBarColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              data.image,
                              fit: BoxFit.fitHeight,
                              height: 180,
                              width: context.width(),
                            ).cornerRadiusWithClipRRect(8),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: data.isLiked.validate()
                                  ? Icon(Icons.favorite,
                                      color: Colors.red, size: 16)
                                  : Icon(Icons.favorite_border, size: 16),
                            ),
                          ],
                        ).expand(),
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
                                IgnorePointer(
                                  child: RatingBar(
                                    onRatingChanged: (r) {},
                                    filledIcon: Icons.star,
                                    emptyIcon: Icons.star_border,
                                    initialRating: data.rating,
                                    maxRating: 5,
                                    filledColor: Colors.yellow,
                                    size: 14,
                                  ),
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
                        10.height,
                      ],
                    ),
                  ).onTap(() async {
                    int index = await DTProductDetailScreen(productModel: data)
                        .launch(context);
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
              16.height
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: ContainerX(
        mobile: mobileWidget(),
        web: webWidget(),
      ),
    );
  }
}
