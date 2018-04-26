duplicate
duplicate
	"open a copy of this interface"
	
	| newInterface aName |
	newInterface := self class new.	"cormasModel cormas displayChartsWin add: newInterface."
	newInterface initialize: cormasModel.
	newInterface cormasModel_data: self cormasModel_data copy.
	newInterface nbPts: self nbPts.
	newInterface name value = ''
		ifTrue: [aName := 'Sim' , cormasModel simNumero printString]
		ifFalse: [aName := newInterface name value].
	aName := Dialog
		request: 'Choose a name for the duplicated windows?'
		initialAnswer: aName
		onCancel: [^nil].
	newInterface name value: aName.
	newInterface openInterface: #windDuplicate.
	self simDescriptionText isNil
		ifTrue:
			[newInterface setSimDescriptionText: cormasModel getSimDescriptionText]
		ifFalse: [newInterface simDescriptionText: self simDescriptionText].
	newInterface levelClassName: self levelClassName.
	newInterface chartsList selectionIndexes: self chartsList selectionIndexes.
	newInterface updateChartsDisplay