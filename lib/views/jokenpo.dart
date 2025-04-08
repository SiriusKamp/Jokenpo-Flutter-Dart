import 'dart:math';
import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  @override
  State<Jokenpo> createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  int vitorias = 0;
  int derrotas = 0;
  int empates = 0;

  int? escolhaUsuario;
  int? escolhaCpu;
  String resultadoRodada = "";

  //Ao mudar a ordem de vetores será necessario mudar outras funções que dependam disso
  final List<String> opcoes = [
    '../../assets/pedra.png',
    '../../assets/papel.png',
    '../../assets/tesoura.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Linha com as escolhas
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           
            escolhaUsuario != null
                ? Image.asset(opcoes[escolhaUsuario!], height: 150)
                : Container(width: 80, height: 80),

          
            Image.asset('../../assets/vs.png', height: 200),

         
            escolhaCpu != null
                ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi), // espelhar imagem
                  child: Image.asset(opcoes[escolhaCpu!], height: 150),
                )
                : Container(width: 80, height: 80),
          ],
        ),

        const SizedBox(height: 40),

        // Linha dos botões
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildEscolhaButton(0), // pedra
            _buildEscolhaButton(1), // papel
            _buildEscolhaButton(2), // tesoura
          ],
        ),

        const SizedBox(height: 40),

        // Resultado
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      "Resultado:",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      resultadoRodada,
                      style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                    ),
                    Text("Vitórias: $vitorias", style: TextStyle(fontSize: 25)),
                    Text("Derrotas: $derrotas", style: TextStyle(fontSize: 25)),
                    Text("Empates: $empates", style: TextStyle(fontSize: 25)),
                  ],
                ),
              ),
            ),
            // Botão de reiniciar
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton.icon(
                  onPressed: (reset),
                  icon: Icon(Icons.refresh),
                  label: Text("Reiniciar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 41, 146, 0),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric( vertical: 50),
                    textStyle: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //ao clicar
  Widget _buildEscolhaButton(int index) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => jogar(index),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          elevation: 4,
        ),
        child: Image.asset(opcoes[index], height: 100),
      ),
    );
  }

  //função de jogo
  void jogar(int escolha) {
    final cpu = Random().nextInt(3); // 0, 1 ou 2

    setState(() {
      escolhaUsuario = escolha;
      escolhaCpu = cpu;

      // Verificação de vitória
      if (escolha == cpu) {
        empates++;
        resultadoRodada = "Empate!";
      } else if ((escolha == 0 && cpu == 2) ||
          (escolha == 1 && cpu == 0) ||
          (escolha == 2 && cpu == 1)) {
        vitorias++;
        resultadoRodada = "Você Ganhou!";
      } else {
        derrotas++;
        resultadoRodada = "Derrota :(  ";
      }
    });
  }
  void reset (){
            setState(() {
                      vitorias = 0;
                      derrotas = 0;
                      empates = 0;
                      resultadoRodada = "";
                      escolhaUsuario = null;
                      escolhaCpu = null;
                    });
  }
}
