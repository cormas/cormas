submenu-help
subMenuForHelp 

	^ MenuModel new
		addGroup: [ : group |
			group 
				addItem: [ : item | self subMenuAboutThisModel: item ];
				addItem: [ : item | self subMenuHowToRunThisModel: item ];
				addItem: [ : item | self subMenuChangeModelComments: item ];
				addItem: [ : item | self subMenuAbout: item ] ]