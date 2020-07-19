import 'package:flutter/material.dart';

class MolRecipeListItemWidget extends StatelessWidget {
  final String title;
  final List<String> ingredients;

  const MolRecipeListItemWidget({Key key, this.title, this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 4),
          Text(
            'Ingredients:',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 2),
          ...List.generate(
            ingredients.length,
            (index) => Text(
              ingredients[index],
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
