interface specs
entities
	"Tools.UIPainter new openOnClass: self andSelector: #entities"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 254) #positionType #specifiedPosition) 
			#label: 'entities' 
			#min: #(Point 404 149) 
			#max: #(Point 804 1000) 
			#bounds: #(Rectangle 719 449 1119 598)) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.3525 44 0 0 0.6625 -7 1) 
				#name: #List1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 7167 8191)) 
				#model: #listSocialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySocialEntityClass) 
				#menu: #socialEntityMenu 
				#style: #pixelLarge) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.68 44 0 0 0.985 -7 1) 
				#name: #List3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 6143 4096)) 
				#model: #listPassiveEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifyPassiveEntityClass) 
				#menu: #passiveEntityMenu 
				#style: #pixelLarge) #(GroupBoxSpec 
				#layout: #(LayoutFrame 2 0 2 0 0 0.995 -3 1) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue)) 
				#label: 'Define the entities') #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 0 0.0575 19.5 0 26 24) 
				#name: #addSpatialEntityClass 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4607 8191 1024) 
					#setBackgroundColor: #(ColorValue #green)) 
				#model: #addSpatialEntityClass 
				#helpText: 'Click to add a Spatial entity class' 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutSizedOrigin 0 0.13 18 0 47 24) 
				#name: #Label2 
				#label: 'spatial   ' 
				#style: #pixelLarge) #(LabelSpec 
				#layout: #(LayoutSizedOrigin 0 0.4675 18 0 39 24) 
				#name: #Label1 
				#label: 'social' 
				#style: #pixelLarge) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 0 0.395 19 0 26 24) 
				#name: #addSocialEntityClass 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 7167 8191)) 
				#model: #addSocialEntityClass 
				#helpText: 'Click to add a Social entity class' 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(LabelSpec 
				#layout: #(LayoutSizedOrigin 0 0.79 18 0 50 24) 
				#name: #Label3 
				#label: 'passive' 
				#style: #pixelLarge) #(ActionButtonSpec 
				#properties: #(PropertyListDictionary #labelFromApplication true) 
				#layout: #(LayoutSizedOrigin 0 0.715 19.5 0 26 24) 
				#name: #addPassiveEntityClass 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 6143 4096)) 
				#model: #addPassiveEntityClass 
				#helpText: 'Click to add a passive entity class' 
				#label: #plusIcon 
				#hasCharacterOrientedLabel: false 
				#defaultable: true) #(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0.02 45 0 0 0.34 -7 1) 
				#name: #List2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 5119 8191 5119)) 
				#model: #listSpatialEntities 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #modifySpatialEntityClass) 
				#menu: #spatialEntityMenu 
				#style: #pixelLarge))))