import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_3/public/detalle_public.dart';
import 'package:proyecto_3/services/firestore_service.dart';
import 'package:proyecto_3/widgets/evento_widget.dart';

class EventosProxPage extends StatefulWidget {
  const EventosProxPage({super.key});

  @override
  State<EventosProxPage> createState() => _EventosFuturosPageState();
}

class _EventosFuturosPageState extends State<EventosProxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Eventos', style: TextStyle(color: Colors.white),),
        leading: Icon(EvaIcons.music, color: Colors.white,),

      ),

    body: Padding(padding: EdgeInsets.all(1),
    child: Column(
      children: [
        Expanded(child: 

          StreamBuilder(
            stream: FirestoreService().eventosProximos(), 
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {

                return Center( child: CircularProgressIndicator(),);

              } else {

                return GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index){
                    var evento = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        MaterialPageRoute route = MaterialPageRoute(builder: (context) => DetallePublicPage(eventoId: evento.id));
                        Navigator.push(context, route);
                        print(evento['nombre'],);
                      },
                      child: EventoTile(
                          nombre: evento['nombre'],
                          lugar: evento['lugar'],
                          imagen: evento['imagen'],
                          
                      ),
                    );

                    
                  
                
                  });
                
                
                
              
                


              }



            })

        
        )


      ],
    ),),
    );
  }
}