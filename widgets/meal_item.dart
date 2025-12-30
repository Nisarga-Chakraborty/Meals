import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:transparent_image/transparent_image.dart'; // Add this to pubspec.yaml

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MealDetailsScreen(
                meal: meal,
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 44,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule, size: 17, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          "${meal.duration} min", // here i can also use -> " ${meal.duration} min"
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 6),
                        Icon(Icons.work, size: 17, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          meal.complexity.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 6),
                        Icon(Icons.attach_money, size: 17, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          meal.affordability.name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
