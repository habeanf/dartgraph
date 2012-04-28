#library ('ThreeD');
#import ('../abstractmvc/model.dart');
#import ('../simple/SimpleModel.dart');

class Vertex3D extends Vertex2D {
  double z;
  Vertex3D(id,List<double> coordinates) : super(id,coordinates) {
    z = coordinates[2];
  }
  
  String toString() {
    return '[${x},${y},${z}]';
  }
  
  num getZ() {return z;}
}