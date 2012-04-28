#library ('SimpleMVC');
#import ('../abstractmvc/view.dart');
#import ('../abstractmvc/model.dart');
#import ('../abstractmvc/controller.dart');
#import ('../abstractmvc/change.dart');
#import ('dart:html');

class SimpleHandle implements ViewHandle {
  Element element;
}

class SimpleView implements View<SimpleHandle,Graph<Vertex,Edge>,Vertex> {
  Graph graph;
  Element verticesElement;
  Element edgesElement;
  Controller controller;
  
  
  SimpleView(graph,controller,
             verticesElement,
             edgesElement) :  
                    graph = graph,
                    controller = controller,
                    verticesElement = verticesElement,
                        edgesElement = edgesElement {
               controller.registerView(this);
             }
  
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
    var newVertexElement = new Element.html('<div id="vertex_${v.id}">${v.toString()}</div>');
    newVertexElement.on.click.add((e) {
      var id = Math.parseInt(e.target.id.split('_')[1]);
      var delVertex = new Geographic(CHANGE_REMOVE,graph.getVertex(id));
      var change = new Change([delVertex],[]);
      controller.applyChange(change);
    });
    verticesElement.nodes.add(newVertexElement);
    return newVertexElement;
  }
  
  SimpleHandle renderNewEdge(Edge e) {
    var newEdgeElement = new Element.html('<div id="edge_${e.id}">${e.toString()}</div>');
    newEdgeElement.on.click.add((ev) {
      var id = Math.parseInt(ev.target.id.split('_')[1]);
      var delEdge = new Topographic(CHANGE_REMOVE,graph.getEdge(id));
      var change = new Change([],[delEdge]);
      controller.applyChange(change);
    });
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