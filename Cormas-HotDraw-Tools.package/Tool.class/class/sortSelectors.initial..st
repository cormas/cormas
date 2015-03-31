class initialization
sortSelectors: selectors initial: aDictionary
	
	| runnable |
	runnable := selectors
		select:
			[:each | 
			States := aDictionary copy.
			Dictionary keyNotFoundSignal
				handle: [:ex | ex returnWith: false]
				do:
					[self perform: each.
					true]].
	runnable isEmpty
		ifTrue:
			[self error: 'Can''t initialize the tools, circular dependencies'].
	^runnable size == selectors size
		ifTrue: [^selectors]
		ifFalse:
			[States := aDictionary copy.
			runnable do: [:each | self perform: each].
			runnable
				,
					(self
						sortSelectors:
							((selectors asOrderedCollection)
								removeAll: runnable;
								yourself)
						initial: States)]