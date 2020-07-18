import 'package:fethi_covide_19/services/AuthService.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Register COVID-19 Tracker'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/st1.png'),
              SizedBox(
                height: 50.50,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'email',
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                //verification d'email qu'elle ne soit pas vide
                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
              ),
              SizedBox(
                height: 20,
              ),
              //state données de mes composants
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Colors.white,
                    filled: true),
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                validator: (val) =>
                    val.length < 6 ? 'Enter a valid password 6+ Chars' : null,
                //password invisible
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () async {
                  // si mon formulaire valide ook
                  if (_formKey.currentState.validate()) {
                    print('Ok!!!!!!');
                    print(email);
                    print(password);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please enter a valid email';
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}