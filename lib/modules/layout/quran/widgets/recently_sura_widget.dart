import 'package:flutter/material.dart';

import 'recently_item_widget.dart';

class RecentlySuraWidget extends StatelessWidget {
  const RecentlySuraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Most Recently',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: 155,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (BuildContext context, int index) {
              return RecentlyItemWidget();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10);
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
