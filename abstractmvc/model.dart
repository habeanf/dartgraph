#library ('graphmvc');

interface Vertex {
  int id;
  String toString();
}

interface Edge<T> {
  int id;
  T getVertices();
  String toString();
}

interface Drawable2D extends Vertex {
  num getX();
  num getY();
}

interface Drawable3D extends Drawable2D {
  num getZ();
}

interface Colorable {
  String getColor();
}

interface Graph<V,E> {
  V getVertex(int vertexId);
  createVertex(V v);
  updateVertex(V v);
  deleteVertex(V v);
  
  Edge getEdge(int edgeId);
  createEdge(E e);
  updateEdge(E e);
  deleteEdge(E e);
  
  Collection<V> getAllVertices();
  Collection<E> getAllEdges();
}

interface DirectedEdge extends Edge<List> {
  int id;
  List getVertices();
}

interface UndirectedEdge extends Edge<Set> {
  int id;
  Set getVertices();
}

class UnknownEdgeTypeException implements Exception {}