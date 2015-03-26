resources
socialEntityMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #socialEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #modify 
			#defaultString: 'Edit') 
		#enabled: false 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Attributes' 
			#nameKey: #modifySocialEntityClassAttributes 
			#value: #modifySocialEntityClassAttributes) #(MenuItem 
			#rawLabel: 'Methods' 
			#nameKey: #modifySocialEntityClassMethods 
			#value: #modifySocialEntityClassMethods) #(MenuItem 
			#rawLabel: 'Activity diagrams' 
			#nameKey: #modifySocialEntityDiagram 
			#value: #modifySocialEntityDiagram) #(MenuItem 
			#rawLabel: 'PoV setter' 
			#nameKey: #modifySocialEntityPoVSetter 
			#value: #modifySocialEntityPoVSetter)) #(4) nil)) #(MenuItem 
		#rawLabel: 'Specialize' 
		#enabled: false 
		#nameKey: #specializeSocialEntity 
		#value: #specializeSocialEntity) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #rename 
			#defaultString: 'Rename') 
		#enabled: false 
		#nameKey: #renameSocialEntityClass 
		#value: #renameSocialEntityClass) #(MenuItem 
		#rawLabel: 'Abstract / Not abstract' 
		#enabled: false 
		#nameKey: #changeAbstractSocial 
		#value: #changeAbstractSocial) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Remove') 
		#enabled: false 
		#nameKey: #removeSocialEntityClass 
		#value: #removeSocialEntityClass)) #(1 3 1) nil) decodeAsLiteralArray