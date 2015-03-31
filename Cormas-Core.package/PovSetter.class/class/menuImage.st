resources
menuImage
	"MenuEditor new openOnClass: self andSelector: #menuImage"
	
	<resource: #menu>
	^#(#Menu #(#(#MenuItem 
		#rawLabel: #(#UserMessage 
			#key: #emptypolygone 
			#defaultString: 'Polygone Vide') 
		#value: #strokedPolygon) #(#MenuItem 
		#rawLabel: #(#UserMessage 
			#key: #fullpolygone 
			#defaultString: 'Polygone Plein') 
		#value: #filledPolygon) #(#MenuItem 
		#rawLabel: #(#UserMessage 
			#key: #numberofsegments 
			#defaultString: 'Nb Segments') 
		#value: #nbSegments) #(#MenuItem 
		#rawLabel: #(#UserMessage 
			#key: #linethickness 
			#defaultString: 'Epaisseur Trait') 
		#value: #lineWidth)) #(2 2) nil) decodeAsLiteralArray