initialization
initializeLabels
	" Private - See superimplementor's comment "

	self attributeLabel label: self translator tAttribute.
	self attributeAddButton 
		icon: (self iconNamed: #addIcon);
		help: self translator tHelpAddInstAtt.
	self attributeRemoveButton
		icon: (self iconNamed: #removeIcon);
		help: self translator tHelpRemoveInstAtt.

	self classVarLabel label: self translator tClassVariable.
	self classVarAddButton 
		icon: (self iconNamed: #addIcon);
		help: self translator tHelpAddClassAttr.
	self classVarRemoveButton
		icon: (self iconNamed: #removeIcon);
		help: self translator tHelpRemoveClassAtt.	