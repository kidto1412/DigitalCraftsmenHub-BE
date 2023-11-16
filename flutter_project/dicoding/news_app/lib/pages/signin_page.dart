import 'package:flutter/material.dart';
import 'package:news_app/model/user.dart';
import 'package:news_app/pages/home_page.dart';
import 'package:news_app/widgets/loadingIndicator.dart';

class SignInPage extends StatefulWidget {
  // const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController companyId = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  String message = '';

  // data login
  final UserModel user =
      UserModel(username: 'dicoding', password: 'dicoding123');
  showSnackBarFun(context, bool isSuccess) {
    Color snackBarColor = isSuccess ? Colors.green : Colors.red;
    String snackBarMessage =
        isSuccess ? 'Login successful!' : 'Login failed. Please try again.';
    SnackBar snackBar = SnackBar(
      content: Text(snackBarMessage, style: TextStyle(fontSize: 20)),
      backgroundColor: snackBarColor,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
            child: Text(
              "Username",
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Username'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
            child: Text(
              "Password",
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Password'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    color: Colors.blue,
                    onPressed: () async {
                      if (username.text == user.username &&
                          password.text == user.password) {
                        const snackBar = SnackBar(
                          content: Text('Yay! A SnackBar!'),
                        );
                        showSnackBarFun(context, true);
                        await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        print('test');
                      } else {
                        showSnackBarFun(context, false);
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ],
      )),
    );
  }
}
