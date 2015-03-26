initialize-release
initialize
	" Set the listActivity as simple methods of the target class "
	
	| list list2 |
	list := List new.
	list addAll: self targetClass methodsForTesting.
	self listActivity list: list.
	listActivity selectionIndexHolder onChangeSend: #activityChanged to: self.
	list2 := list copy.
	list2 addFirst: self class defaultName.
	self selectedActivity value: list2 first.
	self activityChoices value: list2