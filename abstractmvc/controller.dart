#library ('graphmvc');

#import('model.dart');
#import('view.dart');
#import('change.dart');

interface Controller {
	Graph graph;
	List<View> views;

	registerView(View v);
	unregisterView(View v);
	
  applyChange(Change c);
}