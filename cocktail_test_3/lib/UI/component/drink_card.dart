import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail_test_3/models/drink.dart';
import 'package:flutter/material.dart';

import '../screen/drink_detail.dart';

class DrinkCard extends StatefulWidget {
  const DrinkCard({super.key, required this.drink});
  final Drink? drink;

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: widget.drink?.urlThumb ?? '',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Image(image: AssetImage('asset/murloc.png')),
          ),
        ),
        title: Text(
          widget.drink?.name ?? " ",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.drink?.category ?? '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
          /*onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DrinkDetail(widget.drink)));
        },*/
      ),
    );
  }
}
