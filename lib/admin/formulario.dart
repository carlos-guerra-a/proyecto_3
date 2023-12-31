import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:proyecto_3/services/firestore_service.dart';

class AgregarPage extends StatefulWidget {
  const AgregarPage({super.key});

  @override
  State<AgregarPage> createState() => _AgregarPageState();
}

class _AgregarPageState extends State<AgregarPage> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaEvento = DateTime.now(); // Variable para almacenar fecha y hora
  final formatoFecha = DateFormat('dd-MM-yyyy');
  final formatoHora = DateFormat('HH:mm');
  String tipo = '';

  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController lugarCtrl = TextEditingController();
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
              
              controller: nombreCtrl,
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
              controller: descripcionCtrl,
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
              controller: lugarCtrl,
              decoration: InputDecoration(
                label: Text('Lugar del eventos'),
              ),
              validator: (lugar){
                if (lugar!.isEmpty){
                  return 'Es necesario ingresar el lugar del evento';
                }
                return null;
              },
            ),
          //fecha hora
            Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
            children: [
              Text('Fecha y hora del evento: '),
              Text(
                '${formatoFecha.format(fechaEvento)} ${formatoHora.format(fechaEvento)}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Spacer(),
              IconButton(
                icon: Icon(MdiIcons.calendar),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                    locale: Locale('es', 'ES'),
                  ).then((fecha) {
                    if (fecha != null) {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((hora) {
                        if (hora != null) {
                          setState(() {
                            fechaEvento = DateTime(
                              fecha.year,
                              fecha.month,
                              fecha.day,
                              hora.hour,
                              hora.minute,
                            );
                          });
                        }
                      });
                    }
                  });
                },
              ),
            ],
            ),
          ),

          //tipo de evento
              FutureBuilder(
                  future: FirestoreService().tipos(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                      //esperando
                      return Text('Tipo de Eventos');
                    } else {
                      var tipos = snapshot.data!.docs;
                      return DropdownButtonFormField<String>(
                        value: tipo == '' ? tipos[0]['tipo'] : tipo,
                        decoration: InputDecoration(labelText: 'Tipo de Evento'),
                        items: tipos.map<DropdownMenuItem<String>>((tip) {
                          return DropdownMenuItem<String>(
                            child: Text(tip['tipo']),
                            value: tip['tipo'],
                          );
                        }).toList(),
                        onChanged: (tiposSeleccionada) {
                          setState(() {
                            tipo = tiposSeleccionada!;
                          });
                        },
                      );
                    }
                  }),
          ],
        ),

      ),
    );
  }
}