interface actions
closeDialogForModelUser
	"the closeDialog offers only the cancel / exit  choices.
	return false in case of cancel"
	
	| labels values result |
	labels := OrderedCollection
		with: #closeCormasThenExit << nil >> 'Exit'
		with: #Cancel << nil >> 'Cancel'.
	values := OrderedCollection with: #exit with: #cancel.
	result := Dialog
		choose: #closeCormasOrExit << nil >> 'Exit Cormas ?'
		labels: labels
		values: values
		default: #cancel.
	result == #cancel ifTrue: [^false].
	ObjectMemory quit