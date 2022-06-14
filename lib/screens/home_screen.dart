import 'package:flutter/material.dart';
import 'package:recipes_app/list_views/recipe_list_view.dart';
import 'package:recipes_app/models/recipe.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Recipe> myRecipes = [
      Recipe(
          "https://www.recipetineats.com/wp-content/uploads/2019/12/Christmas-Cake-decorated-with-fondant-marzipan-and-cherries.jpg",
          "Christmas Cake",
          "Christmas Cake is a traditional fruit cake with a rich, velvety texture that’s so full flavoured and moist it can be eaten plain. But no one turns away a slosh of custard! Usually Christmas Cakes need to be started the day before, with overnight soaking of dried fruit. But not mine!Terrific made on the day, keeps for ages, and it’s just as delicious made with or without alcohol. Go wild with the decorations – or keep it simple!",
          true,
          "Easy",
          "Nagi",
          "Place dried fruit and juice/brandy in a large microwavable container. Microwave 1 1/2 minutes on high or until hot. Stir to coat all fruit in liquid. Cover then set aside for 1 hour (to plump up/soak and cool). Preheat oven to 160°C / 320°F (140°C fan). Grease and line a 21 – 22 cm / 8 – 9 inch round cake pan with baking paper (parchment paper) (7 cm / 2.75 inch tall).Using an electric beater, beat butter and sugar until smooth and creamy (about 1 minute on speed 5).Add oil and molasses, beat until combined.Add salt, spices and baking powder – beat until incorporated.Add eggs, one at a time, beating until just incorporatedStir in the flour.When mostly incorporated, stir in the fruit mix (including all the extra liquid in bowl) and walnuts (if using).Pour into cake pan, cover with foil and bake for 3 hours 15 minutes, removing foil the last 45 minutes. Skewer inserted into middle should come out clean with no batter on it.Remove from oven and cool for 20 minutes before transferring to cooling rack. Cool completely before serving.Cake is moist and so full flavoured, it can be eaten plain. But see below for decorating and serving ideas (traditionally served with pouring custard).Cutting: Either cut into thin wedges, or cut cake into thin strips (2cm / 0.75 or so), then cut those strips into serving size pieces.",
          500),
      Recipe(
          "https://storcpdkenticomedia.blob.core.windows.net/media/recipemanagementsystem/media/recipe-media-files/recipes/retail/x17/16714-birthday-cake-600x600.jpg?ext=.jpg",
          "Birthday Cake",
          "This easy-to-prepare yellow cake recipe with buttercream frosting will be welcome at any birthday celebration. It's the perfect cake to eat with ice cream.",
          false,
          "Medium",
          "Land O Lakes",
          "STEP 1 Heat oven to 350°F. Grease and flour 2 (9-inch) round baking pans. Set aside. STEP 2 Combine flour, baking powder and 1/2 teaspoon salt in bowl. Set aside. STEP 3 Beat 1 1/2 cups sugar and 3/4 cup butter in another bowl at medium speed, scraping bowl occasionally, until creamy. Add eggs, 1 at a time, beating well after each addition. Add 1 tablespoon vanilla; mix well. Add flour mixture alternately with milk, beating at low speed after each addition just until mixed. STEP 4 Divide batter evenly between prepared pans. Bake 30-35 minutes or until toothpick inserted near center comes out clean. Place onto cooling racks; cool 10 minutes. Loosen cake by running knife around inside edge of pans. Carefully remove cake from pans; cool completelySTEP 5Beat 3/4 cup butter in bowl at medium speed until creamy. Gradually add powdered sugar and 1/8 teaspoon salt alternately with whipping cream and 1 teaspoon vanilla, scraping bowl often, until well mixed.STEP 6 Place 1 cake layer on serving plate, bottom-side up; frost top. Place remaining cake layer over frosting, bottom-side down; frost top and sides of cake. Decorate as desired.",
          550)
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: 606,
          child: RecipesListView(myRecipes),
        )
      ]),
    );
  }
}