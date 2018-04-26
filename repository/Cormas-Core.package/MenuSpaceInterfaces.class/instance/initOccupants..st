initialize-release
initOccupants: unDicoOccupants
	
	| labelsList |
	theOccupants := OrderedCollection new.
	labelsList := OrderedCollection new.
	unDicoOccupants values do: [:l | theOccupants addAll: l].
	theOccupants
		do: [:a | labelsList add: a class name , ' #' , a id printString].
	self occupantsList list: labelsList