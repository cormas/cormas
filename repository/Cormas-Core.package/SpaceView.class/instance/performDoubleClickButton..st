private - mouse actions
performDoubleClickButton: aPoint
	
	| figure |
	figure := self selection ifNil: [^self].
	figure model ifNotNil: [figure model inspect]