import 'package:cocktail_test_3/models/element_for_drink.dart';
import 'package:cocktail_test_3/models/ingredient.dart';
import 'package:flutter/material.dart';

import '../../data/dio_client.dart';

class AddDrinkScreen extends StatefulWidget {
  const AddDrinkScreen({super.key});

  @override
  State<AddDrinkScreen> createState() => _AddDrinkScreenState();
}

class _AddDrinkScreenState extends State<AddDrinkScreen> {
  late DioClient dioClient;

  ElementForCreation? element;

  final TextEditingController nameDrinkTextController = TextEditingController();
  final TextEditingController instructionDrinkTextController =
      TextEditingController();
  ScrollController scrollController = ScrollController();

  DataDrinkElement? category;
  DataDrinkElement? glass;
  Language? language;

  List<IngredientForm> ingredient = [];

  @override
  void initState() {
    super.initState();
    dioClient = DioClient();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Make your drink"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                controller: nameDrinkTextController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Drink name',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      setState(() {
                        nameDrinkTextController.clear();
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Category: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownMenu<DataDrinkElement>(
                        width: 200,
                        initialSelection: element?.categories.first,
                        onSelected: (DataDrinkElement? value) {
                          setState(() {
                            category = value;
                          });
                        },
                        dropdownMenuEntries: (element?.categories
                                .map<DropdownMenuEntry<DataDrinkElement>>(
                                    (DataDrinkElement value) {
                              return DropdownMenuEntry<DataDrinkElement>(
                                  value: value, label: value.name);
                            }).toList()) ??
                            [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Glass: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownMenu<DataDrinkElement>(
                        width: 200,
                        initialSelection: element?.glass.first,
                        onSelected: (DataDrinkElement? value) {
                          setState(() {
                            glass = value;
                          });
                        },
                        dropdownMenuEntries: (element?.glass
                                .map<DropdownMenuEntry<DataDrinkElement>>(
                                    (DataDrinkElement value) {
                              return DropdownMenuEntry<DataDrinkElement>(
                                  value: value, label: value.name);
                            }).toList()) ??
                            [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: TextField(
                maxLines: 3,
                controller: instructionDrinkTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Instruction',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text(
                      "Language: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownMenu<Language>(
                        width: 150,
                        initialSelection: element?.languages.first,
                        onSelected: (Language? value) {
                          setState(() {
                            language = value;
                          });
                        },
                        dropdownMenuEntries: (element?.languages
                                .map<DropdownMenuEntry<Language>>(
                                    (Language value) {
                              return DropdownMenuEntry<Language>(
                                  value: value, label: value.language);
                            }).toList()) ??
                            [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: Text(
                  "Ingredient",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
            addIngredient(),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    ingredient.add(IngredientForm(measure: "", name: ""));
                    scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  });
                },
                child: const Icon(
                  Icons.add,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
            onPressed: () {},
            child: const Text(
              "Create",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ))
      ],
    );
  }

  Widget addIngredient() {
    List<Widget> children;
    return Column(
      children: List.generate(
        ingredient.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownMenu<DataDrinkElement>(
                width: 230,
                onSelected: (DataDrinkElement? value) {
                  setState(() {
                    ingredient[index].name = value?.name ?? "";
                  });
                },
                dropdownMenuEntries: (element?.ingredients
                        .map<DropdownMenuEntry<DataDrinkElement>>(
                            (DataDrinkElement value) {
                      return DropdownMenuEntry<DataDrinkElement>(
                          value: value, label: value.name);
                    }).toList()) ??
                    [],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller:
                      TextEditingController(text: ingredient[index].measure),
                  onChanged: (value) {
                    ingredient[index].measure = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Measure',
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    ingredient.removeAt(index);
                  });
                },
                child: const Icon(
                  Icons.delete,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void fetch() async {
    element = await dioClient.fetchElement();
    setState(() {});
  }
}
