#import ('../abstractmvc/view.dart');
#import ('../abstractmvc/model.dart');
#import ('dart:html');

class SimpleHandle implements ViewHandle {
  Element element;
}

class SimpleView implements View<SimpleHandle> {
  Graph graph;
  Element verticesElement;
  Element edgesElement;
  
  SimpleView(this.graph,this.verticesElement,this.edgesElement);
  
  setModel(Graph g) {
    verticesElement.nodes.clear();
    edgesElement.nodes.clear();
    graph = g;
    for (final v in graph.getAllVertices())
      renderNewVertex(v);
    for (final e in graph.getAllEdges())
      renderNewEdge(e);
  }
  
  SimpleHandle renderNewVertex(Vertex v) {
    var newVertexElement = new Element.html('<div>${v.toString()}</div>');
    verticesElement.nodes.add(newVertexElement);
    return newVertexElement;
  }
  
  SimpleHandle renderNewEdge(Edge e) {
    var newEdgeElement = new Element.html('<div>${e.toString()}</div>');
    edgesElement.nodes.add(newEdgeElement);
    return newEdgeElement;
  }
  
  renderUpdatedVertex(Vertex v, SimpleHandle h) {
    h.element.innerHTML='<div>${v.toString()}</div>';
  }
  
  renderUpdatedEdge(Edge e, SimpleHandle h) {
    h.element.innerHTML='<div>${e.toString()}</div>';
  }
  
  renderDeletedVertex(Vertex v, SimpleHandle h) {
    h.element.remove();
  }
  
  renderDeletedEdge(Edge e, SimpleHandle h) {
    h.element.remove();
  }
}