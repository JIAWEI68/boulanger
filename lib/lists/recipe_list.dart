import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/services/firestore_services.dart';

import '../models/recipe.dart';

class RecipeProvider with ChangeNotifier {
  FirestoreService firestoreService = FirestoreService();

  List<Recipe> myRecipes = [
    Recipe(
        id: "0",
        imageUrl:
            "https://www.recipetineats.com/wp-content/uploads/2019/12/Christmas-Cake-decorated-with-fondant-marzipan-and-cherries.jpg",
        recipeName: "Christmas Cake",
        description: "Christmas Cake is a traditional fruit cake with a rich, "
            "velvety texture that’s so full flavoured and moist it can be eaten plain. "
            "But no one turns away a slosh of custard! Usually Christmas Cakes need to be started the day before, with overnight soaking of dried fruit. "
            "But not mine! Terrific made on the day, keeps for ages, and it’s just as delicious made with or without alcohol. "
            "Go wild with the decorations – or keep it simple!",
        vegetarian: true,
        difficulty: "Easy",
        madeBy: "Nagi",
        category: "Cake",
        //this is to make it so that the text shows the string directly
        steps: '''FAST SOAKED FRUIT:
Place dried fruit and juice/brandy in a large microwavable container. Microwave 1 1/2 minutes on high or until hot.
Stir to coat all fruit in liquid. Cover then set aside for 1 hour (to plump up/soak and cool).
CAKE:
Preheat oven to 160°C / 320°F (140°C fan). Grease and line a 21 – 22 cm / 8 – 9" round cake pan with baking paper (parchment paper) (7 cm / 2.75" tall).
Using an electric beater, beat butter and sugar until smooth and creamy (about 1 minute on speed 5).
Add oil and molasses, beat until combined.
Add salt, spices and baking powder – beat until incorporated.
Add eggs, one at a time, beating until just incorporated
Stir in the flour.
When mostly incorporated, stir in the fruit mix (including all the extra liquid in bowl) and walnuts (if using).
Pour into cake pan, cover with foil and bake for 3 hours 15 minutes, removing foil the last 45 minutes. Skewer inserted into middle should come out clean with no batter on it.
Remove from oven and cool for 20 minutes before transferring to cooling rack. Cool completely before serving.
Cake is moist and so full flavoured, it can be eaten plain. But see below for decorating and serving ideas (traditionally served with pouring custard).
Cutting: Either cut into thin wedges, or cut cake into thin strips (2cm / 0.75" or so), then cut those strips into serving size pieces.
CHRISTMAS CAKE DECORATING OPTIONS:
Traditional White Christmas Cake (pictured in post) – Marzipan and fondant, see Decorating Note.
Simple – pile top with fresh cherries or other fruit, dust with icing sugar (powdered sugar). Wrap a ribbon around the cake for extra touch!
Drippy white glaze – use the glaze in this Lemon Cake recipe, but leave out the lemon juice (ie make a plain sweet white glaze). Flip cake upside down for flat surface then glaze per that recipe.
Serving – serve with custard for a traditional experience! Either homemade custard or store bought pouring custard (jazz it up by mixing in vanilla seed paste!).''',
        //this is to make it so that the text shows the string directly
        ingredients: '''FAST SOAKED FRUIT (NOTE 1):
▢300g / 10 oz raisins
▢150g / 5 oz diced dried apricots , chopped 8 mm / 1/3"
▢75g / 2.5 oz mixed peel , diced 5mm / 1/5
▢150g / 5 oz glace cherries , chopped 8 mm / 1/3"
▢180g / 6 oz dates , diced 5mm / 1/5"
▢1 cup + 2 tbsp apple juice, OR 1/3 brandy + 2/3 juice (Note 2)
CAKE:
▢115g / 8 tbsp unsalted butter , softened (1 US stick)
▢1 1/2 cups dark brown sugar , packed (Note 3)
▢1/2 cup vegetable oil (or canola, peanut, grapeseed)
▢3 tbsp molasses or golden syrup (Note 4)
▢1/2 tsp salt
▢1/2 tsp all spice
▢1/2 tsp cinnamon
▢1/2 tsp nutmeg
▢3 eggs
▢1/2 tsp baking powder
▢1 2/3 cups plain flour (all purpose flour)
▢3/4 cup walnuts , chopped (optional)
FOR SERVING (OPTIONAL)
▢500ml / 1 pint pouring custard , homemade or store bought (Note 5)
WHITE CHRISTMAS CAKE DECORATION, AS PICTURED (OPTIONAL)
▢250g / 8 oz "ready to roll" marzipan
▢250g / 8 oz "ready to roll" white fondant
▢Cherries dusted with icing sugar
OTHER DECORATING OPTIONS (OPTIONAL)
▢Cherries or other fruit dusted with icing sugar (on plain cake, looks very pretty!)
▢Drippy white glaze (directions below)''',
        calories: 500),
    Recipe(
        id: "1",
        imageUrl:
            "https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/16714-birthday-cake-600x600.jpg?ext=.jpg",
        recipeName: "Birthday Cake",
        description:
            "This easy-to-prepare yellow cake recipe with buttercream frosting will be welcome at any birthday celebration. It's the perfect cake to eat with ice cream",
        vegetarian: false,
        difficulty: "Medium",
        madeBy: "Land O Lakes",
        category: "Cake",
        //this is to make it so that the text shows the string directly
        steps: '''STEP 1

Heat oven to 350°F. Grease and flour 2 (9-inch) round baking pans. Set aside.

STEP 2

Combine flour, baking powder and 1/2 teaspoon salt in bowl. Set aside.

STEP 3

Beat 1 1/2 cups sugar and 3/4 cup butter in another bowl at medium speed, scraping bowl occasionally, until creamy. Add eggs, 1 at a time, beating well after each addition. Add 1 tablespoon vanilla; mix well. Add flour mixture alternately with milk, beating at low speed after each addition just until mixed.

STEP 4

Divide batter evenly between prepared pans. Bake 30-35 minutes or until toothpick inserted near center comes out clean. Place onto cooling racks; cool 10 minutes. Loosen cake by running knife around inside edge of pans. Carefully remove cake from pans; cool completely.

STEP 5

Beat 3/4 cup butter in bowl at medium speed until creamy. Gradually add powdered sugar and 1/8 teaspoon salt alternately with whipping cream and 1 teaspoon vanilla, scraping bowl often, until well mixed.

STEP 6

Place 1 cake layer on serving plate, bottom-side up; frost top. Place remaining cake layer over frosting, bottom-side down; frost top and sides of cake. Decorate as desired.''',
        //this is to make it so that the text shows the string directly
        ingredients: '''CAKE

3 cups all-purpose flour

1 tablespoon baking powder

1/2 teaspoon salt

1 1/2 cups sugar

3/4 cup Land O Lakes® Butter, softened

4 large Land O Lakes® Eggs

1 tablespoon vanilla extract

1 cup milk

FROSTING

3/4 cup Land O Lakes® Butter, softened

6 cups powdered sugar

1/8 teaspoon salt

1/3 cup Land O Lakes® Heavy Whipping Cream

1 teaspoon vanilla extract''',
        calories: 550),
    Recipe(
        id: "2",
        imageUrl:
            "https://natashaskitchen.com/wp-content/uploads/2021/02/Red-Velvet-Cake-4.jpg",
        recipeName: "Red Velvet Cake",
        description:
            "This easy-to-prepare yellow cake recipe with buttercream frosting will be welcome at any birthday celebration. It's the perfect cake to eat with ice cream",
        vegetarian: false,
        difficulty: "Medium",
        madeBy: "Land O Lakes",
        category: "Cake",
        //this is to make it so that the text shows the string directly
        steps: '''
1.Preheat oven to 350˚F with racks in the center of the oven. Grease two 9-inch round cake pans with butter and dust with flour, tapping out the excess.

2.Stir then sift together 2 1/2 cups flour, 2 Tbsp cocoa powder, 1 tsp baking soda and 1/2 tsp salt.

3.In a bowl with an electric mixer, beat together 1/2 cup softened butter and 1 1/2 cups sugar for a few minutes until sugar is moistened and the mixture looks powdery like snow.

4.Mix in two eggs, adding them one a time, and beating well to incorporate between each addition. Beat in 2 tsp vanilla extract until blended.

5.With the mixer on, gradually add 3/4 cup oil and mix on medium speed until well incorporated.

6.Stir 1 tsp vinegar into your buttermilk then mix it into the batter on medium speed until incorporated.

7.Add flour mixture all at once and mix on medium speed just until well blended and no streaks of flour remain, scraping down the bowl as needed.

8.Add 1/2 tsp gel red food coloring or add it to reach desired color and mix just until blended, scraping down the bowl as needed.

9.Divide evenly between prepared pans and bake at 350˚F for 30 minutes. Let rest in cake pans for 20 minutes then invert onto a wire rack and let cool completely to room temp before assembling with Cream Cheese Frosting.''',
        //this is to make it so that the text shows the string directly
        ingredients: '''
2 1/2 cups all-purpose flour, plus more to dust the pans
2 Tbsp unsweetened cocoa powder
1 tsp baking soda
1/2 tsp salt
1/2 cup unsalted butter, room temperature, plus more to grease pans
1 1/2 cups granulated sugar
2 tsp vanilla extract
2 large eggs, room temp
3/4 cup light olive oil or vegetable oil
1 cup low-fat buttermilk, room temp
1 tsp white distilled vinegar
1/2 tsp red gel food coloring''',
        calories: 600)
  ];

  //to filter out the value based on this string
  String searchString = "";
  List<Recipe> recipeList = [];
  bool checkVegetarian = false;
  List<Recipe> getAllRecipe() {
    return recipeList;
  }

  void addRecipes(id, imageUrl, recipeName, description, vegetarian, difficulty,
      madeBy, category, steps, ingredients, calories) {
    myRecipes.insert(
        0,
        Recipe(
            id: id,
            imageUrl: imageUrl,
            recipeName: recipeName,
            description: description,
            vegetarian: vegetarian,
            difficulty: difficulty,
            madeBy: madeBy,
            category: category,
            steps: steps,
            ingredients: ingredients,
            calories: calories));
    notifyListeners();
  }

  RecipeProvider() {
    FirebaseFirestore.instance
        .collection("recipes")
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        Recipe recipe = Recipe.fromMap(change.doc.data()!, change.doc.id);
        switch (change.type) {
          case DocumentChangeType.added:
            recipeList.add(recipe);
            break;
          case DocumentChangeType.modified:
            recipeList.removeWhere((element) => element.id == recipe.id);
            recipeList.add(recipe);
            // TODO: Handle this case.
            break;
          case DocumentChangeType.removed:
            recipeList.removeWhere((element) => element.id == recipe.id);
            // TODO: Handle this case.
            break;
        }
      }
    });
  }
}
