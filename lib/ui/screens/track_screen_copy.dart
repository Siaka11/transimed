import 'package:flutter/material.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final TextEditingController _trackingIdController = TextEditingController();

  // Variables pour stocker les détails
  String provenance = '';
  String article = '';
  String numero = '';
  String cartons = '';
  String client = '';
  String contact = '';

  void _searchPackage() {
    // Exemple de logique de recherche basée sur un ID de suivi
    if (_trackingIdController.text == '12345') {
      setState(() {
        provenance = 'France';
        article = 'Montre';
        numero = '1200255';
        cartons = '4';
        client = 'You Karlo';
        contact = '0752582582';
      });
    } else {
      // Si l'ID ne correspond pas, effacer les détails
      setState(() {
        provenance = '';
        article = '';
        numero = '';
        cartons = '';
        client = '';
        contact = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Mon colis',
            textAlign: TextAlign.center,
            style : TextStyle(
              color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF80C4E9), // Couleur plus claire en haut
              Color(0xFFFCE5C0), // Couleur plus foncée en bas
            ],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 100.0),
            // Recherche et détails en bas
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section de recherche
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            controller: _trackingIdController,
                            decoration: InputDecoration(
                              labelText: 'Tracking Id',
                              labelStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            width: double.infinity, // Prend toute la largeur disponible
                            padding: const EdgeInsets.symmetric(horizontal: 20.0), // Marge horizontale
                            child: ElevatedButton(
                              onPressed: _searchPackage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF7F3E), // Couleur du bouton
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10), // Ajuster le padding vertical
                              ),
                              child: const Text(
                                'Rechercher',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const Text(
                      'Détails de la recherche',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Détails du colis
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(Icons.location_on, 'Provenance', provenance),
                          const Divider(),
                          _buildDetailRow(Icons.shopping_cart, 'Article', article),
                          const Divider(),
                          _buildDetailRow(Icons.numbers, 'Numéro', numero),
                          const Divider(),
                          _buildDetailRow(Icons.inventory, 'Cartons', cartons),
                          const Divider(),
                          _buildDetailRow(Icons.person, 'Client', client),
                          const Divider(),
                          _buildDetailRow(Icons.phone, 'Contact', contact),
                        ],
                      ),
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

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon,  color: const Color(0xFF135EFF)),
          const SizedBox(width: 16.0),
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
