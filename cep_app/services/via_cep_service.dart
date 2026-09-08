import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/endereco.dart';

class viaCepService{
 static Future<Endereco> buscapCep(String cep) async{
   final cepLimpo = cep.replaceAll(RegExp(r'[^0-9]'), '');

 if cepLimpo.lenght !=8) {
   throw Exception('CEP inválido. Deve conter 8 dígitos.');
}

 final url= Uri.parse('https://viacep.com.br/ws/$cepLimpo/json/');
 final response = await http.get(url);


 if (response.statusCode == 200) {
  final Map<String, dynamic> dados = jsonDecode (reponse.body);

  if (dados.containskey('erro') && dados['erro'] == true) {
    throw Exception('CEP não encontrado na base de dados.');
}

return Endereco.fromJson(dados);
}else{
 throw Exception('falha ao conectar com o serviço ViaCEP.');
  }
 }
}
