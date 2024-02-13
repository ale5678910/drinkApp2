import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail_test_3/UI/component/element_drink_detail.dart';
import 'package:cocktail_test_3/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  const DrinkDetail(this.drink, {super.key});

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drink.name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: SizedBox(
                width: 200,
                height: 200,
                child: CachedNetworkImage(
                  imageUrl: drink.urlThumb,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Image(image: AssetImage('asset/murloc.png')),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElementDrinkDetail("Category", drink.category),
            ElementDrinkDetail("Glass", drink.glass),
            ElementDrinkDetail("Alcoholic", drink.alcoholic ? "YES" : "NOT"),
            ElementDrinkDetail("Instruction", setInstruction()),
            ElementDrinkDetail("Ingredient", setIngredient()),
          ],
        ),
      ),
    );
  }

  String setInstruction() {
    String res = "NOT FOUND";
    drink.instructions.map((e) => {
          if (e.language == "eng")
            {
              if (e.text.isNotEmpty) {res = e.text}
            }
        });
    return res;
  }

  String setIngredient() {
    String res = "NOT FOUND";
    drink.ingredients.map((e) => {res = "$res${e.name}  ${e.measure}\n"});
    return res;
  }
}
