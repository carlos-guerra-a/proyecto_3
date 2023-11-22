import 'package:flutter/material.dart';

class EventoTile extends StatefulWidget {
  final String nombre;
  final String lugar;
  final String descripcion;
  final String imagen;

  EventoTile({this.nombre = '', this.lugar = '', this.descripcion = '', this.imagen = ''});

  @override
  State<EventoTile> createState() => _EventoTileState();
}

class _EventoTileState extends State<EventoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Ajusta esta altura según lo que desees para cada elemento del grid
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          // Foto
          Container(
            height: 140, // Altura de la imagen
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(5),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/images/${(this.widget.imagen)}'),
                  fit: BoxFit.cover, // Ajuste para que la imagen llene el contenedor
                ),
              ),
            ),
          ),

          // Nombre
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  this.widget.nombre,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          // Descripción
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
                Container(
                  child: Text(
                    this.widget.lugar,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
            
              ],
            ),
          ),
        ],
      ),
    );
  }
}