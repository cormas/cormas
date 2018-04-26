duplicate
setSimDescriptionText: basicText
	
	| txt |
	txt := basicText.
	txt := txt , 'Simul. name: ' , (String with: Character tab)
		, (self name value asText emphasizeAllWith: #italic) withCRs asText.
	self simDescriptionText: txt