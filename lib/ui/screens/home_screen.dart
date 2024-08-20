import 'package:flutter/material.dart';
import 'package:transimed/ui/screens/login_screen.dart';
import 'package:transimed/ui/screens/track_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _trackingIdController = TextEditingController();

  void _searchPackage() {
    final trackingId = _trackingIdController.text.trim();

    if (trackingId.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TrackScreen(trackingId: trackingId),
        ),
      );
    } else {
      // Affiche un message si le champ est vide
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('ID de suivi manquant'),
            content: const Text('Veuillez entrer un Tracking Id.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 160),
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/images/logo.jpeg'),
                ),
                const Text(
                  'TRANSIMED HOLDING',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Meilleure façon de suivre votre colis',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color(0xFF350D8C),
                  ),
                ),
                const SizedBox(height: 30.0),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: ElevatedButton(
                                  onPressed: _searchPackage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF7F3E),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
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
                        const SizedBox(height: 20.0),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen()
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                 Text(
                                  'Se connecter',
                                  style: TextStyle(
                                    color: Color(0xFF350D8C),
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                 SizedBox(width: 4),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
