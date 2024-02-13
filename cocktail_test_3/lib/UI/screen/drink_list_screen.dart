import 'package:cocktail_test_3/UI/component/drink_card.dart';
import 'package:cocktail_test_3/UI/screen/add_drink_screen.dart';
import 'package:cocktail_test_3/data/dio_client.dart';
import 'package:cocktail_test_3/models/data_repository.dart';
import 'package:flutter/material.dart';

import '../../models/drink.dart';

class DrinkListScreen extends StatefulWidget {
  const DrinkListScreen({super.key});

  @override
  State<DrinkListScreen> createState() => _DrinkListScreenState();
}

class _DrinkListScreenState extends State<DrinkListScreen> {
  //late DioClient dioClient;
  //List<Drink> drinks = [];
  //List<Drink> filteredDrink = [];
  //final TextEditingController textController = TextEditingController();


  DataManager dataManager = DataManager.internal();

  @override
  void initState() {
    super.initState();
    //dioClient = DioClient();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drink"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /*Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: Material(
              elevation: 4,
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      setState(() {
                        textController.clear();
                        _filterDrinks(filter: textController.text);
                      });
                    },
                  ),
                ),
                onChanged: (value) => {
                  setState(() {
                    _filterDrinks(filter: textController.text);
                  })
                },
              ),
            ),
          ),*/
          Expanded(
              child: ListView.builder(
                itemCount: dataManager.drink?.length,
                itemBuilder: (context, index) {
                  return DrinkCard(drink: dataManager.drink?[index]);
                  },
              )
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddDrinkScreen()))
        },
        tooltip: 'Add Cocktail',
        child: const Icon(Icons.add),
      ),*/
    );
  }

  void fetch() async {
    //drinks = await dioClient.fetchDrink();

    await dataManager.fetchDrink();

    setState(() {
      //filteredDrink = drinks;
    });
  }

  /*void _filterDrinks({String filter = ''}) {
    setState(() {
      if (filter.isEmpty) {
        filteredDrink = drinks;
      } else {
        filteredDrink = drinks
            .where((element) =>
                element.name.toLowerCase().contains(filter.toLowerCase()))
            .toList();
      }
    });
  }*/
}
