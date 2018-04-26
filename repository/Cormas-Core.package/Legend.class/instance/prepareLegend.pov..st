actions
prepareLegend: aClass pov: aSelectorName
	"fill the povDict dictionary for aClass and the symbols associated to aSelectorName.
ex : listSymbolito = OrderedCollection (#A #B #C #B)"
	
	| aText listSymbolito list1 symbolito count cond cr method |
	method := (self
		findMethod: aSelectorName asSymbol
		forClass: aClass) at: 2.
	aText := method mclass sourceCodeAt: aSelectorName asSymbol.	"JFL : the following old code doesn't work in a runtime image
	aText := ((self findMethod: (aSelectorName asSymbol) forClass: aClass) at: 2) getSource."
	listSymbolito := OrderedCollection new.
	list1 := aText string tokensBasedOn: $^.
	list1 removeAllSuchThat: [:str | str first ~= $#].
	list1
		do:
			[:subString | 
			symbolito := String new.
			count := 1.
			cond := true.
			[cond]
				whileTrue:
					[count := count + 1.
					cr := subString at: count.
					symbolito := symbolito , (String with: cr).
					count = subString size ifTrue: [cond := false].
					cond
						ifTrue:
							[(subString at: count + 1) isLetter not ifTrue: [cond := false]]].
			listSymbolito add: symbolito asSymbol].
	self povDictAt: aClass at: aSelectorName put: listSymbolito