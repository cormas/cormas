Extension { #name : #FTTableContainerMorph }

{ #category : #'*Cormas-UI' }
FTTableContainerMorph >> isRowIndexExceding: rowIndex [
	| headerPresentModificator nextRowIndexByPosition heightWithSpacing |
	
	headerPresentModificator := headerRow ifNotNil: [ 1 ] ifNil: [ 0 ].
	rowIndex
		ifNotNil: [ 
			nextRowIndexByPosition := rowIndex - self table showIndex + 1 + headerPresentModificator.
			heightWithSpacing := self table rowHeight + self table intercellSpacing y.
			^ (nextRowIndexByPosition * heightWithSpacing) > self height ].
	^ false
]
