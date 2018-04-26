examples
example1
	| aModel nbLines v es anim |
	self defaultInit: #init58WithFire.
	aModel := self
		initialize;
		new.
	nbLines := 100.
	aModel initializeSpaceModel.
	aModel
		createGridX: nbLines
		Y: nbLines
		neighbourhood: 4
		closed: true.
	v := RTView new.
	aModel initSimulation.
	aModel runStep.
	es := (RTBox new
		color: [ :e | 
			e state == #tree
				ifTrue: [ Color green ]
				ifFalse: [ e state == #fire
						ifTrue: [ Color red ]
						ifFalse: [ e state == #ash
								ifTrue: [ Color gray ]
								ifFalse: [ Color black ] ] ] ];
		size: 25) elementsOn: aModel theCMFireAutomataCells.
	v addAll: es.
	RTGridLayout new
		gapSize: 0;
		lineItemsCount: aModel spaceModel column;
		on: v elements.
	v canvas camera focusOnCenterScaled.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: 0.
	anim
		blockToExecute: [ aModel runStep.
			v elements do: #updateShape ].
	anim inView: v.
	v openWithToolbar