resources
toolBar
	"Tools.MenuEditor new openOnClass: self andSelector: #toolBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Reset 
			#defaultString: 'Reset') 
		#value: #hexagon 
		#labelImage: #(ResourceRetriever VectorialImageEditor #hexagonIcon) 
		#helpText: 'Reset the image') #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Reset 
			#defaultString: 'Reset') 
		#value: #square 
		#labelImage: #(ResourceRetriever VectorialImageEditor #squareIcon)) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #Reset 
			#defaultString: 'Reset') 
		#value: #circle 
		#labelImage: #(ResourceRetriever VectorialImageEditor #diskIcon)) #(MenuItem 
		#rawLabel: 'Reset' 
		#value: #triangle 
		#labelImage: #(ResourceRetriever VectorialImageEditor #triangleIcon))) #(4) nil)
		decodeAsLiteralArray