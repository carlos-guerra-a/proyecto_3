import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_3/services/firestore_service.dart';

class AgregarPage extends StatelessWidget {
  const AgregarPage({super.key});


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Agregar evento', style: TextStyle(color: Colors.black)),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            //nombre evento
            TextFormField(
              //controller: nombreCtrl,
              decoration: InputDecoration(
                label: Text('Nombre'),
              ),
              validator: (nombre){
                if (nombre!.isEmpty){
                  return 'Es necesario ingresar el nombre';
                }
                return null;
              },
            ),
            //descripción evento
            TextFormField(
              //controller: descripcionCtrl,
              decoration: InputDecoration(
                label: Text('Descripción'),
              ),
              validator: (descripcion){
                if (descripcion!.isEmpty){
                  return 'Es necesario ingresar una descripción del evento';
                }
                return null;
              },
            ),
            //lugar
            TextFormField(
              //controller: lugarCtrl,
              decoration: InputDecoration(
                label: Text('Lugar del evento'),
              ),
              validator: (lugar){
                if (lugar!.isEmpty){
                  return 'Es necesario ingresar el lugar del evento';
                }
                return null;
              },
            ),
            // FutureBuilder(
            //   future: FirestoreService().tipoEvento(),
            //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            //     if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
            //       return Text('Cargando tipo de eventos...');
            //     }
            //     else {
            //       var tipoEvento = snapshot.data!.docs;
            //       return DropdownButtonFormField(items: , onChanged: onChanged,)
            //     }
            //   } )
          ],
        ),

      ),
    );
  }
}