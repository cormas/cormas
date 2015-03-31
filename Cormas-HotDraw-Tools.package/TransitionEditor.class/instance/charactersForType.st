private
charactersForType
	
	| characters |
	characters := OrderedCollection new.
	self characterList selections do: [:each | characters addAll: each value].
	characters addAll: self charactersHolder value.
	^characters asArray