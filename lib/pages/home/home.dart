import 'package:flutter/material.dart';
import 'package:login_signup/pages/home/widgets/category.dart';
import 'package:login_signup/pages/home/widgets/header.dart';
import 'package:login_signup/pages/home/widgets/customBottomNavigationBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F67EA),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform(
              transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(150, 50),
              child: Image.asset(
                'assets/images/bg_liquid.png',
                width: 200,
              ),
            ),
            Positioned(
              right: 0,
              top: 200,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(20),
                origin: const Offset(180, 100),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 30),
                const HeaderSection(),
                const SizedBox(height: 50),
                CategorySection(),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(index: 0,),
    );
  }
}
