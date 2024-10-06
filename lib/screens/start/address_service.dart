import 'package:dio/dio.dart';
import 'package:tomato_record/constants/keys.dart';

import '../../utils/logger.dart';

class AddressService {
  void searchAddressByStr(String text) async {
    final formData = {
      'key': VWORLD_KEY,
      'request': 'search',
      'type': 'ADDRESS',
      'category': 'ROAD',
      'query': text,
      'size': 30,
    };

    final response = await Dio()
        .get('https://api.vworld.kr/req/search', queryParameters: formData)
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      logger.e(e.message);
    });
    logger.d(response);
  }
}
