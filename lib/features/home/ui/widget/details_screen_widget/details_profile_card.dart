import 'package:flutter/material.dart';
import 'package:skill_test/app/app_colors.dart';

class DetailsProfileCard extends StatelessWidget {
  const DetailsProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            'https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg?ga=GA1.1.572064521.1737819328&semt=ais_hybrid&w=740',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Garry Allen',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Owner',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            profileIcon(Icon(Icons.phone,color: Colors.white,),),
           SizedBox(width: 12,),
           profileIcon(Icon(Icons.chat_bubble_outline, color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Container profileIcon(Icon icon) {
    return Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.themeColor.withAlpha(150)
            ),
            child: IconButton(
              icon: icon,
              onPressed: () {},
            ),
          );
  }
}
