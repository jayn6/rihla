import 'package:flutter/material.dart';


class ErreurReseau extends StatelessWidget {
  final String message;
  final VoidCallback onReessayer;
 
  const ErreurReseau({
    super.key, 
  required this.message, 
  required this.onReessayer});
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_off, color: Theme.of(context).colorScheme.error, size: 64),
            const SizedBox(height: 16),
            Text(message),
            const Text('Vérifiez que json-server est lancé.'),
            FilledButton.tonalIcon(
              onPressed: onReessayer,
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );

      
      
    
    

    // TODO 4 : Column centrée : Icon(Icons.cloud_off) en couleur d'erreur,
    //          le message, « Vérifiez que json-server est lancé. »,
    //          et un FilledButton.tonalIcon « Réessayer » qui appelle onReessayer
    
  }
  
}
