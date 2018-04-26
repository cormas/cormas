class initialization
initializeStates
	
	| selectors |
	selectors := self
		sortSelectors:
			(self class organization listAtCategoryNamed: #'tool states')
		initial: Dictionary new.
	States := Dictionary new.
	selectors do: [:each | self perform: each].
	States
		at: 'Hand Tool'
		put:
			(States
				at: 'Selection Tool'
				ifAbsent: [EndToolState new])