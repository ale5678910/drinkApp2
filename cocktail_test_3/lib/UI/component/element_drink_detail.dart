import 'package:flutter/cupertino.dart';

class ElementDrinkDetail extends StatelessWidget {
  const ElementDrinkDetail(this.e1, this.e2, {super.key});
  final String e1;
  final String e2;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    e1,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    e2,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
          ],
        ));
  }
}
