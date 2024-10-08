import 'package:dio/dio.dart';
import 'package:tomato_record/constants/keys.dart';
import 'package:tomato_record/data/address_model.dart';

import '../../data/geocode_model.dart';
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

  Future<List<GeocodeModel>> findAddressByCoordinate(
      {required double log, required double lat}) async {
    final List<Map<String, dynamic>> formDatas = <Map<String, dynamic>>[];

    formDatas.add({
      'key': VWORLD_KEY,
      'service': 'address',
      'type': 'PARCEL',
      'request': 'GetAddress',
      'point': '$log, $lat',
    });

    formDatas.add({
      'key': VWORLD_KEY,
      'service': 'address',
      'type': 'PARCEL',
      'request': 'GetAddress',
      'point': '${log - 0.01}, $lat',
    });

    formDatas.add({
      'key': VWORLD_KEY,
      'service': 'address',
      'type': 'PARCEL',
      'request': 'GetAddress',
      'point': '${log + 0.01}, $lat',
    });

    formDatas.add({
      'key': VWORLD_KEY,
      'service': 'address',
      'type': 'PARCEL',
      'request': 'GetAddress',
      'point': '$log, ${lat + 0.01}',
    });

    formDatas.add({
      'key': VWORLD_KEY,
      'service': 'address',
      'type': 'PARCEL',
      'request': 'GetAddress',
      'point': '$log, ${lat - 0.01}',
    });

    List<GeocodeModel> addresses = [];

    for (Map<String, dynamic> formData in formDatas) {
      final response = await Dio()
          .get('https://api.vworld.kr/req/address', queryParameters: formData)
          .catchError((e) {
        logger.e(e.message);
      });

      GeocodeModel addressModel =
          GeocodeModel.fromJson(response.data["response"]);

      if (response.data['response']['status'] == 'OK')
        addresses.add(addressModel);
      logger.d(response);
    }

    logger.d(addresses);
    return addresses;
  }
}
