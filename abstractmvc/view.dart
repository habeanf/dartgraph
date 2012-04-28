#library ('graphmvc');

#import('model.dart');

interface ViewHandle {

}

interface View<Handle,G,V> {
  G graph;
  
  setModel(G g);
  
  Handle renderNewVertex(V v);
  Handle renderNewEdge(Edge e);
  
  renderUpdatedVertex(V v, Handle h);
  renderUpdatedEdge(Edge e, Handle h);
  
  renderDeletedVertex(V v, Handle h);
  renderDeletedEdge(Edge e, Handle h);
}