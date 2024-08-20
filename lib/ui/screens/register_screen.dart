import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _selectedTransport;
  String? _selectedStatut;
  String? embarquement;

  TextEditingController _typeController = TextEditingController();
  TextEditingController _poidsController = TextEditingController();
  TextEditingController _montantController = TextEditingController();
  TextEditingController _transportController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _statutController = TextEditingController();

  final List<String> _transports = ['Avion', 'Bateau'];
  final List<String> _statuts = [
    'Réception',
    'Embarquement',
    'En transit',
    'Arrivé à Abidjan',
    'Déclaration en douane',
    'Disponible',
    'Retiré'
  ];


@override
  Widget build(BuildContext context) {

  void saveColis(){
    if(_typeController.text.isNotEmpty && _poidsController.text.isNotEmpty &&
        _montantController.text.isNotEmpty && _nomController.text.isNotEmpty &&
        _telController.text.isNotEmpty){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enregistrement de colis'),
            content: const Text('Le colis a été enregistré avec le N° 124112'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Aucun Enregistrement'),
            content: const Text('Aucun enregistrement n\'a été effectué.\nVeuillez remplir tous les champs'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }

  }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF80C4E9),
        elevation: 0,
        title: const Text(
          'Enregistrer mon colis',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF80C4E9),
              Color(0xFFFCE5C0),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  _buildTextField('Type de colis', _typeController),
                  const SizedBox(height: 10.0),
                  _buildTextField('Poids/Volume', _poidsController),
                  const SizedBox(height: 10.0),
                  _buildTextField('Montant', _montantController),
                  const SizedBox(height: 10.0),
                  _buildDropdownField('Transport', _transports, _selectedTransport, (String? newValue) {
                    setState(() {
                      _selectedTransport = newValue;
                    });
                  }),
                  const SizedBox(height: 10.0),
                  _buildTextField('Nom du Client', _nomController),
                  const SizedBox(height: 10.0),
                  _buildTextField('N° Téléphone', _telController),
                  const SizedBox(height: 10.0),
                  _buildDropdownField('Statut', _statuts, _selectedStatut, (String? newValue) {
                    setState(() {
                      _selectedStatut = newValue;
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: saveColis,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7F3E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: const Text(
                'Enregistrer',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[600],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return SizedBox(
      width: double.infinity,
      height: 60.0,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF6F6F6),
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.grey[600],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        value: selectedValue,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

