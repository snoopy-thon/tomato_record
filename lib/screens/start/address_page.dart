import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tomato_record/constants/common_size.dart';

class AddressPage extends StatelessWidget {
  AddressPage({super.key});
  List<int> demos = List.generate(30, (index) => index);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: commonPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
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
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.compass,
              color: Colors.white,
              size: 20,
            ),
            style: FilledButton.styleFrom(
              minimumSize: const Size(10, 48),
            ),
            label: const Text(
              '현재 위치로 찾기',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: commonPadding),
              //shrinkWrap: true,
              itemCount: demos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('address $index'),
                  subtitle: Text('subtitle $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
