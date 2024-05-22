import 'package:flutter/material.dart';
import 'package:login_signup/models/restaurant.dart';
import 'package:login_signup/pages/restaurant/widget/detail.dart';

class ListeRestaurant extends StatelessWidget {
  final List<Restaurant> restaurants = Restaurant.restaurant();

  ListeRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
            leading: Image.asset(restaurant.icon),
            title: Text(restaurant.name),
            subtitle: Text(restaurant.type),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(restaurant: restaurant),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
