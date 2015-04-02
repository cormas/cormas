interface actions
closeDialog
	"ask the user for choosing a close action, execute the action.
	return false in case of cancel"
	
	| labels values result |
	Cormas isModelUserMode ifTrue: [^self closeDialogForModelUser].
	labels := OrderedCollection new.
	values := OrderedCollection new.
	self cormasModelClass
		ifNil:
			[labels
				add: #closeCormas << nil >> 'Close Cormas';
				add: #closeCormasThenExit << nil >> 'Exit'.
			values addAll: #(#close #exit)]
		ifNotNil:
			[labels
				add: #saveModelThenExit << nil >> 'Save model then Exit';
				add: #closeCormas << nil >> 'Just Close Cormas';
				add: #exitWithoutSavingModel << nil >> 'Exit VW'.	"add: #saveModelThenClose << nil >> 'Save the model then close Cormas';"
			values addAll: #(#saveModelThenExit #close #exitWithoutSaving)].
	labels add: #Cancel << nil >> 'Cancel'.
	values add: #cancel.
	result := Dialog
		choose: #closeCormasOrExit << nil >> 'Exit Cormas'
		fromVerticallyAlignedButtonsWithLabels: labels
		values: values
		default: #cancel.
	result == #cancel ifTrue: [^false].
	(#(#saveThenClose #saveThenExit) includes: result)
		ifTrue: [self exportModel].
	(#(#close #closeWithoutSaving #saveThenClose) includes: result)
		ifTrue:
			[self closeModel.
			VisualLauncher raiseSingleInstance].
	(#(#saveThenExit #exitWithoutSaving #exit) includes: result)
		ifTrue: [ObjectMemory quit]