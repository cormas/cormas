newBoss: attributList 
	"Create Entity with only  #id value.
	To add some other values of attributes, newBoss: must be redefine.
Ex: With attributList = OrderedCollection (1  3), this method will create a new instance of ObjectLocation with id= 1 and patchID = 3. Then it will move the entity on the third cell.
To redefine newBoss: it could be as following:
newBoss: attributList 
	| ag |
	ag := super newBoss: (attributList copyFrom: 1 to: 2).
	2 timesRepeat: [attributList removeFirst].
	attributList with: #(#name: #cashbox:)
		do: [:array1Element :array2Element | ag perform: array2Element with: array1Element].

the  attributList = OrderedCollection (1  3 'LandOwner-1' 2000).
The attributs names must have been specified in the #representBinaryOn: instance method.
Ex:
representBinaryOn: bos 
	| msg |
	msg := super representBinaryOn: bos.
	msg arguments first add: self name; add: self cashbox.
	^msg

Then, the first 3 values of attributList must be for the #id, #dead and patchID of the agent.
The others are for the name and the cashbox values."

	| ag |
	ag := self new.
	attributList do: [: assoc | 
ag update: (assoc key asString) to:  assoc value
"ag perform: (assoc key, ':') asSymbol with: assoc value"].
	^ag
