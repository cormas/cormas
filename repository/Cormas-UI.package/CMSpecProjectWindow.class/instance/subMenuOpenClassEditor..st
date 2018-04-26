submenu-programming
subMenuOpenClassEditor: item

	item
		name: 'Class Editor...';
		icon: #openIcon asIcon;
		shortcut: $c command;
		action: [ OPUmlProject openOnModel: (OPUMLModel new name: self projectManager cormasModelName)
 ]
		
