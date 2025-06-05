// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:logger/logger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _precoBRLCompra = "0";
  String _precoBRLVenda = "0";
  String _precoUSDCompra = "0";
  String _precoUSDVenda = "0";
  String _precoEURCompra = "0";
  String _precoEURVenda = "0";
  final Logger logger = Logger(); // Instância do Logger

  // Função para recuperar os preços do Bitcoin
  Future<void> _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decodificar o JSON
        Map<String, dynamic> retorno = json.decode(response.body);
        setState(() {
          _precoBRLCompra = retorno['BRL']['buy'].toString();
          _precoBRLVenda = retorno['BRL']['sell'].toString();
          _precoUSDCompra = retorno['USD']['buy'].toString();
          _precoUSDVenda = retorno['USD']['sell'].toString();
          _precoEURCompra = retorno['EUR']['buy'].toString();
          _precoEURVenda = retorno['EUR']['sell'].toString();

        });
        logger.i("Preço atualizado: BRL Compra=$_precoBRLCompra, BRL Venda=$_precoBRLVenda, USD Compra=$_precoUSDCompra, USD Venda=$_precoUSDVenda, EUR Compra=$_precoEURCompra, EUR Venda=$_precoEURVenda");
      } else {
        logger.w("Erro ao carregar dados. Status: ${response.statusCode}");
      }
    } catch (e) {
      logger.e("Erro na requisição: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // Centralizando todo o conteúdo na tela
        child: SingleChildScrollView( // Permite rolar caso o conteúdo seja maior que a tela
          child: Padding(
            padding: const EdgeInsets.all(32.0), // Espaçamento ao redor do conteúdo
            child: Column( // Colocando os itens na coluna
              mainAxisAlignment: MainAxisAlignment.center, // Centralizando verticalmente
              crossAxisAlignment: CrossAxisAlignment.center, // Centralizando horizontalmente
              children: <Widget>[
                // Imagem principal do Bitcoin
                Image.asset("assets/bitcoin.png", width: 350, height: 350), // Imagem do Bitcoin
                

                // Container para o preço em BRL
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Imagem das moedas à esquerda (reduzida pela metade)
                      Image.asset("assets/brazilian-real.png", width: 50, height: 50), 
                      const SizedBox(width: 10), // Espaço entre a imagem e o texto
                      Expanded( // Expande o texto para ocupar o restante do espaço
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
                          children: [
                            Text(
                              "BRL Compra: R\$ $_precoBRLCompra", // Preço de compra em BRL
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "BRL Venda: R\$ $_precoBRLVenda", // Preço de venda em BRL
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Container para o preço em USD
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Imagem das moedas à esquerda (reduzida pela metade)
                      Image.asset("assets/dollar.png", width: 50, height: 50), 
                      const SizedBox(width: 10), // Espaço entre a imagem e o texto
                      Expanded( // Expande o texto para ocupar o restante do espaço
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
                          children: [
                            Text(
                              "USD Compra: US\$ $_precoUSDCompra", // Preço de compra em USD
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "USD Venda: US\$ $_precoUSDVenda", // Preço de venda em USD
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Container para o preço em EUR
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Imagem das moedas à esquerda (reduzida pela metade)
                      Image.asset("assets/euro.png", width: 50, height: 50), 
                      const SizedBox(width: 10), // Espaço entre a imagem e o texto
                      Expanded( // Expande o texto para ocupar o restante do espaço
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
                          children: [
                            Text(
                              "EUR Compra: € $_precoEURCompra", // Preço de compra em EUR
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "EUR Venda: € $_precoEURVenda", // Preço de venda em EUR
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: _recuperarPreco, // Função de atualizar os preços
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 34), // Cor do fundo do botão
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15), // Estilizando o botão
                  ),
                  child: const Text(
                    "Atualizar", // Texto do botão
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
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
