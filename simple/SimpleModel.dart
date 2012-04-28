#library ('SimpleMVC');
#import ('../abstractmvc/model.dart');

class Vertex2D implements Drawable2D,Colorable {
  int id;
  double x,y;
  
  Vertex2D(id,List<double> coordinates) :
    id = id,
    x = coordinates[0],
    y = coordinates[1];
  
  String toString() {
    return '[${x},${y}]';
  }
  
  String getColor() {
    return '#ff00ff';
  }
  
  num getX() {return x;}
  num getY() {return y;}
}

class SimpleEdge implements DirectedEdge {
  int id;
  int fromVertex,toVertex;
  
  SimpleEdge(this.id,this.fromVertex,this.toVertex);
  
  List getVertices() {
    return [fromVertex,toVertex];
  }
  
  String toString() {
    return '[${fromVertex},${toVertex}]';
  }
}

class SimpleGraph implements Graph<Vertex2D,SimpleEdge> {
  Map _vertices;
  Map _edges;
  int maxVertexId,maxEdgeId;
  
  SimpleGraph(Collection<Vertex2D> vertices, Collection<SimpleEdge> edges) {
    _vertices = new Map();
    _edges = new Map();
    maxVertexId = -1;
    maxEdgeId = -1;
    for (final v in vertices) {
      _vertices[v.id]=v;
      maxVertexId = Math.max(maxVertexId,v.id);
    };
    for (final e in edges) {
      _edges[e.id]=e;
      maxEdgeId = Math.max(maxEdgeId,e.id);
    };
   }
  
  Vertex2D getVertex(int vertexId) {
    return _vertices[vertexId];
  }

  Vertex2D createVertex(Vertex2D v) {
    maxVertexId++;
    v.id = maxVertexId;
    _vertices[v.id]=v;
    return v;
  }
  
  updateVertex(Vertex v) {
    _vertices[v.id] = v;
  }

  deleteVertex(Vertex v) {
    _vertices.remove(v.id);
  }
  
  SimpleEdge getEdge(int edgeId) {
    return _edges[edgeId];
  }
  
  createEdge(SimpleEdge e) {
    maxEdgeId++;
    e.id = maxEdgeId;
    _edges[e.id]=e;
    return e;
  }
  
  updateEdge(Edge e) {
    _edges[e.id] = e;
  }
  
  deleteEdge(Edge e) {
    _edges.remove(e.id);
  }
  
  Collection<Vertex2D> getAllVertices() {
    return _vertices.getValues();
  }
  Collection<SimpleEdge> getAllEdges() {
    return _edges.getValues();
  }  
}
