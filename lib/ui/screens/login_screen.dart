import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transimed/ui/screens/register_screen.dart';
import 'package:transimed/ui/screens/track_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    const  trackingId = '';

    void login() {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();
      if (email == 'transimed@gmail.com' && password == '123456789') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erreur de connexion'),
              content: const Text('Email ou mot de passe incorrect'),
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
              children: [
                const Spacer(flex: 2), // Ajoute de l'espace flexible en haut

                // Logo de l'application
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/images/logo.jpeg'), // Remplacez par le chemin de votre logo
                ),
                const SizedBox(height: 10), // Espacement entre le logo et le texte
                const Text(
                  'TRANSIMED HOLDING',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Meilleure façon de suivre votre colis',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF350D8C),
                  ),
                ),

                const Spacer(flex: 1), // Ajoute de l'espace flexible

                // Formulaire
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Votre email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Votre mot de passe',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity, // Prend toute la largeur disponible
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Marge horizontale
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFF7F3E), // Couleur du bouton
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10), // Ajuster le padding vertical
                    ),
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),


                const Spacer(flex: 2), // Ajoute de l'espace flexible

                // Illustration avec la loupe
                SvgPicture.asset(
                  'assets/middle/track.svg', // Remplacez par le chemin de votre SVG
                  height: 170,
                  width: 200,
                ),
                const SizedBox(height: 40),
                //Lien pour suivre son colis
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      const TrackScreen(trackingId: trackingId)),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Suivre son colis',
                        style: TextStyle(
                          color: Color(0xFF350D8C),
                          fontSize: 12.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(width: 4), // Espace entre le texte et l'icône
                      SvgPicture.asset(
                        'assets/images/arrow.svg', // Remplacez par le chemin de votre SVG
                        height: 8, // Ajustez la taille pour correspondre à la taille du texte
                        width: 8,
                      ),
                    ],
                  ),
                ),
                // Ajoute de l'espace flexible en bas
              ],
            ),
          );
        },
      ),
    );
  }
}
