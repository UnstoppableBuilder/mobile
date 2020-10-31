import 'package:flutter/material.dart';

class SosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 400,
        height: 70,
        child: FloatingActionButton.extended(
          backgroundColor: Color.fromRGBO(129, 129, 129, 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(25)),
          onPressed: () {},
          label: Text('Закончил смену',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(255, 90, 114, 1),
            child: Text('Sos',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
