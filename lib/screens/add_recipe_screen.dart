import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/lists/recipe_list.dart';

class AddRecipesScreen extends StatefulWidget {
  AddRecipesScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipesScreen> createState() => _AddRecipesScreenState();
}

class _AddRecipesScreenState extends State<AddRecipesScreen> {
  var form = GlobalKey<FormState>();

  String? recipeName;
  String? description;
  String? difficulty;
  bool? vegetarian;
  String? madeBy;
  String? steps;
  String? ingredients;
  String? imageUrl;
  int? calories;
  void addRecipe(RecipeList recipeList) {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      print(madeBy);
      print(description);
      recipeList.addRecipes(imageUrl, recipeName, description, vegetarian,
          difficulty, madeBy, steps, ingredients, calories);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Recipes added successfully!'),
      ));
      form.currentState!.reset();
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    RecipeList recipeList = Provider.of<RecipeList>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: const Color.fromRGBO(254, 238, 210, 10),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text("Upload Recipe"),
                Form(
                    key: form,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Recipe Name',
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter a name for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              recipeName = value as String;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Description',
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter a description for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              description = value as String;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Difficulty',
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter a difficulty for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              difficulty = value as String;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Calories',
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter a calorie for your recipe";
                              } else if (int.tryParse(value!) == "") {
                                return "Please enter a number for your calories";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              calories = int.parse(value!);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Description',
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter a description for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              description = value as String;
                            },
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                            ),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                  label: const Text('Vegetarian'),
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true),
                              items: const [
                                DropdownMenuItem(
                                  child: Text("Yes"),
                                  value: true,
                                ),
                                DropdownMenuItem(
                                  child: Text("No"),
                                  value: false,
                                )
                              ],
                              onChanged: (value) {
                                vegetarian = value as bool;
                              },
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text("Username"),
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter a username for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              madeBy = value as String;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text("Steps"),
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter the steps for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              steps = value as String;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text('Ingredients'),
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter the ingredients for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              ingredients = value as String;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: Text('Image Link'),
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true),
                            validator: (value) {
                              if (value == "") {
                                return "Please enter a image link for your recipe";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              imageUrl = value as String;
                            },
                          ),
                        ),
                      ],
                    )),
                ElevatedButton(
                    onPressed: () {
                      addRecipe(recipeList);
                    },
                    child: const Text("Upload")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"))
              ],
            ),
          ),
        ));
  }
}
