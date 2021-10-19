import 'package:climadata/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController,
      passwordController,
      confirmPasswordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/register_background.jpg'),
              //preenche o espaço todo da tela com a altura da imagem
              fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                controller: emailController,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Digite uma senha válida';
                                  }
                                  return null;
                                },
                                onChanged: (_) {
                                  print(emailController.text);
                                },
                                decoration: funcKInputDecoration(
                                  whichIcon: Icons.email_rounded,
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: passwordController,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      if (value.length < 6) {
                                        return 'Digite no mínimo 6 caracteres';
                                      } else if (value == null ||
                                          value.isEmpty) {
                                        return 'Digite uma senha válida';
                                      }
                                      return null;
                                    },
                                    decoration: funcKInputDecoration(
                                      hintText: 'Senha',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: confirmPasswordController,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    validator: (value) {
                                      if (value != passwordController.text) {
                                        return 'Digite a mesma senha';
                                      } else if (value == null ||
                                          value.isEmpty) {
                                        return 'Digite uma senha válida';
                                      }
                                      return null;
                                    },
                                    decoration: funcKInputDecoration(
                                      hintText: 'Confirmar senha',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                funKConfirmeButton(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          backgroundColor: Colors.white,
                          content: Text('Estamos confirmando os dados'),
                          actions: [
                            TextButton(
                              onPressed: () => closeMaterialBanner(context),
                              child: Text('OK!'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  text: 'Confirmar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void closeMaterialBanner(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
  }
}
