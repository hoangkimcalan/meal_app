import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.schedule,
                              size: 50,
                              color: Color.fromARGB(255, 24, 162, 28),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${meal.duration} min',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 24, 162, 28),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.work,
                              size: 50,
                              color: Color.fromARGB(255, 155, 112, 18),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              complexityText,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 155, 112, 18),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const Icon(
                                Icons.attach_money,
                                size: 50,
                                color: Color.fromARGB(255, 24, 90, 145),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                affordabilityText,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 24, 90, 145),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Ingredients : ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Column(
                children: [
                  for (final ingredient in meal.ingredients)
                    Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Color.fromARGB(255, 183, 126, 82),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          ingredient,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 16,
                              ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Directions :',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (meal.steps.indexOf(step) + 1).toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 183, 126, 82),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 1,
                        height: 36,
                        color: const Color.fromARGB(255, 183, 126, 82),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          step,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
