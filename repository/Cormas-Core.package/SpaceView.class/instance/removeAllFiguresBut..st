adding-removing
removeAllFiguresBut: targetFigures
	"removes a ll the displayed Figures but keeps th targetFigures"
	
	| figuresToBeRemoved |
	figuresToBeRemoved := self components
		select: [:fig | (targetFigures includes: fig) not].
	^self removeAll: figuresToBeRemoved