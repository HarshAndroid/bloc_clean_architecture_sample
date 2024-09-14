import 'package:flutter/material.dart';

import '../../data/model/ip_card.dart';

class IPCard extends StatelessWidget {
  final IPCardModel ipCardData;

  const IPCard({super.key, required this.ipCardData});

  @override
  Widget build(BuildContext context) {
    const r = BorderRadius.all(Radius.circular(15));

    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(borderRadius: r),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: r,
        onTap: () {},
        child: ListTile(
            minLeadingWidth: 0,
            shape: const RoundedRectangleBorder(borderRadius: r),
            leading: ipCardData.icon,
            //title
            title: Text(ipCardData.title),

            //subtitle
            subtitle: Text(ipCardData.value)),
      ),
    );
  }
}
