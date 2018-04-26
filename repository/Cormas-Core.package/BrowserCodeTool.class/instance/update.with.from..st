updating
update: anAspectSymbol with: aParameter from: aSender
	
	(#(#removeSelector:class: #changeSelector:class: #addSelector:class: #changeSelector:class:attributes: #addSelector:class:attributes:)
		includes: anAspectSymbol)
		ifTrue:
			[modified isNil ifTrue: [^self].	"We're making the modification so don't update the display"
			(aParameter first = self selector
				and: [(aParameter at: 2) = self methodClass])
				ifTrue:
					[modified := true.
					self updateTextWidget]]
		ifFalse: [super update: anAspectSymbol with: aParameter from: aSender]