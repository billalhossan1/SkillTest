import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:skill_test/app/app_colors.dart';
import 'package:skill_test/app/custom_app_data.dart';
import 'package:skill_test/features/home/controller/selected_house_controller.dart';
import 'package:skill_test/features/home/controller/selected_location_controller.dart';
import 'package:skill_test/features/common/ui/widget/category_text_widget.dart';
import 'package:skill_test/features/home/ui/widget/home_house_card.dart';
import 'package:skill_test/features/home/ui/widget/house_list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  final List<String> houses = const [
    'House',
    'Apartment',
    'Hotel',
    'Vila',
    'Cottage',
    'Mansion',
  ];
  final List<String> locations = const [
    'Dhaka',
    'Khulna',
    'Chittagong',
    'Rajshahi',
    'Sylhet',
    'Feni',
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: GetBuilder<SelectedHouseController>(
        builder: (subjectController) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<SelectedLocationController>(
                          builder: (locationController) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomAppData.secondaryText('Location'),
                                PopupMenuButton<int>(
                                  onSelected: (index) {
                                    locationController.changeLocation(index);
                                  },
                                  itemBuilder: (context) {
                                    return List.generate(locations.length, (
                                      index,
                                    ) {
                                      final isSelected =
                                          index ==
                                          locationController.selectedIndex;
                                      return PopupMenuItem<int>(
                                        value: index,
                                        child: Row(
                                          children: [
                                            if (isSelected)
                                              const Icon(
                                                Icons.check,
                                                size: 18,
                                                color: AppColor.themeColor,
                                              ),
                                            if (isSelected)
                                              const SizedBox(width: 8),
                                            Text(
                                              locations[index],
                                              style: TextStyle(
                                                fontWeight:
                                                    isSelected
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                color:
                                                    isSelected
                                                        ? AppColor.themeColor
                                                        : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  },

                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        locations[locationController
                                            .selectedIndex],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const Icon(Icons.notification_add_outlined),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Search address or near you...",
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.themeColor,
                          ),
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.tune, color: Colors.white70),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const SizedBox(height: 10),

                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: houses.length,
                        itemBuilder: (context, index) {
                          final isSelected =
                              subjectController.selectedIndex == index;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(houses[index]),
                              selected: isSelected,
                              onSelected: (_) {
                                subjectController.changeIndex(index);
                              },
                              selectedColor: AppColor.themeColor,
                              backgroundColor: AppColor.themeColor.withAlpha(
                                20,
                              ),
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    CategoryTextWidget(
                      onTapSeeAll: () {},
                      categoryTittle: 'Near From You',
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 250, child: HomeHouseCard()),
                          SizedBox(width: 250, child: HomeHouseCard()),
                          SizedBox(width: 250, child: HomeHouseCard()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    CategoryTextWidget(
                      onTapSeeAll: () {},
                      categoryTittle: 'Best For You',
                    ),
                    Column(
                      children: [
                        HouseListCard(),
                        HouseListCard(),
                        HouseListCard(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
