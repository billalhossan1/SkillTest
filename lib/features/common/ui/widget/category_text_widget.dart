import 'package:flutter/material.dart';
import 'package:skill_test/app/custom_app_data.dart';

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({
    super.key,
    required this.onTapSeeAll,
    required this.categoryTittle,
  });

  final String categoryTittle;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomAppData.primaryText(categoryTittle),
        TextButton(
          onPressed: onTapSeeAll,
          child: CustomAppData.secondaryText('See more'),
        ),
      ],
    );
  }
}
