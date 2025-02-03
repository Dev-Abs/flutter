import 'package:flutter/material.dart';
import 'recipe.dart';


class RecipeDetail extends StatefulWidget {
  final MyRecipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300.0,
              width: double.infinity,
              // child: Image.asset(widget.recipe.imageURL, fit: BoxFit.cover),
              child: Image(image: AssetImage(widget.recipe.imageURL), fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              'Servings: ${widget.recipe.servings * sliderVal}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    '${widget.recipe.ingredients[index].quantity * sliderVal} ${widget.recipe.ingredients[index].measure} ${widget.recipe.ingredients[index].name}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
            // slider
            Slider(
              value: sliderVal.toDouble(),
              min: 1.0,
              max: 10.0,
              divisions: 10,
              label: '${sliderVal.round()}',
              onChanged: (double value) {
                setState(() {
                  sliderVal = value.round();
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}