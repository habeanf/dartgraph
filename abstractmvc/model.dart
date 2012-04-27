#library ('graphmvc');

interface Vertex {
  int id;
}

interface Edge<T> {
  int id;
  T getVertices();
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