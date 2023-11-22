import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  //listar eventos
  Stream<QuerySnapshot>eventos(){
    return FirebaseFirestore.instance.collection('eventos').snapshots();
  }

  //agregar evento

   Future<void> AgregarEvento(String nombre,  DateTime fechaHora, String lugar, String descripcion, String tipo, int meGusta,  String imagen) async {
    return FirebaseFirestore.instance.collection('estudiantes').doc().set({
      'nombre': nombre,      
      'fecha_hora': fechaHora,
      'lugar': lugar,
      'descripcion' :descripcion ,
      'tipo' : tipo,
      'meGusta': meGusta,
      'imagen': imagen
    });
  }

  //borrar 
  Future<void> BorrarEvento(String docId) async {
    return FirebaseFirestore.instance.collection('eventos').doc(docId).delete();
  }

  //listar eventos
  Future<DocumentSnapshot> MostrarEvento(String docId) async {
    return FirebaseFirestore.instance.collection('eventos').doc(docId).get() ; 
  }

   

}