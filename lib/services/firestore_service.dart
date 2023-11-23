import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  //listar eventos
  Stream<QuerySnapshot>eventos(){
    return FirebaseFirestore.instance.collection('eventos').orderBy('fechaHora').snapshots();
  }


  //finalizados

   Stream<QuerySnapshot> eventosFinalizados() {
    DateTime ahora = DateTime.now();
    Timestamp timeStampNow = Timestamp.fromDate(ahora);
    return FirebaseFirestore.instance.collection('eventos').where('fechaHora', isLessThan: timeStampNow).snapshots();
  }

//proximos
   Stream<QuerySnapshot> eventosProximos() {
    DateTime ahora = DateTime.now();
    Timestamp timeStampNow = Timestamp.fromDate(ahora);
    return FirebaseFirestore.instance.collection('eventos').where('fechaHora', isGreaterThanOrEqualTo: timeStampNow).snapshots();
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

  //listar tipo de eventos
  //listar eventos
  Future<QuerySnapshot>tipos(){
    return FirebaseFirestore.instance.collection('tipos').orderBy('tipo').get();
  }




}