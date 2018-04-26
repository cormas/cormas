world menu
menuCommandOn: aBuilder
	<worldMenu>
	
	(aBuilder item: #'CORMAS')
		action: [ self open ]; 
		icon: CMIcons smallCormasLogoIcon;
		order: 5.
		
	aBuilder withSeparatorAfter