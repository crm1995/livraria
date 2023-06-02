import 'package:flutter/material.dart';
//import 'package:livraria/core/processaDados.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Campos Login
  late final TextEditingController _emailController;
  late final TextEditingController _senhaController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _testarCampos() {
    debugPrint('Email: ${_emailController.text}');
    debugPrint('Senha: ${_senhaController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(212, 242, 246, 1),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.75),

                //Logo
                const Image(
                  width: 150,
                  image: AssetImage('assets/images/login.png'),
                ),

                const SizedBox(height: 30), //Espaçamento

                //Campo Email
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    label: Text(
                      'Email',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),

                    //Borda antes de clicar
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),

                    //Borda depois de clicar
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.lightBlue,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),

                    //Ícone antes do texto
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                ),

                const SizedBox(height: 16), //Espaçamento

                //Campo Senha
                TextField(
                  controller: _senhaController,
                  obscureText: true, //Oculta a senha
                  decoration: const InputDecoration(
                    label: Text(
                      'Senha',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),

                    //Borda antes de clicar
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),

                    //Borda depois de clicar
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.lightBlue,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),

                    //Ícone antes do texto
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                  ),
                ),

                //Link para Esquecer Senha
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/esqueceu_senha');
                      },
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30), //Espaçamento

                //Botão Entrar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.40, 45)),
                  onPressed: () {
                    //var email = _emailController.text;
                    //var senha = _senhaController.text;
                    //processaDadosLogin(email, senha);
                    //Rota para onde vai
                    Navigator.pushNamed(
                      context,
                      '/biblioteca',
                      arguments: {
                        'email': _emailController.text,
                        'senha': _senhaController.text
                      },
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8), //Espaçamento

                //Link para Cadastro
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  child: const Text(
                    'Não tem cadastro? Clique aqui',
                    style: TextStyle(fontSize: 16),
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