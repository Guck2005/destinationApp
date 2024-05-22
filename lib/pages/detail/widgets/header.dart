import 'package:flutter/material.dart';
import 'package:login_signup/models/game.dart';

class HeaderSection extends StatelessWidget {
  final Game game;
  const HeaderSection(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligner les colonnes à chaque extrémité
        children: [      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                game.type,
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Text(
                        game.score.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 15,
                      ),
                      Text(
                        '${game.download.toString()} k',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 30, // taille du cercle
                backgroundImage: AssetImage(game.icon), // image du guide
              ),
              const SizedBox(height: 5), // espacement entre l'image et le texte
              const Text(
                'Votre guide', // texte en dessous de l'image
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
