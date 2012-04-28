#import('dart:html');
#import('simple/SimpleController.dart');
#import('simple/SimpleView.dart');
#import('simple/SimpleModel.dart');
#import('3d/Vertex3D.dart');
#import('Canvas2DView.dart');

class GraphMVC {

  GraphMVC() {
    document.query('#status').innerHTML = "";
  }

  void run() {
    var v1 = new Vertex3D(1,[100.0,200.02,4.5]);
    var v2 = new Vertex3D(2,[30.1234,50.32343,5.23423]);
    var e = new SimpleEdge(1,2,1);
    var g = new SimpleGraph([v1,v2],[e]);
    var c = new SimpleController(g);
    var vw1 = new SimpleView(g,c,document.query('#vertices'),document.query('#edges'));
    var vw2 = new SimpleView(g,c,document.query('#vertices2'),document.query('#edges2'));
    var canvasview = new Canvas2DView(g,document.query('#canvas'));
    c.registerView(canvasview);
  }
}

void main() {
  new GraphMVC().run();
}