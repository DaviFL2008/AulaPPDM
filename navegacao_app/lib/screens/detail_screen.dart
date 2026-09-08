import 'package:flutter/material.dart';
import '../models/produto.dart';

class DetailScreen extends Stateless Widget{
final Produto produto;

const DetailScreen({super.key, required this.produto});

@override
Widget build(BuildContext context){
return Scaffold(
appBar: AppBar(
title: Text(produto.nome),
backgroundColor: Colors.indigo,
foregroundColor: Colors.white,
),
body: Padding(
padding: const EdgelInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
produto.nome,
style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
const SizedBox(height: 10),
Text(
'R\$ ${produto.preco.toStringAsFixed(2)}',
style: const TextStyle(
fontSize: 20,
color: Colors.green,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 20),
Text(
produto.descricao,
style: const TextStyle(fontSize: 16),
),
const Spacer(),
SizedBox(
width: double.infinity,
child: ElevatedButton.icon(
onPressed:(){
Navigator.pop(context, 'Produto confirmado!');
},
icon: const Icon(Icons.check),
label: const Text('Voltar e Confirmar'),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.indigo,
foregroundColor: Colors.white,
padding: const EdgelInsets.symmetric(vertical: 14),
),
),
),
],
),
),
);
}
}

