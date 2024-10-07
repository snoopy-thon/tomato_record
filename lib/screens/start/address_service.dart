import 'package:dio/dio.dart';
import 'package:tomato_record/constants/keys.dart';
import 'package:tomato_record/data/address_model.dart';

import '../../utils/logger.dart';

class AddressService {
  Future<AddressModel> searchAddressByStr(String text) async {
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
        .catchError((e) {
      logger.e(e.message);
    });

    AddressModel addressModel =
        AddressModel.fromJson(response.data["response"]);
    logger.d(addressModel);
    return addressModel;
  }

  Future<void> findAddressByCoordinate(
      {required double log, required double lat}) async {
    final Map<String, dynamic> formData = {
      'key': VWORLD_KEY,
      'service': 'address',
      'type': 'BOTH',
      'request': 'GetAddress',
      'point': '$log, $lat',
    };
    final response = await Dio()
        .get('https://api.vworld.kr/req/address', queryParameters: formData)
        .catchError((e) {
      logger.e(e.message);
    });

    logger.d(response);
    return;
  }
}
