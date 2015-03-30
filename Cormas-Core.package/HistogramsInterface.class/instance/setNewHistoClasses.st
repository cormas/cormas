actions
setNewHistoClasses
	
	| builtClasses |
	1
		to: self classes list size - 1
		do:
			[:i | 
			(self classes list at: i) y ~= (self classes list at: i + 1) x
				ifTrue:
					[^Cormas current warn:
							'High value of class ''n'', must be equal to the low value of class ''n+1'' ']].
	builtClasses := OrderedCollection new.
	builtClasses add: classes list first x asNumber.
	classes list do: [:c | builtClasses add: c y asNumber].
	self setHistoDataWithClasses: builtClasses