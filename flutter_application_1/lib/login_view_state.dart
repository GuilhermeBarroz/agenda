import 'package:flutter/material.dart';

import 'login.view.dart';

class LoginViewState extends State<LoginView> {
  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    void _mostrarBottomSheetCastro(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(
                      image: AssetImage('assets/cadastro.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Center(
                    child: Text(
                  'Cadastre-se',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontFamily: 'Comfortaa'),
                )),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff2E4599),
                        ),
                      )),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xff2E4599)),
                      )),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Matrícula',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xff2E4599)),
                      )),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xff2E4599)),
                      )),
                ),
                const SizedBox(height: 16.0),
                Center(
                    child: SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2E4599),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // Lógica para realizar o cadastro
                            Navigator.pop(context);
                          },
                          child: const Text('Cadastre-se'),
                        ))),
              ],
            ),
          ));
        },
      );
    }

    void _mostrarBottomSheetRecuperarSenha(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Image(
                      image: AssetImage('assets/recuperarsenha.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'ESQUECEU A SUA SENHA?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                      color: Color(0xff2E4599),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração da sua senha.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 16,
                    color: Color(0xff2E4599),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xff2E4599)),
                    ),
                  ),
                ),
                // Lógica para recuperar o e-mail digitado
                const SizedBox(height: 16.0),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2E4599),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Lógica para enviar a solicitação de recuperação de senha
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Recuperar',
                        style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffededed),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFededed),
            ),
          ),
          Container(
            height: 555,
            decoration: const BoxDecoration(
              color: Color(0xff2E4599),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Positioned(
            width: 300,
            height: 300,
            top: 90,
            left: 40,
            child: Image.asset("assets/logoNassau.png"),
          ),
          const Positioned(
            top: 320,
            left: 80,
            child: Column(
              children: [
                Text(
                  'Acesse sua conta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFededed),
                    fontSize: 25,
                    fontFamily: 'Comfortaa',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 375,
            left: 36,
            child: SizedBox(
              width: 320,
              height: 45,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Matrícula',
                  filled: true,
                  fillColor: const Color(0xFFededed),
                  hintStyle: const TextStyle(
                    color: Color(0xff2E4599),
                    fontFamily: 'Comfortaa',
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe sua matrícula';
                  }
                  return null;
                },
              ),
            ),
          ),
          Positioned(
            top: 440,
            left: 36,
            child: SizedBox(
              width: 320,
              height: 45,
              child: TextFormField(
                obscureText: isPasswordObscured,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Senha',
                  filled: true,
                  fillColor: const Color(0xFFededed),
                  hintStyle: const TextStyle(
                    color: Color(0xff2E4599),
                    fontFamily: 'Comfortaa',
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isPasswordObscured = !isPasswordObscured;
                      });
                    },
                    icon: Icon(
                      isPasswordObscured
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff2E4599),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 505,
            left: 165,
            child: InkWell(
              onTap: () {
                _mostrarBottomSheetRecuperarSenha(context);
              },
              child: const Text(
                'Recupere a sua senha',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  color: Color(0xFFededed),
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 36,
            right: 36,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.login),
                label: const Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E4599),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 695,
            left: 85,
            child: Text(
              'Ainda não tem uma conta?',
              style: TextStyle(
                fontFamily: 'Comfortaa',
                color: Color(0xff2E4599),
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            top: 725,
            left: 150,
            child: InkWell(
              onTap: () {
                _mostrarBottomSheetCastro(context);
              },
              child: const Text(
                'Cadastre-se',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  color: Color(0xff2E4599),
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
