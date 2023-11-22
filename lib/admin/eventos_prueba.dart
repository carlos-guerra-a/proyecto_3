import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_3/services/firestore_service.dart';
import 'package:proyecto_3/widgets/evento_widget.dart';

class PruebaEventos extends StatefulWidget {
  const PruebaEventos({super.key});

  @override
  State<PruebaEventos> createState() => _PruebaEventosState();
}

class _PruebaEventosState extends State<PruebaEventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Eventos',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          EvaIcons.music,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(1),
        child: StreamBuilder(
          stream: FirestoreService().eventos(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListWheelScrollView(
                diameterRatio: 2, // Ajusta según tu preferencia
                useMagnifier: true, // Para usar una lupa al seleccionar
                magnification: 1.0, // Factor de aumento de la lupa
                itemExtent: 200, // Altura de cada elemento
                children: [
                  for (var evento in snapshot.data!.docs)
                    EventoTile(
                      nombre: evento['nombre'],
                      lugar: evento['lugar'],
                      imagen: evento['imagen'],
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}