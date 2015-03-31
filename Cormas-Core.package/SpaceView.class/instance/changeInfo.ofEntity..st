displaying
changeInfo: infoSymbol ofEntity: aClass
	"Called from spaceInterface, when a Info has changed"
	
	| figures |
	figures := self figuresOfEntity: aClass.
	infoSymbol = #nil
		ifTrue: [figures do: [:fig | fig removeText]]
		ifFalse: [figures do: [:fig | fig setTextFor: infoSymbol]]