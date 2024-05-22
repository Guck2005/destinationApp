import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int index;

  const CustomBottomNavigationBar({super.key, required this.index});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

void _onItemTapped(int index) {


  switch (index) {
    case 0:
      Navigator.pushReplacementNamed(context, '/home');
      break;
    case 1:
      Navigator.pushReplacementNamed(context, '/agenda');
      break;
    case 2:
      Navigator.pushReplacementNamed(context, '/search');
      break;
    case 3:
      Navigator.pushReplacementNamed(context, '/traduction');
      break;
    case 4:
      Navigator.pushReplacementNamed(context, '/messaging');
      break;
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFF5F67EA),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.index,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Accueil',
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Agenda',
                icon: Icon(
                  Icons.calendar_today_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Rechercher',
                icon: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Traduction',
                icon: Icon(
                  Icons.translate_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Messagerie',
                icon: Icon(
                  Icons.chat_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
