import 'package:flutter/material.dart';

class TrackScreen extends StatefulWidget {
  final String trackingId;

  const TrackScreen({
    super.key,
    required this.trackingId,
  });

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  final TextEditingController _trackingIdController = TextEditingController();

  // Variables pour stocker les détails
  String colis = '';
  String poids = '';
  String montant = '';
  String transport = '';
  String client = '';
  String contact = '';
  String statut = '';

  @override
  void initState() {
    super.initState();
    // Remplir le champ avec le trackingId passé et lancer la recherche
    if (widget.trackingId.isNotEmpty) {
      _trackingIdController.text = widget.trackingId;
      _searchPackage(widget.trackingId);
    }
  }

  void _searchPackage(String trackingId) {
    // Exemple de logique de recherche basée sur un ID de suivi
    if (trackingId == '12345') {
      setState(() {
        colis = 'Ordinateur';
        poids = '50kg';
        montant = '10.000.000';
        transport = 'Avion';
        client = 'You Karlo';
        statut = 'Embarquement';
        contact = '0752582582';
      });
    } else {
      // Si l'ID ne correspond pas, effacer les détails
      setState(() {
         colis = '';
         poids = '';
         montant = '';
         transport = '';
         client = '';
         contact = '';
         statut = '';
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
        title: const Text(
          'Mon colis',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ElevatedButton(
                              onPressed: () => _searchPackage(_trackingIdController.text),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF7F3E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10),
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
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(Icons.location_on, 'Type de colis', colis),
                          const Divider(),
                          _buildDetailRow(Icons.scale , 'Poids/Volume', poids),
                          const Divider(),
                          _buildDetailRow(Icons.numbers, 'Montant', montant),
                          const Divider(),
                          _buildDetailRow(Icons.airplane_ticket, 'Transport', transport),
                          const Divider(),
                          _buildDetailRow(Icons.person, 'Nom du Client', client),
                          const Divider(),
                          _buildDetailRow(Icons.phone, 'N° Téléphone', contact),
                          const Divider(),
                          _buildDetailRow(Icons.check_circle, 'Statut', statut),
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
          Icon(icon, color: const Color(0xFF135EFF)),
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
