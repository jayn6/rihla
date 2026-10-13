
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context); 
     final cs = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
        color: Colors.white70,

     
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 12),
          const Expanded(
            child: Text('Rechercher une destination'),
          ),
          Icon(Icons.tune , color: cs.primary,),
        ],
      ),
    );
  }
}
