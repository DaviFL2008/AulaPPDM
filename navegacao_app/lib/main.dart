
import 'package:flutter/material.dart';

// ==========================================
// MODELO DE DADOS
// ==========================================
class Produto {
  final String nome;
  final String descricao;
  final double preco;

  Produto({
    required this.nome,
    required this.descricao,
    required this.preco,
  });
}

// ==========================================
// CONFIGURAÇÃO DE ROTAS (EXERCÍCIO 03)
// ==========================================
void main() {
  runApp(const NavegacaoApp());
}

class NavegacaoApp extends StatelessWidget {
  const NavegacaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Navegação',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      // Exercício 03: Definição de rotas nomeadas
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detalhes': (context) => const DetailScreen(),
        '/add-product': (context) => const AddProductScreen(),
      },
    );
  }
}

// ==========================================
// TELA PRINCIPAL (HomeScreen)
// ==========================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Produto> _produtos = [
    Produto(
      nome: 'Notebook Pro',
      descricao: 'Processador de última geração, 16GB RAM, SSD 512GB.',
      preco: 4500.00,
    ),
    Produto(
      nome: 'Smartphone X',
      descricao: 'Tela AMOLED 120Hz, Câmera Tripla de 50MP.',
      preco: 2800.00,
    ),
    Produto(
      nome: 'Fone Bluetooth',
      descricao: 'Cancelamento ativo de ruído e bateria de até 30h.',
      preco: 350.00,
    ),
  ];

  // Exercício 03: Navegação via pushNamed passando argumentos
  Future<void> _abrirDetalhes(BuildContext context, Produto produto) async {
    final resultado = await Navigator.pushNamed(
      context,
      '/detalhes',
      arguments: produto,
    );

    if (resultado != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Retorno da tela: $resultado'),
          backgroundColor: Colors.indigo,
        ),
      );
    }
  }

  // Exercício 01: Navegação para cadastro e atualização da lista ao retornar
  Future<void> _abrirCadastroProduto(BuildContext context) async {
    final novoProduto = await Navigator.pushNamed(context, '/add-product');

    if (novoProduto != null && novoProduto is Produto) {
      setState(() {
        _produtos.add(novoProduto);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Produto "${novoProduto.nome}" cadastrado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _produtos.length,
        itemBuilder: (ctx, index) {
          final prod = _produtos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Icon(Icons.shopping_bag, color: Colors.white),
              ),
              title: Text(prod.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('R\$ ${prod.preco.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _abrirDetalhes(context, prod),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirCadastroProduto(context),
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// ==========================================
// TELA DE DETALHES (DetailScreen)
// ==========================================
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recebe o objeto enviado via ModalRoute
    final produto = ModalRoute.of(context)!.settings.arguments as Produto;

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              produto.nome,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'R\$ ${produto.preco.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.indigo, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Text(
              produto.descricao,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, 'Produto Visualizado'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Voltar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// TELA DE CADASTRO (EXERCÍCIO 01 & 02)
// ==========================================
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  // Exercício 02: Exibir caixa de diálogo confirmando saída
  Future<bool> _confirmarSaida() async {
    final deveSair = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Descartar alterações?'),
        content: const Text('Você tem certeza que deseja voltar? O produto informado não será salvo.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Continuar editando'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Sim, sair'),
          ),
        ],
      ),
    );
    return deveSair ?? false;
  }

  // Exercício 01: Retornar o novo produto
  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      final novoProduto = Produto(
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        preco: double.parse(_precoController.text.replaceAll(',', '.')),
      );

      Navigator.pop(context, novoProduto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final confirmou = await _confirmarSaida();
        if (confirmou && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar Produto'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome do Produto',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, informe o nome do produto.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, informe a descrição.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _precoController,
                  decoration: const InputDecoration(
                    labelText: 'Preço (R\$)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, informe o preço.';
                    }
                    final precoFormatado = value.replaceAll(',', '.');
                    if (double.tryParse(precoFormatado) == null) {
                      return 'Informe um preço válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _salvarFormulario,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar Produto'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
