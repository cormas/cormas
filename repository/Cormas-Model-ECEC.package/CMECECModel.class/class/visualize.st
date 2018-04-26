as yet unclassified
visualize
	
	| data g ds b c |
	data := #(20 30 50 100).
	
	"v := RTView new."
	
	c := RTComposer new.
	
	"First visualization"
	
	g := RTGrapher new.
	g extent: 200 @ 200.
	g view: c view.
	"g view: v view."
	
	ds := RTData new.
	ds interaction popup.
	ds barShape color: Color blue.
	ds points: data.
	
	g add: ds.
	g axisX noTick; noLabel.
	g build.
	"v group: #graph."
	c group: #graph.

	"Second visualization"
	b := RTPieBuilder new.
	b view: c view.
	"b view: v view."
	b interaction popup.
	b objects: data.
	b slice: #yourself.
	b labeled.
	b build.
	"v group: #pie."
   c group: #pie.

	"Layouting"
    c move: #graph onTheLeftOf: #pie.

	RTMetricNormalizer new view: c view;
                 objects: data;
                 distinctColor.
	
	c open.
	
	"v openTitled: 'Data Visualization'."