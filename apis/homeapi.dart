import 'package:biyan_finance/models/product_model/home_tweets_model.dart';
import 'package:biyan_finance/utils/by_http.dart';

class Homeapi {
  /// 首页推文
  static Future<List<tweetsDataModel>> list({int? page, int? prePage}) async {
    var res = await ByHttpUtil().get('/Twitter/index', params: {
      'page': page ?? 0,
      'per_page': prePage ?? 20,
    });



  HomeTweetsModel a = HomeTweetsModel.fromJson(res.data);


    print("resresresresres111==${a.data?.list?[0].recordId}");

    List<tweetsDataModel> items = [];
    for (var item in a.data!.list!) {

      items.add(item);

       
    }

    

    return items;
  }
}
