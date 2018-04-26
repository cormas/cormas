blocks
initBlocks
	
	| inputFields labels |
	self blocks: Dictionary new.
	(self builder namedComponents values
		select: [:x | x widget class = CompositePart])
		do:
			[:x | 
			self blocks
				at: x spec name
				put: Dictionary new.
			inputFields := OrderedCollection new.
			labels := OrderedCollection new.
			x widget components
				do:
					[:i | 
					i spec name notNil
						ifTrue:
							[(i widget class = InputFieldView
								or: [i widget class inheritsFrom: CheckButtonView])
								ifTrue: [inputFields add: i spec name]
								ifFalse: [labels add: i spec name]]].
			(self blocks at: x spec name) at: #inputFields put: inputFields.
			(self blocks at: x spec name) at: #labels put: labels].	"check consistency for blocks names"
	self model playersNames
		do:
			[:pn | 
			(self model playersBlocks at: pn)
				do: [:bn | (self blocks keys includes: bn) ifFalse: [self halt]]]