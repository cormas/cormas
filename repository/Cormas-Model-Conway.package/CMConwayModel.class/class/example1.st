examples
example1
	| aModel nbLines v es anim |
	aModel := self
		initialize;
		new.
	nbLines := 50.
	aModel initializeSpaceModel.
	aModel
		createGridX: nbLines
		Y: nbLines
		neighbourhood: 4
		closed: true.
	v := RTView new.
	aModel initSimulation.
	aModel runStep.
	v clean.
	es := (RTBox new
		color: [ :e | 
			e state == #dead
				ifTrue: [ Color white ]
				ifFalse: [ Color black ] ];
		size: 25) elementsOn: aModel theCMConwayCells.
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