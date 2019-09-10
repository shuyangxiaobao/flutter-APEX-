import 'package:flutter/material.dart';
import 'package:flutter_app/entrance.dart';
import 'banner_model.dart';
import 'carousel_widget.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  var model = BannerModel(null, image: 'images/pic/timg.jpeg');
  var model1 = BannerModel(null, image: 'images/pic/timg-1.jpeg');
  var model2 = BannerModel(null, image: 'images/pic/timg-2.jpeg');
  var model3 = BannerModel(null, image: 'images/pic/timg-3.jpeg');

  List<BannerModel> banners = List();

  void initState() {
    super.initState();
    banners.add(model);
    banners.add(model1);
    banners.add(model2);
    banners.add(model3);

    // banners..add(model)
    //   ..add(model1)
    //   ..add(model2)
    //   ..add(model3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // appBar: AppBar(
      //   title: Text('轮播图'),
      // ),
      color: Color(0xff21212b),
      child: Center(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Container(
              width: screenWidth-30,
              height: 160,
              child: Carousel(
                banners: banners,
                onTap: (model) {
                  print(model.image);
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
