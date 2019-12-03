
class VendedorView {
  final String nombre;
  final String descripcion;
  final String uid;

  VendedorView({ this.nombre, this.descripcion, this.uid});
  
  factory VendedorView.fromMap(Map data){
    return VendedorView(
      nombre: data['nombre']??'',
      descripcion: data['descripcion']??'',
      uid: data['uid']??'',
    );
  }
}