accessing-menu
menuForPassiveList

	| aMenu |
	aMenu := MenuModel new.
	aMenu
		addGroup: [ : aGroup |
			aGroup addItem: [ : anItem |
				anItem
					name: self translator tEdit;
					subMenu: self subMenuForEditEntity ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem |
					anItem
						name: self translator tSpecialize;
						action: [ self entitySpecialize ] ];
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstract ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tRemove;
						action: [ self entityRemove ] ] ].
	^ aMenu buildWithSpecAsPopup.