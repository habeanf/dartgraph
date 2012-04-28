#library ('SimpleMVC');
#import ('../abstractmvc/controller.dart');
#import ('../abstractmvc/view.dart');
#import ('../abstractmvc/model.dart');
#import ('../abstractmvc/change.dart');

class SimpleController implements Controller {
  Graph graph;
  List<View> views;

  SimpleController(graph) : graph = graph,
                            views = [];
  
  registerView(View v) {
    views.add(v);
    v.setModel(graph);
  }
  
  unregisterView(View v) {
    views.removeRange(views.indexOf(v),1);
  }
  
  updateViews() {
    for (final v in views) {
      v.setModel(graph);
    }
  }
  
  applyChange(Change c) {
    applyRemovals(c);
    applyAdditions(c);
    applyUpdates(c);
    updateViews();
  }
  
  applyRemovals(Change c) {
    // removals apply topogrophic changes first, then geographic changes

    for (final e in c.esotericChanges)
      if ((e.changeType == CHANGE_REMOVE) && (e.removeStage()==0))
        e.applyRemove();    
    
    for (final t in c.topographicChanges)
      if (t.changeType == CHANGE_REMOVE)
        graph.deleteEdge(t.edge);
    
    for (final e in c.esotericChanges)
      if ((e.changeType == CHANGE_REMOVE) && (e.removeStage()==1))
        e.applyRemove();    
       
    for (final g in c.geographicChanges)
      if (g.changeType == CHANGE_REMOVE)
        graph.deleteVertex(g.vertex);
        
    for (final e in c.esotericChanges)
      if ((e.changeType == CHANGE_REMOVE) && (e.removeStage()==2))
        e.applyRemove();    
  }
  
  applyAdditions(Change c) {
    // create applies geographic changes first, then topographic changes

    for (final e in c.esotericChanges)
      if ((e.changeType == CHANGE_CREATE) && (e.removeStage()==0))
        e.applyCreate();    
        
    for (final g in c.geographicChanges)
      if (g.changeType == CHANGE_CREATE)
        graph.createVertex(g.vertex);
        
    for (final e in c.esotericChanges)
      if ((e.changeType == CHANGE_CREATE) && (e.removeStage()==1))
        e.applyCreate();    

    for (final t in c.topographicChanges)
      if (t.changeType == CHANGE_CREATE)
        graph.createEdge(t.edge);
    
    for (final e in c.esotericChanges)
      if ((e.changeType == CHANGE_CREATE) && (e.removeStage()==2))
        e.applyCreate();    
  }
  
  applyUpdates(Change c) {
    for (final g in c.geographicChanges)
      if (g.changeType == CHANGE_UPDATE)
        graph.updateVertex(g.vertex);
        
    for (final e in c.esotericChanges)
      if ((e.changeType == CHANGE_UPDATE))
        e.applyCreate();    

    for (final t in c.topographicChanges)
      if (t.changeType == CHANGE_UPDATE)
        graph.updateEdge(t.edge);
  }
}