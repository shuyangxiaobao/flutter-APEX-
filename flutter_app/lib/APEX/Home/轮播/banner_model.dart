import 'dart:convert';

class BannerModel extends Object {
  final String image;
  final String url;

  BannerModel(this.url, {this.image});
}

//
class MarketDataModel extends Object {
  final String instrumentId;
  final String volume;
  final String openInterest;
  final String lastPrice;
  final String upperLowerPercent;
  final bool isCollect;
  MarketDataModel({
    this.instrumentId,
    this.volume,
    this.openInterest,
    this.lastPrice,
    this.upperLowerPercent,
    this.isCollect,
  });
}

// class NewsDataModel extends Object {
//   final String title;
//   final String createDate;
//   final String browseNum;
//   NewsDataModel({
//     this.title,
//     this.createDate,
//     this.browseNum,
// });
// }

class NewsDataModel {
  int id;
  final String title;
  final String businessType;
  final String urlType;
  final String htmlFive;
  final String webData;
  final String url;
  final int browseNum;
  final String orders;
  int createDate;
  final int updateDate;
  final int photo;

  NewsDataModel(
    this.id,
    this.title,
    this.businessType,
    this.urlType,
    this.htmlFive,
    this.webData,
    this.url,
    this.browseNum,
    this.orders,
    this.createDate,
    this.updateDate,
    this.photo,
  );

  NewsDataModel.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        businessType = json['businessType'],
        urlType = json['urlType'],
        htmlFive = json['htmlFive'],
        webData = json['webData'],
        url = json['url'],
        browseNum = json['browseNum'],
        orders = json['orders'],
        createDate = json['createDate'],
        updateDate = json['updateDate'],
        photo = json['photo'];

  Map toJson() => {
        'id': id,
        'title': title,
        'businessType': businessType,
        'urlType': urlType,
        'htmlFive': htmlFive,
        'webData': webData,
        'url': url,
        'browseNum': browseNum,
        'orders': orders,
        'createDate': createDate,
        'updateDate': updateDate,
        'photo':photo,
      };
}








class VideoModel {
  int id;
  final String url;
  final String photo;

  VideoModel(
    this.id,
    this.url,
    this.photo,
  );

  VideoModel.fromJson(Map json)
      : id = json['id'],
        url = json['url'],
        photo = json['photo'];

  Map toJson() => {
        'id': id,
        'url': url,
        'photo':photo,
      };
}

