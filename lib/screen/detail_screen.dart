
import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/favorite_button.dart';

class DetailScreen extends StatefulWidget {
  final Destination destination;

  const DetailScreen({super.key, required this.destination});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _voyageurs = 1;

  Widget _info(String titre, String valeur, IconData icone) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icone),
          const SizedBox(height: 8),
          Text(titre),
          const SizedBox(height: 4),
          Text(
            valeur,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image and overlays
              SizedBox(
                height: 340,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      destination.image,
                      fit: BoxFit.cover,
                    ),

                    Positioned(
                      top: 16,
                      left: 16,
                      child: Material(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 16,
                      right: 16,
                      child: const FavoriteButton(),
                    ),

                    Positioned(
                      top: 75,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(destination.note.toString()),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.nom,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white70,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                destination.region,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Details
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _info(
                            'Durée',
                            '${destination.duree} ',
                            Icons.schedule,
                          ),
                        ),
                        Expanded(
                          child: _info(
                            'Type',
                            destination.categorie,
                            Icons.category,
                          ),
                        ),
                        Expanded(
                          child: _info(
                            'Groupe',
                            destination.group.toString(),
                            Icons.group,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Text(
                      'À propos',
                   style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      destination.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 24),

                    Text(
                      'Nombre de voyageurs',
                     style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        IconButton.outlined(
                          onPressed: _voyageurs <= 1
                              ? null
                              : () {
                                  setState(() {
                                    _voyageurs--;
                                  });
                                },
                          icon: const Icon(Icons.remove),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Text(
                            '$_voyageurs',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),

                        IconButton.outlined(
                          onPressed: () {
                            setState(() {
                              _voyageurs++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Prix total'),
                    Text(
                      '${destination.prix * _voyageurs} DT',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton.filled(
                onPressed: () {
                  
                },

                icon: const Icon(Icons.check),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
