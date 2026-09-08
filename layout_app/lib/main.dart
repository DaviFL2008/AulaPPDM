import 'package:flutter/material.dart';

void main() {
  runApp(const MeuLayoutApp());
}

class MeuLayoutApp extends StatelessWidget {
  const MeuLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPDM - Layout Widgets',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor:
     Colors.teal),  
      useMaterial3: true,
      ),
      home: const TelaDashboard().
      );
      }
     }
   
     class telaDashboard extends StatelessWidget {
    const TelaDashboard({super.key});

    @override
    Widget buildBuildContext context) {
      return Scaffold(
      appBar: AppBar(
      title: const Text('PPDM - Dashboard de Observacoes'),
      centerTitle: true,
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text(
      ' Resumo das Observacoes',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
       const SizedBox(height: 16.0),

    // Linha 1: Cards Lado a Lado usando Expanded
      Row(
       children: [
       Expanded: (
       child: Container(
       padding: const EdgeInsets.all(16.0),
       decoration: BoxDecoration(
       color: Colors.teal.shade100,
       borderRadius: BorderRadius.circular(12),
       ),
       child: Column(
       children: const [
       Icons(Icons.flutter_dash, size: 36, color: Colors.teal),
       SizedBox(height: 8),
       Text('124', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
       Text('Aves Vistas', style: TextStyle(fontSize: 12,
        color: Colors.grey)),
       ],
       ),
       ),
       ),
       const SizedBox(width: 12.0),
       Expanded(
       child: Container(
       padding: const EdgeInsets.all(16.0),
       decoration: BoxDecoration(
       color: Colors.teal.shade50,
       borderRadius: BorderRadius.circular(12),
       ),
       child: Column(
       children: const [
       Icons(Icons.place, size: 36, color: Colors.teal),
       SizedBox(height: 8),
       Text('181, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
       Text('Locais Visitados', style: TextStyle(fontSize: 12, color: Colors.grey)),
       ],
       ),
       ),
       ),
       ],
       ),
       const SizedBox(height: 24.0),

       const Text(
       ' Destaque da Semana',
       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
       ),
       const SizedBox(height: 16.0),

       //SOBREPOSICAO usando Stack (Selo de Notificacao sobre o Card)
       Stack(
       clipBehavior: Clip.none,
       children: [
       Container (
       width: double.infinity,
       padding: const EdgeInsets.all(20.0),
       decoration: BoxDecoration(
       color: Colors.grey.shade100,
       borderRadius: BorderRadius.circular(12),
       border: Border.all(color: Colors.grey.shade300),
       ),
       child: Row(
       children: [
       const Icon(Icons.star, size:48, color: Colors.amber),
       const SizedBox(width: 16),
       Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: const [
       Text ('Gaviao-Real', style: TextStyle(fontSize: 18,
       fontWeight: FontWeight.bold)),
        Text(' Avistado no Parque Central', style:
       TextStyle(color: Colors.grey)),
        ],
            ),
        ],
        ),
        ),
        Positioned(
        top: -8,
        right: -8,
        child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8,
        vertical: 4),
         decoration: BoxDecoration(
         color: Colors.red,
         borderRadius: BorderRadius.circular(12),
         ),
         child: const Text(
         'Raro',
         style: TextStyle(color: Colors.white, fontSize: 10,
         fontWeight: FontWeight.bold),
          ),
          ),
          ),
          ],
          ),
          ],
          ),
          ),
          );
          }
         }
