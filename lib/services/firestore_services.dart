import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes_app/models/recipe.dart';

class FirestoreService {
  addRecipes(imageUrl, recipeName, description, vegetarian, difficulty, madeBy,
      category, steps, ingredients, calories) {
    return FirebaseFirestore.instance.collection('recipes').add({
      'imageUrl': imageUrl,
      'recipeName': recipeName,
      'description': description,
      'vegetarian': vegetarian,
      'difficulty': difficulty,
      'madeBy': madeBy,
      'category': category,
      'steps': steps,
      'ingredients': ingredients,
      'calories': calories,
    });
  }

  downloadItem(imageUrl, recipeName, description, vegetarian, difficulty,
      madeBy, category, steps, ingredients, calories) {
    return FirebaseFirestore.instance.collection('downloads').add({
      'imageUrl': imageUrl,
      'recipeName': recipeName,
      'description': description,
      'vegetarian': vegetarian,
      'difficulty': difficulty,
      'madeBy': madeBy,
      'category': category,
      'steps': steps,
      'ingredients': ingredients,
      'calories': calories,
    });
  }

  favourite(imageUrl, recipeName, description, vegetarian, difficulty, madeBy,
      category, steps, ingredients, calories) {
    return FirebaseFirestore.instance.collection('favourites').add({
      'imageUrl': imageUrl,
      'recipeName': recipeName,
      'description': description,
      'vegetarian': vegetarian,
      'difficulty': difficulty,
      'madeBy': madeBy,
      'category': category,
      'steps': steps,
      'ingredients': ingredients,
      'calories': calories,
    });
  }

  List<Recipe> recipesList = [];

  Stream<List<Recipe>> getRecipes() {
    return FirebaseFirestore.instance.collection('recipes').snapshots().map(
        (snapshot) => snapshot.docs
            .map<Recipe>((doc) => Recipe.fromMap(doc.data(), doc.id))
            .toList());

  }


  Stream<List<Recipe>> getDownloaded() {
    return FirebaseFirestore.instance.collection('downloads').snapshots().map(
        (snapshot) => snapshot.docs
            .map<Recipe>((doc) => Recipe.fromMap(doc.data(), doc.id))
            .toList());
  }

  Stream<List<Recipe>> getFavourites() {
    return FirebaseFirestore.instance.collection('favourites').snapshots().map(
        (snapshot) => snapshot.docs
            .map<Recipe>((doc) => Recipe.fromMap(doc.data(), doc.id))
            .toList());
  }
}
