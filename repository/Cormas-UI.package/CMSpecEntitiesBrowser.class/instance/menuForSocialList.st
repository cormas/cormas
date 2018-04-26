accessing-menu
menuForSocialList

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
						name: self translator tRename;
						action: [ self entityRename ] ] ];
		addGroup: [ : aGroup |
			aGroup 
				addItem: [ : anItem | 
					anItem
						name: self translator tAbstract;
						action: [ self entityAbstract ] ] ].
	^ aMenu buildWithSpecAsPopup.
	
	
