deprecated
newBoss33: attributList 
	"Create Agent with only #id and #dead values."

	| ag |
	self deprecated:'Should be deprecated in the next CORMAS version'.
	ag := super newBoss: (OrderedCollection with: attributList first).
	attributList removeFirst.
	attributList with: #(#dead:)
		do: [:array1Element :array2Element | ag perform: array2Element with: array1Element].
	^ag