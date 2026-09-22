import 'package:flutter/material.dart';

class CartaoEstudante extends StatelessWidget {
  final String nome;
  final String curso;
  final String ra;
  final String email;
  final String imagemUrl;

  const CartaoEstudante({
    super.key,
    required this.nome,
    required this.curso,
    required this.ra,
    required this.email,
    required this.imagemUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20.0),

      // EXERCÍCIO 4: Fundo gradiente
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.green,
          width: 2.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.green.shade50,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // EXERCÍCIO 1: Imagem real usando NetworkImage
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imagemUrl),
            ),

            const SizedBox(height: 12.0),

            Text(
              nome,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            Text(
              curso,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Divider(
              height: 24,
              thickness: 1,
            ),

            Row(
              children: [
                const Icon(
                  Icons.badge,
                  color: Colors.green,
                ),
                const SizedBox(width: 10),
                Text(
                  'RA: $ra',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8.0),

            Row(
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    email,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8.0),

            const Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Text(




