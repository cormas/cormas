Extension { #name : #FTTableMorph }

{ #category : #'*Cormas-UI' }
FTTableMorph >> ensureVisibleFirstSelection [
	| rowIndex |
	(self hasSelection not or: [ self container isRowIndexFullyVisible: (rowIndex := self selectionModeStrategy selectedRowIndex) ]) ifTrue: [ ^ self ].

	rowIndex ifNotNil: [: ri | 
		ri < self showIndex
			ifTrue: [ self moveShowIndexTo: self selectedIndex ]
			ifFalse: [ self moveShowIndexTo: (self selectionModeStrategy indexForRow: rowIndex - self container calculateMinVisibleRows + 1) ] ]
]

{ #category : #'*Cormas-UI' }
FTTableMorph >> selectedItem [

	self flag: #toReview.
	^ self dataSource elementAt: self selectedIndex first
]
