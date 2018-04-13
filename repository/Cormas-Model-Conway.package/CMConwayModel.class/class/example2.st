examples
example2
	| v nbLines choosenModel numberOfModels aModel models normalizer colors es groupsOfElements anim |
	v := RTView new.
	nbLines := 10.
	choosenModel := CMConwayModel.
	numberOfModels := 20.
	models := (1 to: numberOfModels)
		collect: [ :i | 
			aModel := choosenModel
				initialize;
				new.
			aModel initializeSpaceModel.
			aModel
				createGridX: nbLines
				Y: nbLines
				neighbourhood: 4
				closed: true.
			aModel initSimulation.
			aModel runStep.
			aModel ].
	normalizer := RTMultiLinearColor new colors: RTPalette c4.
	colors := (1 to: numberOfModels)
		collect: [ :i | normalizer level: (i / numberOfModels) asFloat ].
	groupsOfElements := models
		with: colors
		collect: [ :m :c | 
			es := (RTBox new
				color: [ :e | 
					e state == #dead
						ifTrue: [ Color white ]
						ifFalse: [ c ] ];
				size: 25) elementsOn: m theCMConwayCells.
			v addAll: es.
			RTGridLayout new
				gapSize: 0;
				lineItemsCount: m spaceModel column;
				on: es.
			es ].
	RTGridLayout on: groupsOfElements.
	v canvas camera focusOnCenterScaled.
	anim := RTActiveAnimation new.
	anim intervalInMilliseconds: 500.
	anim
		blockToExecute: [ models do: #runStep.
			v elements do: #updateShape ].
	anim inView: v.
	v openWithToolbar