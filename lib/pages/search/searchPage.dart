// ignore: file_names
import 'package:flutter/material.dart';
import 'package:login_signup/pages/home/widgets/customBottomNavigationBar.dart';
import 'package:login_signup/pages/home/widgets/header.dart';
import 'package:login_signup/pages/home/widgets/search.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF5F67EA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            const SizedBox(height: 20),
            SearchSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 2,),
    );
  }
}