
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/destination.dart';
import '../models/reservation.dart';

class ReservationScreen extends StatefulWidget {
  final Destination destination;
  final int voyageurs;

  const ReservationScreen({
    super.key,
    required this.destination,
    required this.voyageurs,
  });

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nomCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _telCtrl = TextEditingController();

  @override
  void dispose() {
    _nomCtrl.dispose();
    _emailCtrl.dispose();
    _telCtrl.dispose();
    super.dispose();
  }

  InputDecoration _deco(String label, IconData icone,
      {String? aide}) {
    return InputDecoration(
      labelText: label,
      helperText: aide,
      prefixIcon: Icon(icone),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  // Validation du nom
  String? _validerNom(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Indiquez votre nom';
    }
    if (v.trim().length < 3) {
      return 'Au moins 3 caractères';
    }
    return null;
  }

  // Validation de l'email
  String? _validerEmail(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Indiquez votre e-mail';
    }

    if (!RegExp(r'^[\w.+-]+@[\w-]+\.[\w.]+$')
        .hasMatch(v.trim())) {
      return 'E-mail invalide (ex. : nom@mail.tn)';
    }

    return null;
  }

  // Validation du téléphone
  String? _validerTel(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Indiquez votre téléphone';
    }

    if (v.trim().length != 8) {
      return '8 chiffres attendus';
    }

    return null;
  }

  // Validation du formulaire
  void _valider() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Formulaire valide'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réserver'),
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // TODO 4 
              Container(  color: const Color.fromARGB(255, 163, 199, 228),
              child:Row(
                
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.destination.image,
                      width: 64,
                      height: 64,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination.nom,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${widget.destination.duree} jours',
                        ),
                        Text(
                          '${widget.voyageurs} voyageurs',
                        ),
                      ],
                    ),
                  ),
                ],
              ),)
              

              const SizedBox(height: 24),

              
              TextFormField(
                controller: _nomCtrl,
                decoration: _deco(
                  'Nom complet',
                  Icons.person_outline,
                ),
                textCapitalization:
                    TextCapitalization.words,
                textInputAction: TextInputAction.next,
                validator: _validerNom,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _emailCtrl,
                decoration: _deco(
                  'E-mail',
                  Icons.email_outlined,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: _validerEmail,
              ),

              const SizedBox(height: 16),

           
              TextFormField(
                controller: _telCtrl,
                decoration: _deco(
                  'Téléphone',
                  Icons.phone_outlined,
                  aide: '8 chiffres, sans indicatif',
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(8),
                ],
                validator: _validerTel,
              ),
            ],
          ),
        ),
      ),

      // TODO 7 : Bottom navigation bar
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: _valider,
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Confirmer'),
          ),
        ),
      ),
    );
  }
}
