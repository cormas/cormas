resources
toolBar
	"Tools.MenuEditor new openOnClass: self andSelector: #toolBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Save' 
		#value: #exportAttributsValues 
		#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave) 
		#helpText: 'Export the attributs'' values')) #(1) nil)
		decodeAsLiteralArray