resources
spatialEntityMenu
	"Tools.MenuEditor new openOnClass: self andSelector: #spatialEntityMenu"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #modify 
			#defaultString: 'Edit') 
		#enabled: false 
		#submenu: #(Menu #(#(MenuItem 
			#rawLabel: 'Attributes' 
			#nameKey: #modifySpatialEntityClassAttributes 
			#value: #modifySpatialEntityClassAttributes) #(MenuItem 
			#rawLabel: 'Methods' 
			#nameKey: #modifySpatialEntityClassMethods 
			#value: #modifySpatialEntityClassMethods) #(MenuItem 
			#rawLabel: 'Activity diagrams' 
			#nameKey: #modifySpatialEntityDiagram 
			#value: #modifySpatialEntityDiagram) #(MenuItem 
			#rawLabel: 'PoV setter' 
			#nameKey: #modifySpatialEntityPoVSetter 
			#value: #modifySpatialEntityPoVSetter)) #(4) nil)) #(MenuItem 
		#rawLabel: 'Specialize' 
		#enabled: false 
		#nameKey: #specializeSpatialEntity 
		#value: #specializeSpatialEntity) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #rename 
			#defaultString: 'Rename') 
		#enabled: false 
		#nameKey: #renameSpatialEntityClass 
		#value: #renameSpatialEntityClass) #(MenuItem 
		#rawLabel: #(UserMessage 
			#key: #delete 
			#defaultString: 'Remove') 
		#enabled: false 
		#nameKey: #removeSpatialEntityClass 
		#value: #removeSpatialEntityClass)) #(1 2 1) nil) decodeAsLiteralArray