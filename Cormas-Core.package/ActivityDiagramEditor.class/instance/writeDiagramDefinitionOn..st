actions
writeDiagramDefinitionOn: codeStream
	"Create the code of the diagram"
	
	| elementFigures connections win |
	"write the Stop & Start Figures"
	codeStream
		nextPutAll:
				'	| stopStarts activities transitions realActivityFigure virtualActivities editor |';
		cr;
		nextPutAll: '	"Set the list of Figures."';
		cr;
		nextPutAll: '	stopStarts := '.
	elementFigures := self drawing components
		select: [:fig | fig class = StartFigure or: [fig class = EndFigure]].
	elementFigures storeOn: codeStream.
	codeStream
		nextPut: $.;
		cr;
		nextPutAll: '	stopStarts do:[: fig | fig model id: fig id].';
		cr;
		cr;
		nextPutAll: '	activities := (Core.OrderedCollection new).';
		cr;
		nextPutAll: '	virtualActivities :='.	"write the activty & decisionPoint Figures"
	elementFigures := self drawing components
		select: [:fig | fig isActivityFigure or: [fig isDiamondFigure]].
	elementFigures storeOn: codeStream.
	codeStream
		nextPut: $.;
		cr;
		cr;
		nextPutAll: '	"Creates the Figures."';
		cr;
		nextPutAll:
				'	virtualActivities do: [:actFig |
		realActivityFigure := actFig class createAt: ((actFig bounds) center) forClass: self.
		realActivityFigure lineColor: actFig lineColor; fillColor: actFig fillColor; lineWidth: actFig lineWidth.
		realActivityFigure id:  actFig id.
		realActivityFigure model selectedActivity value: actFig info.
		realActivityFigure model id: actFig id.
		activities add: realActivityFigure].'.
	codeStream
		cr;
		nextPutAll: '	activities addAllFirst: stopStarts.';
		cr.
	codeStream
		cr;
		nextPutAll: '	"Creates the Transitions."';
		cr;
		nextPutAll: '	transitions := OrderedCollection new. '.	"write the transitions Figures"
	connections := self drawing components
		select: [:fig | fig class = LineFigure].
	connections
		do:
			[:each | 
			codeStream nextPutAll:
					'	transitions add: (Refactory.HotDraw.ToolStateTransitionModel new'.
			each writeStoreStringOn: codeStream.
			codeStream
				nextPutAll: ').';
				cr].	"write to create an instance of the editor"
	win := self builder window.
	codeStream
		cr;
		nextPutAll: '	"Creates and open the new Editor."';
		cr;
		nextPutAll:
				'	editor := ActivityDiagramEditor newWithActivities: activities connections: transitions forClass: self method: #'
						, self name , '.';
		cr;
		nextPutAll:
				'	editor location: (Rectangle origin: ' , win globalOrigin asString ,
							' width: ' , win width asString , ' height: ' , win height asString
						, ').';
		cr;
		nextPutAll: '	^editor'