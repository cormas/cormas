resources
menuInfo
	"Tools.MenuEditor new openOnClass: self andSelector: #menuInfo"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #add 
			#defaultString: 'Add...') 
		#value: #addInfo) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #modify 
			#defaultString: 'Modify...') 
		#value: #modifyInfo) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Delete') 
		#value: #removeInfo)) #(2 1) nil) decodeAsLiteralArray