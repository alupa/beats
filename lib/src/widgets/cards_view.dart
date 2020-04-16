import 'package:beats/src/models/producto_model.dart';
import 'package:beats/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // return Placeholder(
    //   fallbackWidth: double.infinity,
    //   fallbackHeight: 300,
    // );

    final productos = Provider.of<ProductosProvider>(context).productos;

    return Container(
      width: double.infinity,
      height: 340.0,
      child: PageView(
        controller: PageController(viewportFraction: 0.85),
        children: productos.map((prod) => _Card(prod)).toList()
      ),
    );
  }
}

class _Card extends StatelessWidget {
  
  final ProductoModel prod;
  _Card(this.prod);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _PrimeraDescripcion(prod),
              SizedBox(width: size.width * 0.15),
              _TarjetaDescripcion(prod)
            ],
          ),
          Positioned(
            top: 40,
            left: 50,
            child: Image(
              image: AssetImage('assets/${prod.url}'),
              width: 140.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimeraDescripcion extends StatelessWidget {
  
  final ProductoModel prod;
  _PrimeraDescripcion(this.prod);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.batteryFull, size: 15.0),
            SizedBox(width: 10.0),
            Text('${prod.bateria}-Hour Battery', style: TextStyle(fontSize: 12.0)),
            SizedBox(width: 30.0),
            Icon(FontAwesomeIcons.wifi, size: 15.0),
            SizedBox(width: 10.0),
            Text('Wireless', style: TextStyle(fontSize: 12.0)),
          ],
        ),
      ),
    );
  }
}

class _TarjetaDescripcion extends StatelessWidget {
  
  final ProductoModel prod;

  _TarjetaDescripcion(this.prod);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: size.width * 0.55,
          height: 300.0,
          color: Color(prod.color),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(prod.titulo, style: TextStyle(color: Colors.white24, fontSize: 30.0, fontWeight: FontWeight.bold)),
                    Text(prod.subtitulo, style: TextStyle(color: Colors.white24, fontSize: 30.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(prod.nombre, style: TextStyle(color: Colors.white, fontSize: 12.0)),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white, size: 20.0)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 80.0,
                    child: Text('\$${prod.precio}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: 85.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                    ),
                    child: Center(
                      child: Text('Add to bag', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}