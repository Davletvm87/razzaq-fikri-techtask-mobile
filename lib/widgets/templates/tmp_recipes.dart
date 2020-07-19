import 'package:flutter/material.dart';
import 'package:tech_task/widgets/atoms/atoms.dart';
import 'package:tech_task/widgets/organisms/org_recipes.dart';

class TmpRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AtmAppbarPrimary(
        context,
        text: 'Suggested Recipes',
      ),
      body: OrgRecipes(),
    );
  }
}
