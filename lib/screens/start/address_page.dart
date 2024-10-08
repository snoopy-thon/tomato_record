import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomato_record/constants/common_size.dart';
import 'package:tomato_record/data/address_model.dart';
import 'package:tomato_record/screens/start/address_service.dart';
import 'package:tomato_record/utils/logger.dart';

import '../../data/geocode_model.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _addressController = TextEditingController();

  AddressModel? _addressModel;
  final List<GeocodeModel> _GeocodeModelList = [];
  bool _isGettingLocation = false;

  @override
  void dispose() {
    // Stateful 위젯이고 controller를 사용할 경우 , 메모리 낭비 방지를 위해 dispose를 해준다.
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: commonPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _addressController,
            onFieldSubmitted: (text) async {
              _GeocodeModelList.clear();
              _addressModel = await AddressService().searchAddressByStr(text);
              setState(() {});
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: '도로명으로 검색',
              hintStyle: TextStyle(color: Theme.of(context).hintColor),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              prefixIconConstraints:
                  const BoxConstraints(minHeight: 24, minWidth: 24),
            ),
          ),
          const SizedBox(
            height: commonSmallPadding,
          ),
          FilledButton.icon(
            onPressed: () async {
              _addressModel = null;
              _GeocodeModelList.clear();

              setState(() {
                _isGettingLocation = true;
              });
              Location location = Location();

              bool serviceEnabled;
              PermissionStatus permissionGranted;
              LocationData locationData;

              serviceEnabled = await location.serviceEnabled();
              if (!serviceEnabled) {
                serviceEnabled = await location.requestService();
                if (!serviceEnabled) {
                  return;
                }
              }

              permissionGranted = await location.hasPermission();
              if (permissionGranted == PermissionStatus.denied) {
                permissionGranted = await location.requestPermission();
                if (permissionGranted != PermissionStatus.granted) {
                  return;
                }
              }

              locationData = await location.getLocation();
              logger.d(locationData);
              List<GeocodeModel> addresses = await AddressService()
                  .findAddressByCoordinate(
                      log: locationData.longitude!,
                      lat: locationData.latitude!);

              _GeocodeModelList.addAll(addresses);

              setState(() {
                _isGettingLocation = false;
              });
            },
            icon: _isGettingLocation
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : const Icon(
                    CupertinoIcons.compass,
                    color: Colors.white,
                    size: 20,
                  ),
            style: FilledButton.styleFrom(
              minimumSize: const Size(10, 48),
            ),
            label: Text(
              _isGettingLocation ? '위치 찾는 중...' : '현재 위치 찾기',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          if (_addressModel != null)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: commonPadding),
                //shrinkWrap: true,
                itemCount: (_addressModel == null ||
                        _addressModel!.result == null ||
                        _addressModel!.result!.items == null)
                    ? 0
                    : _addressModel!.result!.items!.length,
                itemBuilder: (context, index) {
                  if (_addressModel == null ||
                      _addressModel!.result == null ||
                      _addressModel!.result!.items == null ||
                      _addressModel!.result!.items![index].address == null)
                    return Container();
                  return ListTile(
                    onTap: () {
                      _saveAddressAndGoToNextPage(
                          _addressModel!.result!.items![index].address!.road ??
                              "");
                    },
                    title: Text(
                        _addressModel!.result!.items![index].address!.road ??
                            ""),
                    subtitle: Text(
                        _addressModel!.result!.items![index].address!.parcel ??
                            ""),
                  );
                },
              ),
            ),
          if (_GeocodeModelList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: commonPadding),
                //shrinkWrap: true,
                itemCount: _GeocodeModelList.length,
                itemBuilder: (context, index) {
                  if (_GeocodeModelList[index].result == null ||
                      _GeocodeModelList[index].result!.isEmpty)
                    return Container();
                  return ListTile(
                    onTap: () {
                      _saveAddressAndGoToNextPage(
                          _GeocodeModelList[index].result![0].text ?? "");
                    },
                    title: Text(_GeocodeModelList[index].result![0].text ?? ""),
                    subtitle:
                        Text(_GeocodeModelList[index].result![0].zipcode ?? ""),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  _saveAddressAndGoToNextPage(String address) async {
    await _savedAddressOnSharedPreference(address);

    context.read<PageController>().animateToPage(
          2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
  }

  _savedAddressOnSharedPreference(String address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);
  }
}
