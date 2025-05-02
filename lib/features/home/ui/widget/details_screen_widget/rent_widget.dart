import 'package:flutter/material.dart';
import 'package:skill_test/app/app_colors.dart';

class RentWidget extends StatelessWidget {
  const RentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white70,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Stack(
          children: [
            Image.network(
              'https://v.wpimg.pl/ZTZkNzI0dTU7CThJZkt4IHhRbBMgEnZ2L0l0WGYBaGxqE2EcIFw_Jj8bIVQuQi8kOxw-VDlcdTUqAmEMeB8-PSkbIhswHz85OA4qVSxSaGJjXyhPZAk4Mm9GekJ-U3c1Y1p2V34JOTFsD3lIfQY7Y3gW',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.grey,
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Price', style: TextStyle(color: Colors.black54)),
                        Text(
                          "Rp. 2.500.000.000 / Year",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed:(){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Action successful!"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:AppColor.themeColor,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      child: Text("Rent Now", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
