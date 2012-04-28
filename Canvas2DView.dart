#library('Canvas');
#import ('simple/SimpleModel.dart');
#import ('abstractmvc/view.dart');
#import ('abstractmvc/model.dart');
#import ('dart:html');

class Canvas2DHandle implements ViewHandle {
  int id;
}

class Canvas2DView implements View<Canvas2DHandle,Graph<Drawable2D,Edge>,Drawable2D> {
  Graph graph;
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;
  final vertexRadius = 3;
  
  Canvas2DView(graph,canvas) :
    graph = graph,
    canvas = canvas {
    ctx = canvas.getContext("2d");
  }
  
  setModel(Graph g) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    renderAll();
  }
  
  renderAll() {
    for (final v in graph.getAllVertices())
      renderNewVertex(v);
    for (final e in graph.getAllEdges())
      renderNewEdge(e);
  }
  
  Canvas2DHandle renderNewVertex(Drawable2D v) {
    if (v is Colorable)
      ctx.fillStyle = v.getColor();
    ctx.beginPath();
    ctx.arc(v.getX(), v.getY(), vertexRadius, 0, Math.PI*2, true);
    ctx.closePath();
    ctx.fill();
  }
  
  Canvas2DHandle renderNewEdge(Edge e) {
    var directed;
    if (e is DirectedEdge)
      directed=true;
    if (e is UndirectedEdge)
      directed=false;
    if (directed==null)
      throw new UnknownEdgeTypeException();
    var vertices = e.getVertices();
    var v1 = graph.getVertex(vertices[0]);
    var v2 = graph.getVertex(vertices[1]);
    if (e is Colorable)
      ctx.strokeStyle = e.getColor();
    ctx.lineWidth = 2; 
    ctx.beginPath();
    ctx.moveTo(v1.getX(),v1.getY());
    ctx.lineTo(v2.getX(),v2.getY());
    if (directed) {
      // taken from http://stackoverflow.com/a/6333775
      var headlen = 10;   // length of head in pixels
      var angle = Math.atan2(v2.getY()-v1.getY(),v2.getX()-v1.getX());
      ctx.lineTo(v2.getX()-headlen*Math.cos(angle-Math.PI/4),v2.getY()-headlen*Math.sin(angle-Math.PI/4));
      ctx.moveTo(v2.getX(), v2.getY());
      ctx.lineTo(v2.getX()-headlen*Math.cos(angle+Math.PI/4),v2.getY()-headlen*Math.sin(angle+Math.PI/4));
    }
    ctx.closePath();
    ctx.stroke();
  }
  
  renderUpdatedVertex(Vertex v, Canvas2DHandle h) {
  }
  
  renderUpdatedEdge(Edge e, Canvas2DHandle h) {
  }
  
  renderDeletedVertex(Vertex v, Canvas2DHandle h) {
  }
  
  renderDeletedEdge(Edge e, Canvas2DHandle h) {
  }
}