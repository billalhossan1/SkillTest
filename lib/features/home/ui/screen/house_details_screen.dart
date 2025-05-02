import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_test/app/app_colors.dart';
import 'package:skill_test/app/custom_app_data.dart';
import 'package:skill_test/features/home/controller/see_more_controller.dart';
import 'package:skill_test/features/home/ui/widget/details_screen_widget/details_house_card.dart';
import 'package:skill_test/features/home/ui/widget/details_screen_widget/details_profile_card.dart';
import 'package:skill_test/features/home/ui/widget/details_screen_widget/gellery.dart';
import 'package:skill_test/features/home/ui/widget/details_screen_widget/rent_widget.dart';

class HouseDetailsScreen extends StatefulWidget {
  const HouseDetailsScreen({super.key});
  static String name = '/house-details';

  @override
  State<HouseDetailsScreen> createState() => _HouseDetailsScreenState();
}

class _HouseDetailsScreenState extends State<HouseDetailsScreen> {
  final SeeMoreController seeMoreController = Get.find<SeeMoreController>();

  final String fullDescription =
      'Hi, I am Billal Hossan, I am a Flutter developer. I am currently studying at Dhaka International University. This is a sample description text to test See More and See Less toggle behavior.';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DetailsHouseCard(),
                const SizedBox(height: 16),
                CustomAppData.primaryText('Description'),
                const SizedBox(height: 8),
                Obx(() {
                  final isExpanded = seeMoreController.isExpanded.value;
                  return GestureDetector(
                    onTap: seeMoreController.manageExpanded,
                    child: RichText(
                      text: TextSpan(
                        text:
                            isExpanded
                                ? fullDescription
                                : '${fullDescription.substring(0, 50)}...',
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                            text: isExpanded ? ' See Less' : ' See More',
                            style: TextStyle(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(height: 20),
                DetailsProfileCard(),
                SizedBox(height: 20),
                GalleryWidget(),
                SizedBox(height: 20,),
                RentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
