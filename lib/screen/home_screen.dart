
import 'package:flutter/material.dart';

import 'package:rihla/widgets/hero_banner.dart';
import 'package:rihla/widgets/home_header.dart';
import 'package:rihla/widgets/search_box.dart';
import 'package:rihla/widgets/destination_card.dart';
import 'package:rihla/widgets/section_title.dart';

import '../data/destinations.dart';
import '../models/destination.dart';
import '../services/api_service.dart';
import '../widgets/ErreurReseau.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _categorie = 'Tout';
  int _onglet = 0;

  late Future<List<Destination>> _futurDestinations;

  @override
  void initState() {
    super.initState();
    _futurDestinations = ApiService.getDestinations();
  }

  List<Destination> _filtrer(List<Destination> toutes) {
    return _categorie == 'Tout'
        ? toutes
        : toutes.where((d) => d.categorie == _categorie).toList();
  }

  Future<void> _recharger() async {
    final futur = ApiService.getDestinations();

    setState(() {
      _futurDestinations = futur;
    });

    try {
      await futur;
    } catch (_) {}
  }

  Widget _construireExplorer() {
    return FutureBuilder<List<Destination>>(
      future: _futurDestinations,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Error
        if (snapshot.hasError) {
          return ErreurReseau(
            message: snapshot.error.toString(),
            onReessayer: _recharger,
          );
        }

        // Data received
        final destinations = snapshot.data ?? [];

        return RefreshIndicator(
          onRefresh: _recharger,
          child: _construireAccueil(destinations),
        );
      },
    );
  }

  Widget _construireAccueil(List<Destination> destinations) {
    final filtrees = _filtrer(destinations);

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      children: [
        const HomeHeader(prenom: 'Nouran'),
        const SizedBox(height: 20),
        const SearchBox(),

        if (destinations.isNotEmpty)
          HeroBanner(destination: destinations.first),

        const SectionTitle(title: 'Categories'),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final c in categories)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(c),
                    selected: _categorie == c,
                    onSelected: (_) {
                      setState(() {
                        _categorie = c;
                      });
                    },
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        const SectionTitle(
          title: 'Populaires',
          action: 'Voir tout',
        ),

        const SizedBox(height: 12),

        if (filtrees.isEmpty)
          const Center(
            child: Text('Aucune destination disponible'),
          ),

        for (final d in filtrees)
          DestinationCard(
            key: ValueKey(d.id),
            destination: d,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _onglet == 0
            ? _construireExplorer()
            : const Center(
                child: Text('Bientôt disponible'),
              ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _onglet,
        onDestinationSelected: (index) {
          setState(() {
            _onglet = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explorer',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
