resources
toolBar
	"Tools.MenuEditor new openOnClass: self andSelector: #toolBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Save' 
		#value: #saveAddOnsSettings 
		#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave) 
		#helpText: 'Save settings. Selected add-ons will be loaded each time you open Cormas')) #(1) nil)
		decodeAsLiteralArray