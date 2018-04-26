interface specs
addSpatialEntity
	"Tools.UIPainter new openOnClass: self andSelector: #addSpatialEntity"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #openType #advanced #openPosition #(Point 10 130) #positionType #specifiedPosition) 
			#label: 'Create a kind of Spatial Entity' 
			#min: #(Point 260 205) 
			#max: #(Point 300 250) 
			#bounds: #(Rectangle 209 232 469 437)) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 51 128 214 151) 
				#name: #InputField1 
				#model: #newClassName) #(LabelSpec 
				#layout: #(Point 113 108) 
				#name: #name 
				#label: 'Name:') #(ActionButtonSpec 
				#layout: #(Rectangle 91 160 172 183) 
				#name: #Ok 
				#model: #addNewSpatialEntityGUI 
				#label: 'Ok' 
				#defaultable: true) #(RadioButtonSpec 
				#layout: #(Point 18 16) 
				#name: #CMSpatialEntityCell 
				#model: #spatialEntitySuperclass 
				#helpText: 'SpatialEntityCell: the cell is the basic entity of the space (as Cellular Automata)' 
				#label: 'Element' 
				#select: #CMSpatialEntityCell) #(RadioButtonSpec 
				#layout: #(Point 18 58) 
				#name: #CMSpatialEntityAggregate 
				#flags: 32 
				#model: #spatialEntitySuperclass 
				#helpText: 'SpatialEntityAggregate is composed of connected cells' 
				#label: 'Aggregate' 
				#select: #CMSpatialEntityAggregate) #(RadioButtonSpec 
				#layout: #(Point 18 87) 
				#name: #CMSpatialEntityNotConnex 
				#flags: 32 
				#model: #spatialEntitySuperclass 
				#helpText: 'SpatialEntityNotConnex is composed of unconnected cells or aggregates' 
				#label: 'Set not connex' 
				#select: #CMSpatialEntityNotConnex) #(LabelSpec 
				#layout: #(Point 23 180) 
				#name: #LabelSpecialize 
				#label: '(or right-click on your own class to specialize it)') #(RadioButtonSpec 
				#layout: #(Point 92 16) 
				#name: #simpleCell 
				#model: #cellOrCA 
				#helpText: 'SpatialEntityElement is the basic Cell entity' 
				#label: 'Simple Cell' 
				#style: #small 
				#select: #CMSpatialEntityElement) #(RadioButtonSpec 
				#layout: #(Point 92 36) 
				#name: #cellAutomaton 
				#model: #cellOrCA 
				#helpText: 'CA is usefull for dynamics between cells' 
				#label: 'Cellular Automaton' 
				#style: #small 
				#select: #CMSpatialEntityCell))))