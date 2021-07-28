import 'package:flutter/material.dart';
import 'second_page.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  bool isHiddenPassword = true;
  bool isHiddenConfirmPassword = true;
  String name;
  String email;
  String password;
  String confirmPassword;
  String address;
  String phoneNumber;
  String age;

  FormScreenState({
    this.name,
    this.email,
    this.password,
    this.address,
    this.phoneNumber,
    this.age,
    this.confirmPassword,
  });
  var _nameControler = new TextEditingController();
  var _emailControler = new TextEditingController();
  var _passwordControler = new TextEditingController();
  var _confirPasswordControler = new TextEditingController();
  var _addressControler = new TextEditingController();
  var _phoneNumberControler = new TextEditingController();
  var _ageControler = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.person),
      ),
      controller: _nameControler,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        } else if (value.length < 3) {
          return 'Name must in 3 charcters';
        }
        return null;
      },
      onSaved: (String value) {
        name = value;
      },
      onChanged: (String value) {
        name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.email),
      ),
      controller: _emailControler,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.lock),

        //suffixIcon: InkWell(
        //onTap: _togglePasswordView,
        //child: Icon(
        //Icons.visibility,
        suffixIcon: IconButton(
          icon:
              Icon(isHiddenPassword ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            isHiddenPassword = !isHiddenPassword;
            setState(() {});
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      controller: _passwordControler,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }
        if (!RegExp(
                r"(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
            .hasMatch(value)) {
          return '*Uppercase,lowercase,Numeric Number,Special Character=8';
        }

        return null;
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget _buildconfirmPassword() {
    return TextFormField(
      obscureText: isHiddenConfirmPassword,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.lock),
        //suffixIcon: InkWell(
        //onTap: _togglePasswordView,
        //child: Icon(
        //Icons.visibility,
        suffixIcon: IconButton(
          icon: Icon(isHiddenConfirmPassword
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: () {
            isHiddenConfirmPassword = !isHiddenConfirmPassword;
            setState(() {});
          },
        ),
      ),
      keyboardType: TextInputType.text,
      controller: _confirPasswordControler,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Confirm Password is required ';
        } else if (value != _passwordControler.value.text) {
          return 'Password do not match';
        }
        return null;
      },
      onSaved: (String value) {
        confirmPassword = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.security),
      ),
      controller: _addressControler,
      validator: (String value) {
        if (value.isEmpty) {
          return 'ADDRESS is Required';
        }

        return null;
      },
      onSaved: (String value) {
        address = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23.5),
        ),
        prefixIcon: Icon(Icons.phone_android),
      ),
      controller: _phoneNumberControler,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        } else if (value.length < 10) {
          return 'Enter your correct 10digit number';
        }
        //if (!RegExp(r".{10,}").hasMatch(value)) {
        //  return 'Enter your correct 10digit number';
        //}

        return null;
      },
      onSaved: (String value) {
        phoneNumber = value;
      },
    );
  }

  Widget _buildage() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Age',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(Icons.calendar_today_outlined),
      ),
      controller: _ageControler,
      keyboardType: TextInputType.number,
      validator: (String value) {
        int age = int.tryParse(value);

        if (age == null || age <= 0) {
          return 'Age must be greater than 0';
        } else if (value.length > 2) {
          return 'Enter your correct age';
        }

        return null;
      },
      onSaved: (String value) {
        age = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BIO-DATA REGISTRATION_FORM")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: NetworkImage(
                        'https://www.nhm.uio.no/english/research/projects/biodata/images/biodata-500.png')),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 10),
                  child: _buildName(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildEmail(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildPassword(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildconfirmPassword(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildAddress(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildPhoneNumber(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildage(),
                ),
                SizedBox(width: 200, height: 20),
                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }

                      _formKey.currentState.save();

                      print(name);
                      print(email);
                      print(phoneNumber);
                      print(address);
                      print(password);
                      print(age);

                      var route = new MaterialPageRoute(
                          builder: (context) => new SecondPage(
                                  value: FormScreenState(
                                name: _nameControler.text,
                                email: _emailControler.text,
                                phoneNumber: _phoneNumberControler.text,
                                address: _addressControler.text,
                                password: _passwordControler.text,
                                confirmPassword: _confirPasswordControler.text,
                                age: _ageControler.text,
                              )));
                      Navigator.of(context).push(route);

                      //Send to API
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //void _togglePasswordView() {
  //if (isHiddenPassword == true) {
  //isHiddenPassword = false;
  //} else {
  //isHiddenPassword = true;
  //}
  //setState(() {
  //isHiddenPassword = !isHiddenPassword;
  //});
  //}
}
