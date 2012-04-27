#library ('graphmvc');

#import('model.dart');

interface ViewHandle {

}

interface View<Handle> {
  Graph graph;
  
  setModel(Graph g);
  
  Handle renderNewVertex(Vertex v);
  Handle renderNewEdge(Edge e);
  
  renderUpdatedVertex(Vertex v, Handle h);
  renderUpdatedEdge(Edge e, Handle h);
  
  renderDeletedVertex(Vertex v, Handle h);
  renderDeletedEdge(Edge e, Handle h);
}