resources
passiveEntityMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #passiveEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #modify 
			#defaultString: 'Edit') 
		#enabled: false 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Attributes' 
			#nameKey: #modifyPassiveEntityClassAttributes 
			#value: #modifyPassiveEntityClassAttributes) #(MenuItem 
			#rawLabel: 'Methods' 
			#nameKey: #modifyPassiveEntityClassMethods 
			#value: #modifyPassiveEntityClassMethods) #(MenuItem 
			#rawLabel: 'Activity diagrams' 
			#nameKey: #modifyPassiveEntityDiagram 
			#value: #modifyPassiveEntityDiagram) #(MenuItem 
			#rawLabel: 'PoV setter' 
			#nameKey: #modifyPassiveEntityPoVSetter 
			#value: #modifyPassiveEntityPoVSetter)) #(4) nil)) #(MenuItem 
		#rawLabel: 'Specialize' 
		#enabled: false 
		#nameKey: #specializePassiveEntity 
		#value: #specializePassiveEntity) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #rename 
			#defaultString: 'Rename') 
		#enabled: false 
		#nameKey: #renamePassiveEntityClass 
		#value: #renamePassiveEntityClass) #(MenuItem 
		#rawLabel: 'Abstract / Not abstract' 
		#enabled: false 
		#nameKey: #changeAbstractPassive 
		#value: #changeAbstractPassive) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Remove') 
		#enabled: false 
		#nameKey: #removePassiveEntityClass 
		#value: #removePassiveEntityClass)) #(1 3 1) nil) decodeAsLiteralArray