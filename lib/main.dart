import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';


void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff06a5ff),
            elevation: 0,
            title: Text("SVAR - Hospedagem"),
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                );
              },
            ),

            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
          ),
          drawer: AppDrawer(),
          body: Container(
            color: Color(0xffc4d1ed),
            child: Column(
              children: [
                /* Container(
                  height: 30,
                  color: Color(0xff0877d2),

                ),*/
                Container(
                  color: Colors.transparent, // Cor de fundo do container
                  padding: EdgeInsets.all(5),
                  alignment:
                      Alignment.center, // Ajuste para posicionar no início
                  child: Text(
                    "DESTINOS",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 2,
                  color: Colors.white,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 640,
                          enableInfiniteScroll: false,
                          autoPlay: false,
                        ),
                        items: [
                          Destino("Angra dos Reis", "images/angra1.jpg", "images/angra2.jpg", "images/angra3.jpg", 300, 50),
                          Destino("Arraial do Cabo", "images/arraial1.jpg", "images/arraial2.jpg", "images/arraial3.jpg", 320, 60),
                          Destino("Chile", "images/chile1.jpg", "images/chile2.jpg", "images/chile3.jpg", 350, 65),
                          Destino("Florianópolis", "images/flo1.jpg", "images/flo2.png", "images/flo3.jpg", 320, 55),
                          Destino("Jericoacoara", "images/jeri1.jpg", "images/jeri2.png", "images/jeri3.jpg", 330, 58),
                          Destino("Las Vegas", "images/la1.jpeg", "images/la2.jpg", "images/la3.jpeg", 400, 75),
                          Destino("Madri", "images/madri1.jpg", "images/madri2.jpg", "images/madri3.jpg", 360, 68),
                          Destino("Orlando", "images/orla1.jpg", "images/orla2.jpg", "images/orla3.jpg", 310, 52),
                          Destino("Paris", "images/paris1.jpg", "images/paris2.jpg", "images/paris3.jpg", 380, 72),
                          Destino("Roma", "images/roma1.jpg", "images/roma2.jpg", "images/roma3.jpg", 340, 62),
                          // Adicione mais destinos conforme necessário
                        ].map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return item;
                            },
                          );
                        }).toList(),
                      ),

                      /*Destino("Angra dos Reis", "images/angra.jpg",
                          "images/angra.jpg", "images/angra.jpg", 384, 70),
                      Destino("Jericoacoara", "images/angra.jpg",
                          "images/angra.jpg", "images/angra.jpg", 571, 75),
                       Destino("Arraial do Cabo", "images/arraiadoCabo.jpg", 534, 65),
                        Destino("Florianópolis", "images/florianopolis.jpg", 348, 85),
                        Destino("Madri", "images/madri.jpg", 401, 85),
                        Destino("Paris", "images/paris.jpg", 546, 95),
                        Destino("Orlando", "images/orlando.jpg", 616, 105),
                        Destino("Las Vegas", "images/lasvegas.jpg", 504, 110),
                        Destino("Roma", "images/roma.jpg", 478, 85),
                        Destino("Chile", "images/chile.jpg", 446, 95),
                        */
                    ],
                  ),
                ),
              ],
            ),
          )
          
        ),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome;
  final String img1;
  final String img2;
  final String img3;
  final int dias;
  final int valorp;

  Destino(this.nome, this.img1, this.img2, this.img3, this.dias, this.valorp,
      {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  String? mensagem;
  int contadorDias = 0;
  int contadorPessoas = 0;

  int valor_total = 0;

  void _incDias() {
    setState(() {
      contadorDias++;
    });
  }

  void _incPessoas() {
    setState(() {
      contadorPessoas++;
    });
  }

  void _remDias() {
    setState(() {
      contadorDias--;
    });
  }

  void _remPessoas() {
    setState(() {
      contadorPessoas--;
    });
  }

  void _limpar() {
    setState(() {
      contadorPessoas = 0;
      contadorDias = 0;
      valor_total = 0;
    });
  }

  void _calc() {
    setState(() {
      valor_total =
          (contadorDias * widget.dias) + (contadorPessoas * widget.valorp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color(0xffc4d1ed),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 8, 15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white, // Cor da borda
                    width: 2.0, // Largura da borda
                  ),
                  color: Color(0xff6eb5de), // Cor transparente
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: 395,
                height: 600,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          "${widget.nome}",
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "R\$ ${widget.dias}/dia - R\$ ${widget.valorp}/pessoa",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 320,
                        height: 230,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 230,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                          ),
                          items: [
                            widget.img1,
                            widget.img2,
                            widget.img3,
                            // Adicione mais imagens conforme necessário
                          ].map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Container(
                              width: 140,
                              height: 30,
                              child: Text(
                                "Dias: $contadorDias",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                //textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: ElevatedButton(
                              onPressed: _remDias,
                              child: Icon(Icons.remove, color: Colors.blue),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape:
                                    CircleBorder(), // Troque para a cor desejada
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: ElevatedButton(
                              onPressed: _incDias,
                              child: Icon(Icons.add, color: Colors.blue),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape:
                                    CircleBorder(), // Troque para a cor desejada
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Container(
                              width: 140,
                              height: 30,
                              child: Text(
                                "Pessoas: $contadorPessoas",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _remPessoas,
                            child: Icon(Icons.remove, color: Colors.blue),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape:
                                  CircleBorder(), // Troque para a cor desejada
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _incPessoas,
                            child: Icon(Icons.add, color: Colors.blue),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape:
                                  CircleBorder(), // Troque para a cor desejada
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Container(
                          width: 395,
                          height: 2,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 35,
                              child: Text(
                                "TOTAL ",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                child: Text(
                                  "R\$ $valor_total",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff6fff74),
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _limpar,
                              child: Text(
                                "Limpar",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // Cor de fundo do botão
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _calc,
                              child: Text(
                                "Calcular",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // Cor de fundo do botão
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff06a5ff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/isa.jpg'),
                ),
                SizedBox(height: 55),
                  Text("Isabela Rocha", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 520, 0, 0),
            child: ListTile(
              title: Text("Sair"),
              onTap: () {
                Navigator.pop(context); 
                exit(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
