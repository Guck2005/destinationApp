import 'package:flutter/material.dart';

import 'package:login_signup/pages/restaurant/widget/listRestaurant.dart';

class CategorySection extends StatelessWidget {
  CategorySection({Key? key});

  final categories = [
    {
      'icon': Icons.airplanemode_active_outlined,
      'color': const Color(0xFF605CF4),
      'title': 'Africains'
    },
    {
      'icon': Icons.hotel_outlined,
      'color': const Color(0xFFFC77A6),
      'title': 'Européen'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 140,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Column(
                children: [
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: categories[index]['color'] as Color),
                    child: Icon(
                      categories[index]['icon'] as IconData,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    categories[index]['title'] as String,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              separatorBuilder: (_, index) => const SizedBox(width: 33),
              itemCount: categories.length,
            ),
          ),

          // Container(
          //   width: 410,
          //   child: const Text(
          //     'Destinations Populaires',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
          Expanded(
              child: ListeRestaurant(),
            ),
          
        ],
      ),
    );
  }
}
