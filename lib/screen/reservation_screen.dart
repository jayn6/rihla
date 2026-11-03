
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
final _dateCtrl = TextEditingController();
DateTime? _date; // null tant qu'aucune date n'est choisie 
String _formule = 'Essentiel'; 
bool _conditions = false;
  final _nomCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _telCtrl = TextEditingController();
  
int get _prixParPersonne => _formule == 'Confort' 
? (widget.destination.prix * 1.3).round() 
: widget.destination.prix;
int get _total => _prixParPersonne * widget.voyageurs;
  @override
  void dispose() {
    _nomCtrl.dispose();
    _emailCtrl.dispose();
    _telCtrl.dispose();
    _dateCtrl.dispose();
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
 Future<void> _choisirDate() async {
    final demain = DateTime.now().add(
      const Duration(days: 1),
    );

    final choisie = await showDatePicker(
      context: context,
      initialDate: _date ?? demain,
      firstDate: demain,
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      helpText: 'Date de départ',
    );

    // TODO 1 
    if (choisie == null) return;

    // TODO 2 
    setState(() {
      _date = choisie;

      _dateCtrl.text =
          '${choisie.day.toString().padLeft(2, '0')}/'
          '${choisie.month.toString().padLeft(2, '0')}/'
          '${choisie.year}';
    });
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
                    child: Column(
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
              ),),
              

              const SizedBox(height: 24),
const Text(
                'Vos coordonnées',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
             const SizedBox(height: 28),

              const Text(
                'Votre voyage',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 16),

             TextFormField(
                controller: _dateCtrl,
                readOnly: true,
                onTap: _choisirDate,
                decoration: _deco(
                  'Date de départ',
                  Icons.calendar_month_outlined,
                ), 
                  validator: (_) =>
                    _date == null
                        ? 'Choisissez une date'
                        : null,
              ),
                            const SizedBox(height: 24),

          const Text(
                'Choisissez votre formule',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 10),

              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'Essentiel',
                    label: Text('Essentiel'),
                    icon: Icon(
                      Icons.backpack_outlined,
                    ),
                  ),

                  ButtonSegment(
                    value: 'Confort',
                    label: Text('Confort +30 %'),
                    icon: Icon(
                      Icons.hotel_outlined,
                    ),
                  ),
                ],

                selected: {_formule},

                onSelectionChanged: (choix) {
                  setState(() {
                    _formule = choix.first;
                  });
                },
              ),

              const SizedBox(height: 16),

              // 5. Conditions
              CheckboxListTile(
                value: _conditions,

                onChanged: (v) {
                  setState(() {
                    _conditions = v ?? false;
                  });
                },

                controlAffinity:
                    ListTileControlAffinity.leading,

                contentPadding: EdgeInsets.zero,

                title: const Text(
                  "J'accepte les conditions d'annulation",
                ),

                subtitle: const Text(
                  'Annulation gratuite jusqu\'à 48 h avant',
                ),
              ),

              const SizedBox(height: 20),
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
