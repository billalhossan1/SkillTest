import 'package:flutter/material.dart';
import 'package:skill_test/app/app_colors.dart';
import 'package:skill_test/app/custom_app_data.dart';

class DetailsHouseCard extends StatefulWidget {
  const DetailsHouseCard({super.key});

  @override
  State<DetailsHouseCard> createState() => _DetailsHouseCardState();
}

class _DetailsHouseCardState extends State<DetailsHouseCard> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                // Background Image
                Image.network(
                  'https://media.istockphoto.com/id/1393537665/photo/modern-townhouse-design.jpg?s=612x612&w=0&k=20&c=vgQesOXDRzz0UfOZxmUtE-rFe75YgA9GvkKS8eeeumE=',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.withAlpha(200),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 16,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.withAlpha(100),
                      child: Icon(
                        Icons.bookmark_add_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dreamsville House',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Jl. Sultan Iskandar Muda',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          iconWidget(
                            Icon(Icons.bed_outlined, color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Text('6 Bedrooms',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(width: 15),
                          iconWidget(
                            Icon(Icons.bathtub_outlined, color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Text('4 Bathrooms',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 10),
      ],
    );
  }

  Widget iconWidget(Icon icon) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withAlpha(60),
      ),
      child: Center(child: icon),
    );
  }
}
