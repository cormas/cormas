resources
menuDecisionsSheet
	"MenuEditor new openOnClass: self andSelector: #menuDecisionsSheet"
	
	<resource: #menu>
	^#(#Menu #(#(#MenuItem 
		#rawLabel: '' 
		#labelImage: #(#ResourceRetriever #UIPalette #selectIconImage)) #(#MenuItem 
		#rawLabel: 'Decisions sheet' 
		#enabled: false 
		#nameKey: #DecisionsSheet 
		#submenu: #(#Menu #(#(#MenuItem 
			#rawLabel: 'Events' 
			#nameKey: #Events 
			#value: #events)) #(1) nil))) #(2) nil) decodeAsLiteralArray