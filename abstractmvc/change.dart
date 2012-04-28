#library ('graphmvc');

#import('model.dart');

final CHANGE_CREATE   = 0;
final CHANGE_UPDATE   = 1;
final CHANGE_REMOVE   = 2;

final STAGE_PRE       = 0;
final STAGE_MID       = 1;
final STAGE_POST      = 2;

class Topographic {
  int changeType;
  Edge edge;
  
  Topographic(this.changeType,this.edge);
}

class Geographic {
  int changeType;
  Vertex vertex;
  
  Geographic(this.changeType,this.vertex);
}

interface EsotericChange {
  int changeType;
  applyRemove();
  applyCreate();
  int removeStage();
  int createStage();
}

class Change {
  List<Topographic> topographicChanges;
  List<Geographic> geographicChanges;
  List<EsotericChange> esotericChanges;
  
  Change(geo,topo) : 
    geographicChanges = geo,
    topographicChanges = topo,
    esotericChanges = [];
}