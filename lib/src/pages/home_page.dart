import 'package:flutter/material.dart';
import 'package:beats/src/widgets/cards_view.dart';
import 'package:beats/src/widgets/custom_appbar.dart';
import 'package:beats/src/widgets/fondo_circular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FondoCircular(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar(),
                  _Header(),
                  CardsView()
                ],
              ),
            ),
          ),
          BuyButton(),
        ],
      )
    );
  }
}

class BuyButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            width: size.width * 0.3,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0))
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Buy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
                SizedBox(width: 8.0),
                Icon(FontAwesomeIcons.arrowRight, color: Colors.white, size: 15.0)
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SizedBox(height: 20.0),
          Text('Beats', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
          Text('By Dre', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18.0)),
        ],
      ),
    );
  }
}