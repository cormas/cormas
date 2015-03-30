actions
openClassesSettingWindow
	
	| aList |
	self histoList selection isNil
		ifTrue:
			[Cormas current warn: 'You need to select an histogram in the list first']
		ifFalse:
			[aList := List new.
			aList add: (Point x: '0' y: '0').
			self classes list: aList.
			self openInterface: #classesSettings]