init
openOn: aModel
	
	| tmp |
	"self accept: false."
	tmp := List new.
	tmp add: aModel.
	tmp addAll: aModel allClasses asList.
	classesList := SelectionInList new.
	classesList list: tmp.
	classesList selectionIndexHolder onChangeSend: #classListChanged to: self.
	attributsList := SelectionInList new.
	attributsList selectionIndexHolder onChangeSend: #indexAttributChanged to:
			self.
	self openInterface: #dialogNewParameter