import 'package:flutter/material.dart';
import 'package:formify/formify.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:storemint_flutter/utils.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginForm = LoginForm();
  bool isLoading = false;

  Future<void> login()async{
    isLoading = true;
  FocusScope.of(context).unfocus();
    String email = loginForm.getValue('email');
    String password = loginForm.getValue('password');
  
  final body = {
    "email": email,
    "password": password
  };
  const url = 'https://dripventory.storemint.shop/api/auth/login';
  final uri = Uri.parse(url);
  final response = await http.post(uri, body: jsonEncode(body), headers: {'Content-type': 'application/json'});
  if(response.statusCode == 201){
    if(mounted){
      showSnackBar(message: 'Login successful', context: context);
      Navigator.pushNamed(context, '/products');
    isLoading= false;
    }
    return;
  }
  if(mounted){
    showSnackBar(message: 'There was an error ${response.body.toString()}', isError: true, context: context);
    isLoading= false;
  }
    isLoading= false;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome back!')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                ...loginForm.getWidgets().map((widget) => Column(
                  children: [
                    widget,
                    SizedBox(height: 20),
                  ],
                )).toList(),
                SizedBox(height: 20,),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: login, child: isLoading? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white),)): Text('Login')))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends FormifyForms{
@override
List<Attribute> get attributes => [
  FormifyAttribute('email', FormifyType.email),
  FormifyAttribute('password', FormifyType.password),
];

@override
Map<String, List<FormifyRule>> get rules => {
  'email': [FormifyRule.required],
  'password': [FormifyRule.required],
};

@override
InputDecoration? get inputDecoration => InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
focusedBorder: OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.purple),
  borderRadius: BorderRadius.circular(10),
),
contentPadding: const EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 16
)
);

@override
  FormifyFormBuilder? get formBuilder => (
        context,
        Formify formify,
        FormifyTextField child,
      ) {
        if (formify.attribute == 'password') {
          return child.copyWith(
            suffixIcon: IconButton(
              onPressed: formify.toggleObscureText,
              icon: formify.obscureText
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
          );
        }
        return child;
      };

    

}