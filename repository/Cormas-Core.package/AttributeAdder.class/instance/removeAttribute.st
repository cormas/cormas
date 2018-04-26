actions_menu
removeAttribute
	"Remove the attribute targeted by the selected row, but also the reader and writter acccessors"
	
	| aCAV |
	aCAV := self selectedRow value.
	aCAV isNil ifTrue: [^self cormas warn: 'Please, select a row.'].
	self removeAttributeOf: aCAV