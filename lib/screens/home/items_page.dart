import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:tomato_record/constants/common_size.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Size size = MediaQuery.of(context).size;
      final imgSize = size.width / 4;
      return ListView.separated(
        padding: const EdgeInsets.all(commonPadding),
        itemCount: 5,
        itemBuilder: (context, index) {
          return SizedBox(
            height: imgSize,
            child: Row(
              children: [
                SizedBox(
                  height: imgSize,
                  width: imgSize,
                  child: ExtendedImage.network(
                    'https://picsum.photos/100',
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(
                  width: commonSmallPadding,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('work',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(
                        'American 5일전',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Text('700.00원'),
                      Expanded(
                        child: Container(),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 19,
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '123',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: commonPadding + 1,
            thickness: 1,
            color: Colors.grey[250],
            indent: commonSmallPadding,
            endIndent: commonSmallPadding,
          );
        },
      );
    });
  }
}
