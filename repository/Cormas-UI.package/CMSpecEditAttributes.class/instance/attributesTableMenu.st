private
attributesTableMenu
	" Private - Configure the contextual menu items for receiver's tables "

	| aMenu |
	aMenu := MenuModel new.
	"showEntryItemMenu ifTrue: [ self addMenuItemsForSelectedItemsIn:	aMenu ]."
	^ aMenu buildWithSpecAsPopup