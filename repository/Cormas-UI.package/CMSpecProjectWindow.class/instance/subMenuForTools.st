submenu-tools
subMenuForTools

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuToolsManipulateInstances: item ];
				addItem: [ : item | self subMenuToolsCreateInstances: item ];
				addItem: [ : item | self subMenuToolsSnapshot: item ];
				addItem: [ : item | self subMenuToolsMain: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuToolsAddOns: item ];
				addItem: [ : item | self subMenuToolsModelListing: item ];
				addItem: [ : item | self subMenuToolsModelGlossary: item ];
				addItem: [ : item | self subMenuToolsVersions: item ] ];
		addGroup: [ : group | 
			group
				addItem: [ : item | self subMenuToolsDistributeAsClient: item ];
				addItem: [ : item | self subMenuToolsDistributeAsServer: item ];
				addItem: [ : item | self subMenuToolsPackageClient: item ] ]