
import 'package:flutter/material.dart';
import '../models/destination.dart';
import 'package:rihla/widgets/favorite_button.dart';
class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
 


    return Card(
      shape: RoundedRectangleBorder(borderRadius: 
BorderRadius.circular(20)),
      elevation: 0,
      color: cs.surfaceContainerLow,
      margin: const EdgeInsets.only(bottom: 12),
      
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),

              child: Image.asset(
                destination.image,
                
                width: 88,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            // Destination information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    destination.nom,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Region
                  Row(
                    children: [
                      const Icon(
                        Icons.place_outlined,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(destination.region),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Rating and price
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(destination.note.toString()),
                      const Spacer(),
                      Text('${destination.prix} DT'), const FavoriteButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
