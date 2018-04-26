menu
addAttribute
	
	<menuItem: 'attribute' nameKey: #addAttribute enablement:
			#inheritsFromCormasPackage indication: nil menu:
			#(#mainMenu #addAttributeMenu) position: 1.1>
	(AttributeAdder new)
		targetClass: self selectedClass;
		addAttribut