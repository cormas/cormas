menu
addClassVariable
	
	<menuItem: 'class variable' nameKey: #addClassVariable enablement:
			#inheritsFromCormasPackage indication: nil menu:
			#(#mainMenu #addAttributeMenu) position: 1.2>
	(AttributeAdder new)
		targetClass: self selectedClass;
		addClassVariable