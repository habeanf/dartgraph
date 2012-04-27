#import ('../abstractmvc/model.dart');

class SimpleVertex implements Vertex {
  int id,x,y;
  
  String toString() {
    return '[${x},${y}]';
  }
}

class SimpleEdge implements DirectedEdge {
  int id;
  int fromVertex,toVertex;
  
  List getVertices() {
    return [fromVertex,toVertex];
  }
  
  String toString() {
    return '[${fromVertex},${toVertex}]';
  }
}

class SimpleGraph implements Graph<SimpleVertex,SimpleEdge> {
  Map _vertices;
  Map _edges;
  int maxVertexId,maxEdgeId;
  
  SimpleGraph(Collection<SimpleVertex> vertices, Collection<SimpleEdge> edges) {
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
  
  SimpleVertex getVertex(int vertexId) {
    return _vertices[vertexId];
  }

  SimpleVertex createVertex(SimpleVertex v) {
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
  
  Collection<SimpleVertex> getAllVertices() {
    return _vertices.getValues();
  }
  Collection<SimpleEdge> getAllEdges() {
    return _edges.getValues();
  }  
}
