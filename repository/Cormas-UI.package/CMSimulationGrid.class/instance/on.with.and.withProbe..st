instance creation
on: aModel with: cells and: situatedEntities withProbe: probeName
	| windowSize |
	"the method is not used. Is it obsolete ?"
	
	"self halt."
	"Create grid"
	model := aModel. 
	self
		addAll:
			((RTBox new
				color: [ :e | 
					(e theOccupants values isEmpty or: [ e theOccupants values first isEmpty ])
						ifFalse: [ e getColorForPov: #pov ]
						ifTrue: [ e getColorForPov: #pov ] ];
				size: 25) elementsOn: cells).
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: aModel spaceModel column;
		on: self elements.
	"Organize coordinate system"
	origin := (self elements collect: [ :e | e position x ]) min
		@ (self elements collect: [ :e | e position y ]) min.
	windowSize := (self elements collect: [ :e | e position x ]) max
		@ (self elements collect: [ :e | e position y ]) max.
	"9@6 / (3@2)"
	cellSize := (windowSize - origin) / (aModel spaceModel column @ aModel spaceModel line).
	situatedEntitiesViews := ((RTEllipse new
				color: [ :fe | fe getColorForPov: #pov ];
				size: 20) elementsOn: situatedEntities).
	
	self addAll: situatedEntitiesViews.
	self canvas camera focusOnCenterScaled.
	anim ifNil: [anim := RTActiveAnimation new].
	anim intervalInMilliseconds: (speed ifNil:[2]).
	anim
		blockToExecute: [ self runModelStep].
	anim inView: self.
	