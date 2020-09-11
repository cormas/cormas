Class {
	#name : #ManipulateInstances,
	#superclass : #UIApplicationModel,
	#instVars : [
		'cormas',
		'cormasModel',
		'entityChoices',
		'exeMethodChoices',
		'nbEntitiesSelectedSituated',
		'entity',
		'entityImage',
		'valueForAttribute',
		'operator',
		'initMethod',
		'locateCreatedEntities',
		'attributeToChange',
		'initMethodChoices',
		'nbExistingEntities',
		'operatorChoices',
		'attributeToChangeChoices',
		'nbEntitiesToCreate',
		'controlMethod',
		'nbEntitiesSelected',
		'nbExistingEntitiesSituated',
		'controlMethodChoices',
		'testElement',
		'testElementChoices',
		'testValue',
		'selectedEntities',
		'checkLocateManually',
		'linkedSpaceInterface',
		'initialTool',
		'toBePerformed',
		'targetEntities'
	],
	#classInstVars : [
		'isWinOpen',
		'entitiesToCreateForSpaceView',
		'currentInstance',
		'timeTagForLocateManually'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #resources }
ManipulateInstances class >> createEntityIcon [
	
	^OpaqueImage
		figure: self createEntityIconImage
		shape: self createEntityIconMask
]

{ #category : #resources }
ManipulateInstances class >> createEntityIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createEntityIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 19
				depth: 7
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(64 96 160)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7002 7195 7484)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(385 642 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(899 1477 2184)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7805 7869 7966)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1220 2023 2955)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2505 4079 5974)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7066 7066 7066)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(738 1220 1798)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(289 481 706)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(546 899 1316)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(674 1124 1638)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(224 385 546)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(642 1060 1573)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2409 3918 5749)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(192 321 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1509 2441 3565)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1477 2376 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1124 1863 2730)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(128 224 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2762 3790 5043)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(96 160 256)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1863 3019 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(578 963 1413)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2248 3661 5364)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 803 1188)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1734 2826 4111)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2280 3469 4882)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7130 7130 7130)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(353 610 867)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2505 4079 6006)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(449 449 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2441 3983 5846)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 2505 3661)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(224 385 578)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 3180 4593)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2376 3886 5685)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2344 3822 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(610 963 1413)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6103 6103 6103)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3115 3115 3115)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(995 1606 2344)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5749 6070 6488)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 2987 4400)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5235 5235 5235)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5396 5910 6520)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1830 2987 4368)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 3597 5235)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(867 1445 2152)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 32 32)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1252 2023 2987)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2087 3404 5010)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3501 3501 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4914 4914 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 3372 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(738 1188 1734)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(353 546 803)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1573 2569 3758)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1188 1927 2826)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2409 3950 5781)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2473 4047 5942)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(192 353 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(642 1027 1509)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1156 1863 2762)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(192 289 417)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2184 3308 4689)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1027 1670 2441)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 3790 5557)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1863 3051 4464)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5300 5300 5300)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2248 3693 5396)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 835 1220)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 2987 4432)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1381 2248 3308)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(32 32 32)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1702 2794 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(385 610 899)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1670 2730 4015)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(770 1252 1830)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2120 3469 5107)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1606 2633 3854)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(674 1092 1606)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1959 3212 4721)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1060 1734 2537)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6070 6070 6070)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1413 2312 3404)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 3083 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(963 1573 2312)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 835 1220)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(96 96 96)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 770 1156)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(899 1477 2152)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1316 2152 3180)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(546 835 1188)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 2120 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1060 1477 1991)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2601 2987 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(385 610 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(803 1316 1927)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1606 2633 3886)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(706 1156 1702)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2473 4015 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1124 1863 2698)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3308 3308 3308)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(256 417 610)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2376 3854 5653)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 3758 5492)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5267 5267 5267)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(96 160 224)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1927 2987 4368)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1381 2280 3340)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(931 1541 2248)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3501 4368 5492)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1349 2216 3276)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(449 738 1092)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(867 1445 2087)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2152 3565 5203)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'V5-[V5-[V5-[R5%]@B)KV5-[V5-[V5,@V5-[V5-[V5-[M0@@@@@.V5-[V5-[V5,@V5-[V5-[V5-[AV0@@CXEV5-[V5-[V5,@V5-[V5-[V5,^JP1M@@1WG%-[V5-[V5,@V5-[V5-[V4\N@@@@@@@@C''A[V5-[V5,@V5-[V5-[Y08@@@@@@@@@@@8HV5-[V5,@V5-[E$(-RWD2O0@@@@@NL!\[KT)JR$(@V5,BGRA3@D8 TP@@@@A)HE@@]"@ HB@@V5,/\#T@W2@ ZP@@@@ATHBA8@F)HF"@@V5-5P@4CI2@ C0@@@@@9HBA9EU)4U#P@V5,%NCU/HB@PN @@@@AOOS4QD%UERCP@V0H]HB@ HB@;@@A"M@@@T6 <LAL\HA@@V2<1HB@ HC8[@E8 HG\@WDDSUP@@QEL@V7UEHB@ HD8@@C, HBL@@E(SQVAB@FD@V2TGHB@ HB @G2H HC4_@FTTHB@XY D@@!4 HB@ L@@@VB@ HBA3@CM4Z2H=T6L@K3D HB@ BP@J["@ HBAE[PA@SB-4AFP@]TT HBAF@@A"HB@ HB@ A @3Q%H5P20@IP\ HBAFB!$&HB@ HB@ I0,$FB@ Q T@'))
]

{ #category : #resources }
ManipulateInstances class >> createEntityIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #createEntityIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 19
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 60 0 0 0 126 0 0 0 126 0 0 0 219 0 0 1 255 128 0 3 255 192 0 31 255 254 0 63 255 254 0 63 255 254 0 63 255 254 0 63 255 254 0 127 255 254 0 127 255 254 0 127 255 254 0 127 255 254 0 255 255 254 0 255 255 254 0 255 255 254 0 255 255 252 0])
]

{ #category : #accessing }
ManipulateInstances class >> currentInstance [
	
	^currentInstance
]

{ #category : #accessing }
ManipulateInstances class >> currentInstance: anObject [
	
	currentInstance := anObject
]

{ #category : #accessing }
ManipulateInstances class >> entitiesToCreateForSpaceView [
	
	^entitiesToCreateForSpaceView
]

{ #category : #accessing }
ManipulateInstances class >> entitiesToCreateForSpaceView: anObject [
	
	entitiesToCreateForSpaceView := anObject
]

{ #category : #obsolete }
ManipulateInstances class >> interfaceComplete [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Manipulate instances' 
			#min: #(Point 315 406) 
			#max: #(Point 315 406) 
			#bounds: #(Rectangle 640 364 955 770) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7167 8191 6143)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(GroupBoxSpec 
				#layout: #(Rectangle 7 292 304 398) 
				#name: #GroupBox5 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Ask selected entities to')) #(RegionSpec 
				#layout: #(Rectangle 228 12 303 86) 
				#name: #Region1 
				#flags: 16 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(Rectangle 7 91 305 182) 
				#name: #GroupBoxCreateInstances 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Create and initialize N instances')) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 9 106) 
				#name: #textNbInstancesToCreate 
				#label: 'Number of instances' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 23 126 65 147) 
				#name: #nbEntitiesToCreate 
				#model: #nbEntitiesToCreate 
				#alignment: #right 
				#type: #number) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 108 106) 
				#name: #textInitMethodChoices 
				#label: 'Initialization method' 
				#style: #pixelDefault) #(ComboBoxSpec 
				#layout: #(Rectangle 96 126 213 147) 
				#name: #initMethodChoices 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #initMethod 
				#comboList: #initMethodChoices) #(ActionButtonSpec 
				#layout: #(Rectangle 226 124 291 148) 
				#name: #createNentity 
				#model: #createNentity 
				#label: 'Create' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 195 225 245 246) 
				#name: #InputField2 
				#model: #testValue 
				#alignment: #right 
				#type: #object) #(ActionButtonSpec 
				#layout: #(Rectangle 207 309 239 333) 
				#name: #ActionButton2 
				#model: #executeMethodOnEntities 
				#label: 'Do' 
				#defaultable: true) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 228 10 306 88) 
				#name: #entityImage 
				#flags: 24 
				#component: #entityImage) #(GroupBoxSpec 
				#layout: #(Rectangle 6 27 198 84) 
				#name: #GroupBox2 
				#label: 'Number of entites') #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 28 39) 
				#name: #Label6 
				#label: 'All' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 18 56 72 77) 
				#name: #InputField5 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #nbExistingEntities 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(GroupBoxSpec 
				#layout: #(Rectangle 7 192 304 292) 
				#name: #GroupBox7 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Select a subset of entities or')) #(ComboBoxSpec 
				#layout: #(Rectangle 141 225 186 246) 
				#name: #ComboBox4 
				#model: #operator 
				#comboList: #operatorChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 81 310.5 197 331.5) 
				#name: #ComboBox5 
				#model: #controlMethod 
				#comboList: #controlMethodChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 15 225 132 246) 
				#name: #ComboBox2 
				#model: #testElement 
				#comboList: #testElementChoices) #(LabelSpec 
				#layout: #(Point 17 207) 
				#name: #Label2 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'criteria to test') 
				#style: #pixelDefault) #(ActionButtonSpec 
				#layout: #(Rectangle 154 193 215 209.5) 
				#name: #ActionButton4 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 1024 1024 8191)) 
				#model: #selectAllEntities 
				#label: 'Select All' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 85 254.0 132 269.0) 
				#name: #ActionButton5 
				#model: #addToEntitiesSelection 
				#label: 'Add' 
				#style: #small 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 200 208) 
				#name: #Label7 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'threshold') 
				#style: #pixelDefault) #(ActionButtonSpec 
				#layout: #(Rectangle 96 367 164 391) 
				#name: #setColorOfEntities 
				#model: #setColorOfEntities 
				#label: 'Change color' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 39 367 90 391) 
				#name: #ActionButton3 
				#model: #inspectSelectedEntities 
				#label: 'Inspect' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 253 250 285 269) 
				#name: #InputField3 
				#model: #nbEntitiesSelected 
				#alignment: #right 
				#type: #object) #(LabelSpec 
				#layout: #(Point 196 251) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'Nb selected') 
				#style: #pixelDefault) #(LabelSpec 
				#layout: #(Point 198 267) 
				#name: #LabelNb_situated 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: 'Nb situated') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 253 268 285 287) 
				#name: #nbEntitiesSelectedSituated 
				#model: #nbEntitiesSelectedSituated 
				#alignment: #right 
				#type: #object) #(LabelSpec 
				#layout: #(Point 65 257) 
				#name: #Label10 
				#label: 'or') #(LabelSpec 
				#layout: #(Point 176 259) 
				#name: #Label11 
				#label: '->') #(ComboBoxSpec 
				#layout: #(Rectangle 81 338 197 359) 
				#name: #ComboBox3 
				#model: #attributeToChange 
				#comboList: #attributeToChangeChoices) #(ActionButtonSpec 
				#layout: #(Rectangle 264 336.5 296 360.5) 
				#name: #ActionButton7 
				#model: #setAttributeValue 
				#label: 'Do' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 207 338 257 359) 
				#name: #InputField6 
				#model: #valueForAttribute 
				#type: #object) #(LabelSpec 
				#layout: #(Point 16 -1) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Entity' 
				#style: #large) #(RadioButtonSpec 
				#layout: #(Point 102 151) 
				#name: #locateCreatedEntities_Rand 
				#model: #locateCreatedEntities 
				#label: 'Locate randomly' 
				#select: #locateCreatedEntities_Rand) #(RadioButtonSpec 
				#layout: #(Point 21 150) 
				#name: #locateCreatedEntities_No 
				#model: #locateCreatedEntities 
				#label: 'Not located' 
				#style: #small 
				#select: #locateCreatedEntities_No) #(ComboBoxSpec 
				#layout: #(Rectangle 88 6 188 29) 
				#name: #ComboBox6 
				#model: #entity 
				#comboList: #entityChoices) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 87 39) 
				#name: #LabelSituated 
				#flags: 32 
				#label: 'Situated' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 81 56 135 77) 
				#name: #nbExistingEntitiesSituated 
				#flags: 40 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #nbExistingEntitiesSituated 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(ActionButtonSpec 
				#layout: #(Rectangle 170 367 258 391) 
				#name: #moveToRandomCell 
				#model: #moveToRandomCell 
				#label: 'Locate randomly' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 12 310) 
				#name: #Label5 
				#label: 'Execute ->' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 12 338) 
				#name: #Label8 
				#label: 'Set value ->' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 204 151) 
				#name: #locateCreatedEntities_SpaceView 
				#model: #locateCreatedEntities 
				#label: 'Locate manually' 
				#select: #locateCreatedEntities_SpaceView) #(ActionButtonSpec 
				#layout: #(Rectangle 15 255.5 62 279.5) 
				#name: #ActionButton6 
				#model: #selectEntities 
				#label: 'Select' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 85 271.0 133 286.0) 
				#name: #ActionButton8 
				#model: #removeFromEntitiesSelection 
				#label: 'Remove' 
				#style: #small 
				#defaultable: true))))
]

{ #category : #accessing }
ManipulateInstances class >> isWinOpen [
	
	^isWinOpen ifNil: [isWinOpen := false]
]

{ #category : #accessing }
ManipulateInstances class >> isWinOpen: anObject [
	
	isWinOpen := anObject
]

{ #category : #'instance creation' }
ManipulateInstances class >> openOnSpaceInterface: aSpaceInterface [
	
	| aWin |
	aWin := super new.
	aSpaceInterface manipInstancesController: aWin.
	aWin linkedSpaceInterface: aSpaceInterface.
	aWin openOn: aSpaceInterface cormasModel.
	aWin targetEntities value: #allEntities.
	aWin toBePerformed value: #inspect.
	aSpaceInterface drawing selections isEmpty
		ifFalse:
			[aSpaceInterface
				updateEntitiesSelectionWith: aSpaceInterface drawing selections
				lastFigureSelected: aSpaceInterface drawing selections last]
]

{ #category : #accessing }
ManipulateInstances class >> timeTagForLocateManually [
	
	^timeTagForLocateManually
]

{ #category : #accessing }
ManipulateInstances class >> timeTagForLocateManually: anObject [
	
	timeTagForLocateManually := anObject
]

{ #category : #'interface specs' }
ManipulateInstances class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Manipulate instances' 
			#min: #(Point 314 208) 
			#max: #(Point 314 257) 
			#bounds: #(Rectangle 720 450 1034 658) 
			#colors: #(LookPreferences) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(GroupBoxSpec 
				#layout: #(Rectangle 4 119 257 206) 
				#name: #GroupBox2 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Apply')) #(GroupBoxSpec 
				#layout: #(Rectangle 3 32 256 121) 
				#name: #GroupBox1 
				#label: #(UserMessage 
					#key: #povDefinition 
					#defaultString: 'Action to be performed')) #(ArbitraryComponentSpec 
				#layout: #(Rectangle 258 6 309 58) 
				#name: #ViewHolder1 
				#flags: 24 
				#component: #entityImage) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 165 2) 
				#name: #Label6 
				#label: 'Total number' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 220 2.5 262 21.5) 
				#name: #InputField5 
				#flags: 0 
				#model: #nbExistingEntities 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true 
				#type: #number) #(ComboBoxSpec 
				#layout: #(Rectangle 77 52.0 246 71.0) 
				#name: #controlMethodChoices 
				#model: #controlMethod 
				#helpText: 'Select a method to be executed' 
				#comboList: #controlMethodChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 77 75.0 193 94.0) 
				#name: #attributeToChangeChoices 
				#model: #attributeToChange 
				#helpText: 'Select an attribute to be modified' 
				#comboList: #attributeToChangeChoices) #(InputFieldSpec 
				#layout: #(Rectangle 196 75 246 94) 
				#name: #valueForAttribute 
				#model: #valueForAttribute 
				#helpText: 'Enter the new value for the attribute' 
				#type: #object) #(LabelSpec 
				#layout: #(Point 8 5) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Entity' 
				#style: #systemDefault) #(ComboBoxSpec 
				#layout: #(Rectangle 48 8 165 28) 
				#name: #entityChoices 
				#model: #entity 
				#tabable: true 
				#comboList: #entityChoices) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 165 15) 
				#name: #LabelSituated 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#label: 'Situated' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 220 15.5 262 34.5) 
				#name: #nbExistingEntitiesSituated 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#model: #nbExistingEntitiesSituated 
				#tabable: false 
				#style: #pixelDefault 
				#isReadOnly: true 
				#type: #number) #(RadioButtonSpec 
				#layout: #(Point 8 137) 
				#name: #RadioAllEntities 
				#model: #targetEntities 
				#helpText: 'All the instances of the selected Entity class will perform the action' 
				#label: 'to all entities' 
				#select: #allEntities) #(RadioButtonSpec 
				#layout: #(Point 8 159) 
				#name: #RadioByClicking 
				#model: #targetEntities 
				#helpText: 'The actions with be performed when user click (or drag) with the mouse' 
				#label: 'by clicking on entities' 
				#select: #byClicking) #(RadioButtonSpec 
				#layout: #(Point 8 181) 
				#name: #RadioSubset 
				#model: #targetEntities 
				#helpText: 'The actions will be performed on a subset of entities' 
				#label: 'to a subset of entities:' 
				#select: #subsetEntities) #(RadioButtonSpec 
				#layout: #(Point 8 52) 
				#name: #RadioExecute 
				#model: #toBePerformed 
				#helpText: 'The entities will execute a method' 
				#label: 'Execute' 
				#select: #execute) #(RadioButtonSpec 
				#layout: #(Point 8 75) 
				#name: #RadioSetValue 
				#model: #toBePerformed 
				#helpText: 'Changing the value of an attribute' 
				#label: 'Set value' 
				#select: #setValue) #(RadioButtonSpec 
				#layout: #(Point 8 98) 
				#name: #RadioInspect 
				#model: #toBePerformed 
				#helpText: 'The entities will be inspected' 
				#label: 'Inspect' 
				#select: #inspect) #(RadioButtonSpec 
				#layout: #(Point 88 98) 
				#name: #RadioChangeColor 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6125 0 0)) 
				#model: #toBePerformed 
				#helpText: 'Changing the color of the entities' 
				#label: 'Change color' 
				#select: #changeColor) #(RadioButtonSpec 
				#layout: #(Point 174 98) 
				#name: #RadioResetColor 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 6125 0 0)) 
				#model: #toBePerformed 
				#helpText: 'Reset the color of the entities' 
				#label: 'Reset color' 
				#select: #resetColor) #(ActionButtonSpec 
				#layout: #(Rectangle 259 108.0 309 139.0) 
				#name: #stopPainting 
				#flags: 56 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #stopPainting 
				#label: 'Stop' 
				#style: #large 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 259 108 309 139) 
				#name: #mainApplyButton 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #mainApply 
				#label: 'Apply' 
				#style: #systemDefault 
				#defaultable: true) #(CompositeSpecCollection 
				#collection: #(#(CompositeSpecCollection 
					#collection: #(#(GroupBoxSpec 
						#layout: #(Rectangle 0 0 260 56) 
						#name: #GroupBox7 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue 7700 7700 7700) 
							#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
						#label: #(UserMessage 
							#key: #povDefinition 
							#defaultString: '')) #(RegionSpec 
						#layout: #(Rectangle 2 2 258 54) 
						#name: #Region1 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue #yellow) 
							#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
						#lineWidth: 1)) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle -2 16 258 72) 
						#name: #Composite1)) #(CompositeSpecCollection 
					#collection: #(#(ComboBoxSpec 
						#layout: #(Rectangle 0 0 116 19) 
						#name: #testElementChoices 
						#model: #testElement 
						#comboList: #testElementChoices) #(ComboBoxSpec 
						#layout: #(Rectangle 117 0 157 19) 
						#name: #operatorChoices 
						#model: #operator 
						#comboList: #operatorChoices) #(InputFieldSpec 
						#layout: #(Rectangle 158 0 208 19) 
						#name: #testValue 
						#model: #testValue 
						#tabable: true 
						#alignment: #right 
						#isReadOnly: false 
						#type: #object)) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle 4 19 212 38) 
						#name: #Composite2)) #(ActionButtonSpec 
					#layout: #(Rectangle 215 20.5 253 36.5) 
					#name: #selectEntities 
					#model: #selectEntities 
					#label: 'Select' 
					#defaultable: true) #(ActionButtonSpec 
					#layout: #(Rectangle 215 39.5 253 55.5) 
					#name: #resetSelection 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 0 0 6766)) 
					#model: #resetSelection 
					#label: 'Reset' 
					#defaultable: true) #(ActionButtonSpec 
					#layout: #(Rectangle 162 53.0 195 68.0) 
					#name: #removeFromEntitiesSelection 
					#isOpaque: true 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 2048 2048 8191) 
						#setBackgroundColor: #(ColorValue #white)) 
					#model: #removeFromEntitiesSelection 
					#label: 'Remove' 
					#style: #pixelSmall 
					#defaultable: true) #(ActionButtonSpec 
					#layout: #(Rectangle 126 53.0 159 68.0) 
					#name: #addToEntitiesSelection 
					#isOpaque: true 
					#colors: #(LookPreferences 
						#setForegroundColor: #(ColorValue 2048 2048 8191) 
						#setBackgroundColor: #(ColorValue #white)) 
					#model: #addToEntitiesSelection 
					#label: 'Add' 
					#style: #pixelSmall 
					#defaultable: true) #(CompositeSpecCollection 
					#collection: #(#(InputFieldSpec 
						#layout: #(Rectangle 20 17 50 34) 
						#name: #InputField3 
						#model: #nbEntitiesSelected 
						#tabable: false 
						#alignment: #right 
						#style: #pixelDefault 
						#isReadOnly: true 
						#type: #object) #(InputFieldSpec 
						#layout: #(Rectangle 78 17 110 34) 
						#name: #nbEntitiesSelectedSituated 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue 4915 4915 4915)) 
						#model: #nbEntitiesSelectedSituated 
						#tabable: false 
						#alignment: #right 
						#style: #pixelDefault 
						#isReadOnly: true 
						#type: #object) #(LabelSpec 
						#layout: #(Point 3 13) 
						#name: #Label11 
						#label: '->') #(LabelSpec 
						#layout: #(Point 0 0) 
						#name: #Label4 
						#label: #(UserMessage 
							#key: #methodesreturningSymbol 
							#defaultString: 'Selected number') 
						#style: #pixelDefault) #(LabelSpec 
						#layout: #(Point 77 0) 
						#name: #LabelNb_situated 
						#colors: #(LookPreferences 
							#setForegroundColor: #(ColorValue 4915 4915 4915)) 
						#label: #(UserMessage 
							#key: #methodesreturningSymbol 
							#defaultString: 'situated') 
						#style: #pixelDefault)) 
					#compositeSpec: #(CompositeSpec 
						#layout: #(Rectangle 2 35 116 69) 
						#name: #Composite3)) #(LabelSpec 
					#layout: #(Point 117 0) 
					#name: #Label2 
					#label: #(UserMessage 
						#key: #methodesreturningSymbol 
						#defaultString: ' set criteria for the subset') 
					#style: #pixelDefault)) 
				#compositeSpec: #(CompositeSpec 
					#layout: #(Rectangle 21 181 281 253) 
					#name: #subsetCriteria)))))
]

{ #category : #actions }
ManipulateInstances >> addToEntitiesSelection [
	
	| collec |
	(((self entityClass isNil not and: [testValue value isNil not])
		and: [testElement value ~= '']) and: [operator value ~= ''])
		ifTrue:
			[collec := self getSelectedEntities.
			collec
				ifNil: [^nil]
				ifNotNil: [self selectedEntities addAll: collec].
			self nbEntitiesSelected value: self selectedEntities size.
			self isSituatedEntity
				ifTrue:
					[self nbEntitiesSelectedSituated
						value: (self selectedEntities select: [:a | a isSituated]) size].
			self linkedSpaceInterface
				ifNotNil: [self updateFiguresSelectedOnSpaceInterface]]
]

{ #category : #aspects }
ManipulateInstances >> attributeToChange [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributeToChange isNil
		ifTrue: [attributeToChange := String new asValue]
		ifFalse: [attributeToChange]
]

{ #category : #aspects }
ManipulateInstances >> attributeToChangeChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributeToChangeChoices isNil
		ifTrue: [attributeToChangeChoices := List new asValue]
		ifFalse: [attributeToChangeChoices]
]

{ #category : #'actions while painting' }
ManipulateInstances >> changeAttributeByPainting [
	"change the attributeToChange value with valueForAttribute by the cells clicked by the user.
	The activateToolNamed is set to 'ChangeAttribute Tool' "
	
	self initializeByPainting ifNil: [^nil].
	self linkedSpaceInterface view
		manipulatedEntity:
			self entity value asSymbol class.
	self linkedSpaceInterface view manipulationAction: #setValue.
	self linkedSpaceInterface view
		clicToChangeAttribute: self attributeToChange value
		withValue: self valueForAttribute value	"en fait, on pourrait aussi passer par l'appel directement √† l accesseur en √©criture "	"	self attributeToChange value isNil
		ifTrue: [^Dialog warn: 'Please select an attribute'].
	self valueForAttribute value isNil
		ifTrue: [^Dialog warn: 'Please select a value'].
	self initializeByPainting.
	self linkedSpaceInterface view
		manipulationAction: (self attributeToChange value , ':') asSymbol.
	self linkedSpaceInterface view
		manipulationActionArguments: (Array with: self valueForAttribute value)"
]

{ #category : #'initialize-release' }
ManipulateInstances >> changeEntity [
	
	| aList compoForSituated methodsForControlUsed |
	nbExistingEntities value: self entitiesCollection size.
	self nbEntitiesSelected value: nil.
	self nbEntitiesSelectedSituated value: nil.
	self selectedEntities: nil.
	self class entitiesToCreateForSpaceView: nil.	"enable or disable components for situated entities"
	compoForSituated := #(#LabelSituated #nbExistingEntitiesSituated #setColorOfEntities #LabelNb_situated #nbEntitiesSelectedSituated #locateCreatedEntities_Rand #locateCreatedEntities_No #Region1).
	self isSituatedEntity
		ifTrue:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compoForSituated refersToLiteral: k)
						ifTrue:
							[v
								enable;
								isVisible: true]].
			entityImage
				figure: (self entityClass imageAtPov: self entityClass name) asFigure.
			entityImage invalidate.
			nbExistingEntitiesSituated
				value: (self entitiesCollection select: [:a | a isSituated]) size]
		ifFalse:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compoForSituated refersToLiteral: k)
						ifTrue:
							[v
								disable;
								isVisible: false]].
			nbExistingEntitiesSituated value: 0.
			entityImage figure: nil.
			entityImage invalidate].	"enable or disable components for changing color"
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#setColorOfEntities #resetColorOfEntities) refersToLiteral: k)
				ifTrue:
					[(self linkedSpaceInterface isNil not
						and: [self isSpatialEntity or: [self isSituatedEntity]])
						ifTrue:
							[v
								enable;
								isVisible: true]
						ifFalse:
							[v
								disable;
								isVisible: false]]].	"set menu for executing methods"
	aList := List new.
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[methodsForControlUsed := self linkedSpaceInterface siConfig
				manipMethodsFor: self entityClass]
		ifFalse: [methodsForControlUsed := self entityClass methodsForControl].
	methodsForControlUsed isEmpty
		ifFalse:
			[aList add: '--control--'.
			aList addAll: methodsForControlUsed].
	self entityClass methodsForInit isEmpty
		ifFalse:
			[aList add: '--init--'.
			aList addAll: self entityClass methodsForInit].
	controlMethodChoices value: aList.
	controlMethod value
		ifNotNil:
			[(controlMethodChoices value includes: controlMethod value asSymbol)
				ifFalse: [controlMethod value: nil]].	"set menu for selecting a subset of instances"
	aList := List new.
	aList add: '--attribute--'.
	(DefaultAttributesSetter attributsFromClass: self entityClass) isEmpty
		ifFalse:
			[aList
				addAll:
					(DefaultAttributesSetter attributsFromClass: self entityClass) sorted].
	aList
		addAll:
			(self entityClass methodsOfProtocolStartingWith: '* accessing') sorted.
	self entityClass methodsForTesting isEmpty
		ifFalse:
			[aList add: '--testing--'.
			aList addAll: self entityClass methodsForTesting sorted].
	testElementChoices value: aList.
	testElement value
		ifNotNil:
			[(testElementChoices value includes: testElement value)
				ifFalse:
					[testElement value: nil.
					testValue value: nil]].	"set menu for changing attribute value"
	aList := List with: ''.
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[aList
				addAll:
					(self linkedSpaceInterface siConfig attributesFor: self entityClass).
			#(#setValueLabel #attributeToChangeChoices #valueForAttribute #setAttributeValue)
				do:
					[:acomName | 
					(self linkedSpaceInterface siConfig canChangeValuesFor: self entityClass)
						ifTrue:
							[(self builder namedComponents at: acomName)
								enable;
								isVisible: true]
						ifFalse:
							[(self builder namedComponents at: acomName)
								disable;
								isVisible: false]]]
		ifFalse:
			[aList
				addAll: (DefaultAttributesSetter attributsFromClass: self entityClass)].
	attributeToChangeChoices value: aList.
	attributeToChange value
		ifNotNil:
			[(attributeToChangeChoices value includes: attributeToChange value asSymbol)
				ifFalse: [attributeToChange value: nil]]
]

{ #category : #aspects }
ManipulateInstances >> checkLocateManually [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^checkLocateManually isNil
		ifTrue: [checkLocateManually := false asValue]
		ifFalse: [checkLocateManually]
]

{ #category : #'initialize-release' }
ManipulateInstances >> closeWithSpaceInterface [
	
	self requestForWindowClose.
	self closeAndUnschedule
]

{ #category : #aspects }
ManipulateInstances >> controlMethod [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^controlMethod isNil
		ifTrue: [controlMethod := String new asValue]
		ifFalse: [controlMethod]
]

{ #category : #aspects }
ManipulateInstances >> controlMethodChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^controlMethodChoices isNil
		ifTrue: [controlMethodChoices := List new asValue]
		ifFalse: [controlMethodChoices]
]

{ #category : #accessing }
ManipulateInstances >> cormas [
	
	^cormas
]

{ #category : #accessing }
ManipulateInstances >> cormas: anObject [
	
	cormas := anObject
]

{ #category : #accessing }
ManipulateInstances >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
ManipulateInstances >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : #accessing }
ManipulateInstances >> entitiesCollection [
	
	self entityClass isAbstract
		ifFalse: [^cormasModel theEntities: self entityClass]
		ifTrue: [^cormasModel allTheEntities: self entityClass]
]

{ #category : #aspects }
ManipulateInstances >> entity [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^entity isNil
		ifTrue: [entity := String new asValue]
		ifFalse: [entity]
]

{ #category : #aspects }
ManipulateInstances >> entityChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^entityChoices isNil
		ifTrue: [entityChoices := List new asValue]
		ifFalse: [entityChoices]
]

{ #category : #accessing }
ManipulateInstances >> entityClass [
	
	^self entityName class
]

{ #category : #aspects }
ManipulateInstances >> entityImage [
	"self entityClass ifNil:[^nil]."
	
	^entityImage
		ifNil:
			[entityImage := EntityPOVView new	" model: (self entityClass defaultImage)"]
]

{ #category : #accessing }
ManipulateInstances >> entityName [
	
	^self entity value copyUpTo: $+
]

{ #category : #'actions while painting' }
ManipulateInstances >> executeMethodByPainting [
	"Executed a method on the entity clicked by the user."
	
	self initializeByPainting.
	self linkedSpaceInterface view
		manipulationAction: self controlMethod value asSymbol
]

{ #category : #actions }
ManipulateInstances >> executeMethodOnEntities [
	"the selected entites will perform the controlMethod"
	
	| arg collec |
	(self entityClass isNil not
		and:
			[controlMethod value isNil not
				and:
					[(self entityClass findSelector: controlMethod value asSymbol) isNil not]])
		ifFalse: [^nil].	"store before manipulation"
	self linkedSpaceInterface isNil
		ifFalse: [self linkedSpaceInterface storeBeforeManipulation].	"Which entites?"
	self selectedEntities isEmpty
		ifTrue: [collec := self entitiesCollection]
		ifFalse: [collec := self selectedEntities].	"The entities perform the controlMethod"
	(controlMethod value includes: $:)
		ifFalse: [collec do: [:e | e perform: controlMethod value asSymbol]]
		ifTrue:
			[arg := Cormas askUserArgumentsForMethod: controlMethod value.
			arg ifNil: [^nil].
			collec
				do:
					[:e | 
					e
						perform: controlMethod value asSymbol
						withArguments: arg]].	"Update the situated number"
	nbExistingEntities value: self entitiesCollection size.
	self isSituatedEntity
		ifTrue:
			[nbExistingEntitiesSituated
				value: (self entitiesCollection select: [:a | a isSituated]) size]
]

{ #category : #actions }
ManipulateInstances >> getSelectedEntities [
	
	| arg isTesting |
	isTesting := self entityClass methodsForTestingNoArg
		includes: testElement value asSymbol.
	((((testValue value = true or: [testValue value = false])
		or: [testValue value isSymbol]) or: [testValue value isString])
		and: [operator value ~= '=']) ifTrue: [isTesting ifFalse: [^nil]].
	(operator value asSymbol = #' ' and: [isTesting not]) ifTrue: [^nil].
	(testElement value includes: $:)
		ifFalse:
			[^self entitiesCollection
				select:
					[:e | 
					isTesting
						ifTrue: [e perform: testElement value asSymbol]
						ifFalse:
							[(e perform: testElement value asSymbol)
								perform: operator value asSymbol
								with: testValue value	"Cormas valueOfValueInString:"]]]
		ifTrue:
			[arg := Cormas
				askUserArgumentsForMethod: testElement value
				classesAsArgForModel: self cormasModel.
			arg ifNil: [^nil].
			^self entitiesCollection
				select:
					[:e | 
					(e
						perform: testElement value asSymbol
						withArguments: arg)
						perform: operator value asSymbol
						with: testValue value	"Cormas valueOfValueInString:"]]
]

{ #category : #aspects }
ManipulateInstances >> initMethod [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^initMethod isNil
		ifTrue: [initMethod := String new asValue]
		ifFalse: [initMethod]
]

{ #category : #aspects }
ManipulateInstances >> initMethodChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^initMethodChoices isNil
		ifTrue: [initMethodChoices := List new asValue]
		ifFalse: [initMethodChoices]
]

{ #category : #accessing }
ManipulateInstances >> initialTool [
	
	^initialTool
]

{ #category : #accessing }
ManipulateInstances >> initialTool: anObject [
	
	initialTool := anObject
]

{ #category : #'initialize-release' }
ManipulateInstances >> initialize [
	
	self targetEntities onChangeSend: #targetEntitiesChanged to: self.
	self toBePerformed onChangeSend: #toBePerformedChanged to: self
]

{ #category : #'actions while painting' }
ManipulateInstances >> initializeByPainting [
	"The user has just click on 'Apply' button to paint, some components of the interface must be disable.
	The activateToolNamed is set to 'ChangeAttribute Tool' "
	
	self entityClass isNil ifTrue: [^nil].
	self linkedSpaceInterface view manipulatedEntity: self entityClass.
	self linkedSpaceInterface activeSpatialEntity notNil ifFalse: [self halt].
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v disable]].
	(self builder componentAt: #mainApplyButton) isVisible: false.
	(self builder componentAt: #stopPainting)
		enable;
		isVisible: true.
	self initialTool: self linkedSpaceInterface view controller currentTool.	"self linkedSpaceInterface disableAllTools."	"self linkedSpaceInterface activateToolNamed: 'Manipulate Tool'"
	self linkedSpaceInterface activateToolNamed: 'ChangeAttribute Tool'
]

{ #category : #'actions while painting' }
ManipulateInstances >> inspectByPainting [
	"Inspect each entity clicked by the user."
	
	self initializeByPainting.
	self linkedSpaceInterface view
		manipulatedEntity:
			(self entity value asSymbol) class.
	self linkedSpaceInterface view manipulationAction: #inspect
]

{ #category : #actions }
ManipulateInstances >> inspectSelectedEntities [
	"Open an inspector on one entity or a collection of entities"
	
	| collec |
	self entityClass isNil not
		ifTrue:
			[self selectedEntities isEmpty
				ifTrue: [collec := self entitiesCollection]
				ifFalse: [collec := self selectedEntities].
			collec size = 1
				ifTrue: [collec first inspect]
				ifFalse: [collec inspect]]
]

{ #category : #testing }
ManipulateInstances >> isCompoundSpatialEntity [
	
	^cormasModel compoundSpatialClasses includes: self entityClass
]

{ #category : #testing }
ManipulateInstances >> isSituatedEntity [
	
	^self entityClass isSituatedClass
]

{ #category : #testing }
ManipulateInstances >> isSpatialEntity [
	
	^self entityClass isSpatialClass
]

{ #category : #accessing }
ManipulateInstances >> linkedSpaceInterface [
	
	^linkedSpaceInterface
]

{ #category : #accessing }
ManipulateInstances >> linkedSpaceInterface: anObject [
	
	linkedSpaceInterface := anObject
]

{ #category : #aspects }
ManipulateInstances >> locateCreatedEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^locateCreatedEntities isNil
		ifTrue: [locateCreatedEntities := nil asValue]
		ifFalse: [locateCreatedEntities]
]

{ #category : #accessing }
ManipulateInstances >> locateCreatedEntitiesOption [
	
	self locateCreatedEntities value = #locateCreatedEntities_Rand
		ifTrue: [^#random].
	self locateCreatedEntities value = #locateCreatedEntities_No
		ifTrue: [^#no].
	self locateCreatedEntities value = #locateCreatedEntities_Contrained
		ifTrue: [^#contrained].
	self locateCreatedEntities value = #locateCreatedEntities_SpaceView
		ifTrue: [^#manually]
]

{ #category : #actions }
ManipulateInstances >> mainApply [
	
	self toBePerformed value = #execute
		ifTrue:
			[self controlMethod value isNil
				ifTrue: [^Dialog warn: 'Please select a method to be performed'].
			^self targetEntities value = #byClicking
				ifFalse: [self executeMethodOnEntities]
				ifTrue: [self executeMethodByPainting]].
	self toBePerformed value = #setValue
		ifTrue:
			[self attributeToChange value isNil
				ifTrue: [^Dialog warn: 'Please select an attribute'].
			self valueForAttribute value isNil
				ifTrue: [^Dialog warn: 'Please enter a value'].
			^self targetEntities value = #byClicking
				ifFalse: [self setAttributeValue]
				ifTrue: [self changeAttributeByPainting]].
	self toBePerformed value = #inspect
		ifTrue:
			[^self targetEntities value = #byClicking
				ifFalse: [self inspectSelectedEntities]
				ifTrue: [self inspectByPainting]].
	self toBePerformed value = #changeColor
		ifTrue:
			[^self targetEntities value = #byClicking
				ifFalse: [self setColorOfEntities]
				ifTrue: [self setColorByPainting]].
	self toBePerformed value = #resetColor
		ifTrue:
			[^self targetEntities value = #byClicking
				ifFalse: [self resetColorOfEntities]
				ifTrue: [self resetColorByPainting]]
]

{ #category : #deprecated }
ManipulateInstances >> moveToRandomCell [
	(self entityClass isNil not
		and: [ self selectedEntities isEmpty not ])
		ifTrue: [ self selectedEntities
				do: [ :e | e moveTo: cormas currentSimulation pickCell ].
			nbExistingEntitiesSituated
				value: (self entitiesCollection select: [ :a | a isSituated ]) size ]
]

{ #category : #aspects }
ManipulateInstances >> nbEntitiesSelected [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbEntitiesSelected isNil
		ifTrue: [nbEntitiesSelected := nil asValue]
		ifFalse: [nbEntitiesSelected]
]

{ #category : #aspects }
ManipulateInstances >> nbEntitiesSelectedSituated [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbEntitiesSelectedSituated isNil
		ifTrue: [nbEntitiesSelectedSituated := nil asValue]
		ifFalse: [nbEntitiesSelectedSituated]
]

{ #category : #aspects }
ManipulateInstances >> nbEntitiesToCreate [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbEntitiesToCreate isNil
		ifTrue: [nbEntitiesToCreate := 0 asValue]
		ifFalse: [nbEntitiesToCreate]
]

{ #category : #aspects }
ManipulateInstances >> nbExistingEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbExistingEntities isNil
		ifTrue: [nbExistingEntities := 0 asValue]
		ifFalse: [nbExistingEntities]
]

{ #category : #aspects }
ManipulateInstances >> nbExistingEntitiesSituated [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbExistingEntitiesSituated isNil
		ifTrue: [nbExistingEntitiesSituated := 0 asValue]
		ifFalse: [nbExistingEntitiesSituated]
]

{ #category : #'initialize-release' }
ManipulateInstances >> openOn: aModel [
	
	cormasModel := aModel.
	self prepareClasses.
	builder := self allButOpenInterface: #windowSpec.
	entityChoices value isEmpty
		ifFalse: [self entity value: entityChoices value first].
	self linkedSpaceInterface
		ifNotNil:
			[builder window
				label:
					builder window label , ' >View '
						,
							(self linkedSpaceInterface view class allInstances
								indexOf: self linkedSpaceInterface view) printString.
			self linkedSpaceInterface createInstancesController
				ifNil:
					[builder
						openAt:
							(Cormas
								originPointOfWindowExtent: builder window extent
								toPlaceOnSideOf: self linkedSpaceInterface builder window)]
				ifNotNil:
					[builder
						openAt:
							(Cormas
								originPointOfWindowExtent: builder window extent
								toPlaceOnSideOf: self linkedSpaceInterface builder window
								andBelow:
									self linkedSpaceInterface createInstancesController builder window)]]
		ifNil: [builder window open]
]

{ #category : #aspects }
ManipulateInstances >> operator [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^operator isNil
		ifTrue: [operator := String new asValue]
		ifFalse: [operator]
]

{ #category : #aspects }
ManipulateInstances >> operatorChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^operatorChoices isNil
		ifTrue: [operatorChoices := List new asValue]
		ifFalse: [operatorChoices]
]

{ #category : #'initialize-release' }
ManipulateInstances >> prepareClasses [
	
	| modelClassesUsed aList modelClasses |
	modelClasses := OrderedCollection new.
	modelClasses
		addAll:
			(cormasModel class spatialClasses collect: [:cl | cl name]) sorted.
	modelClasses
		addAll: (cormasModel class socialClasses collect: [:cl | cl name]) sorted.
	modelClasses
		addAll:
			(cormasModel class passiveObjectClasses collect: [:cl | cl name]) sorted.
	modelClassesUsed := OrderedCollection new.
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[modelClasses
				do:
					[:c | 
					(self linkedSpaceInterface siConfig
						manipWholePopFor: c class)
						ifTrue: [modelClassesUsed add: c]]]
		ifFalse: [modelClasses do: [:c | modelClassesUsed add: c]].
	entityChoices := (List withAll: modelClassesUsed) asValue.
	self entity onChangeSend: #changeEntity to: self.
	self class entitiesToCreateForSpaceView: nil.
	aList := List withAll: #(#' ' #= #> #>= #< #<=).
	operatorChoices := aList asValue
]

{ #category : #actions }
ManipulateInstances >> removeFromEntitiesSelection [
	
	| collec |
	((((self entityClass isNil not and: [testValue value isNil not])
		and: [testElement value ~= '']) and: [operator value ~= ''])
		and: [self selectedEntities isEmpty not])
		ifTrue:
			[collec := self getSelectedEntities.
			collec
				ifNil: [^nil]
				ifNotNil: [self selectedEntities: self selectedEntities - collec].
			self nbEntitiesSelected value: self selectedEntities size.
			self isSituatedEntity
				ifTrue:
					[self nbEntitiesSelectedSituated
						value: (self selectedEntities select: [:a | a isSituated]) size].
			self linkedSpaceInterface
				ifNotNil: [self updateFiguresSelectedOnSpaceInterface]]
]

{ #category : #'initialize-release' }
ManipulateInstances >> requestForWindowClose [
	
	cormasModel := nil.
	self linkedSpaceInterface
		ifNotNil: [self linkedSpaceInterface manipInstancesController: nil].
	^super requestForWindowClose
]

{ #category : #'actions while painting' }
ManipulateInstances >> resetColorByPainting [
	
	self initializeByPainting.
	self linkedSpaceInterface view activeAttribute: #bidon.
	self linkedSpaceInterface view
		manipulatedEntity:
			self entity value asSymbol class.
	self linkedSpaceInterface view manipulationAction: #resetColor
]

{ #category : #actions }
ManipulateInstances >> resetColorOfEntities [
	
	| collec aFig |
	self entityClass isNil not
		ifTrue:
			[self selectedEntities isEmpty
				ifTrue: [collec := self entitiesCollection]
				ifFalse: [collec := self selectedEntities].
			collec
				do:
					[:e | 
					aFig := self linkedSpaceInterface drawing components
						detect: [:fig | fig model entity = e]
						ifNone: [nil].
					aFig
						ifNotNil:
							[aFig model entity isSpatialEntity
								ifTrue: [aFig fillColor: (aFig model getColorForPov: aFig pov)]
								ifFalse:
									[aFig class ~= BitmapFigure
										ifTrue:
											[aFig fillColor: (aFig model entity povAt: aFig pov) color]]]]]
]

{ #category : #actions }
ManipulateInstances >> resetSelection [
	
	self entityClass
		ifNotNil:
			[self selectedEntities: nil.
			self nbEntitiesSelected value: nil.
			self isSituatedEntity
				ifTrue: [self nbEntitiesSelectedSituated value: nil].
			self linkedSpaceInterface
				ifNotNil: [self updateFiguresSelectedOnSpaceInterface]]
]

{ #category : #'initialize-release' }
ManipulateInstances >> resizeWindowToMax [
	"set the window size to its max"
	
	| win orig ext |
	win := self builder window.
	orig := win globalOrigin.
	ext := 314 @ 257.	"ext := win bounds extent
		- (0 @ 257)."
	win displayBox: (orig extent: ext rounded).
	win
		display;
		refresh
]

{ #category : #'initialize-release' }
ManipulateInstances >> resizeWindowToMin [
	"set the window size to its min"
	
	| win orig ext |
	win := self builder window.
	orig := win globalOrigin.
	ext := 314 @ 208.
	win displayBox: (orig extent: ext rounded).
	win
		display;
		refresh
]

{ #category : #deprecated }
ManipulateInstances >> selectAllEntities [
	
	self entityClass
		ifNotNil:
			[self selectedEntities: self entitiesCollection.
			self nbEntitiesSelected value: self selectedEntities size.
			self isSituatedEntity
				ifTrue:
					[self nbEntitiesSelectedSituated
						value: (self selectedEntities select: [:a | a isSituated]) size]]
]

{ #category : #actions }
ManipulateInstances >> selectEntities [
	
	| collec |
	self entityClass ifNil: [^nil].
	(self entityClass findSelector: testElement value asSymbol) ifNil: [^nil].
	((testElement value asSymbol includes: $:) and: [testValue value isNil])
		ifTrue: [^nil].
	(testValue value isNil
		and:
			[(self entityClass methodsForTestingNoArg
				includes: testElement value asSymbol) not]) ifTrue: [^nil].	"(((testValue value isNil not) and:[(self entityClass findSelector: testElement value asSymbol) isNil not]) and:[operator value ~= '']) ifTrue:["
	collec := self getSelectedEntities.
	collec
		ifNil: [^nil]
		ifNotNil: [self selectedEntities: collec].
	self nbEntitiesSelected value: self selectedEntities size.
	self isSituatedEntity
		ifTrue:
			[self nbEntitiesSelectedSituated
				value: (self selectedEntities select: [:a | a isSituated]) size].
	self linkedSpaceInterface
		ifNotNil: [self updateFiguresSelectedOnSpaceInterface]
]

{ #category : #accessing }
ManipulateInstances >> selectedEntities [
	
	^selectedEntities ifNil: [selectedEntities := Set new]
]

{ #category : #accessing }
ManipulateInstances >> selectedEntities: anObject [
	
	selectedEntities := anObject
]

{ #category : #actions }
ManipulateInstances >> setAttributeValue [
	"set the new value on attributeToChange for all or subset of entities"
	
	| collec |
	(self entityClass isNil not
		and:
			[self attributeToChange value isNil not
				and: [self valueForAttribute value isNil not]]) ifFalse: [^nil].
	self selectedEntities isEmpty
		ifTrue: [collec := self entitiesCollection]
		ifFalse: [collec := self selectedEntities].	"storing for Undo"
	self linkedSpaceInterface isNil
		ifFalse: [self linkedSpaceInterface storeBeforeManipulation].	"performing new value"
	collec
		do:
			[:e | 
			e
				perform: (attributeToChange value , ':') asSymbol
				with: valueForAttribute value]
]

{ #category : #'actions while painting' }
ManipulateInstances >> setColorByPainting [
	
	| color |
	color := PovSetter colorChooser.
	color ifNil: [^nil].
	self initializeByPainting.
	self linkedSpaceInterface view manipulationAction: #coloring.
	self linkedSpaceInterface view
		manipulationActionArguments: (List with: color)
]

{ #category : #actions }
ManipulateInstances >> setColorOfEntities [
	
	| color collec aFig |
	self entityClass isNil not
		ifTrue:
			[self selectedEntities isEmpty
				ifTrue: [collec := self entitiesCollection]
				ifFalse: [collec := self selectedEntities].
			color := PovSetter colorChooser.
			color ifNil: [^nil].
			collec
				do:
					[:e | 
					aFig := self linkedSpaceInterface drawing components
						detect: [:fig | fig model entity = e]
						ifNone: [nil].
					aFig ifNotNil: [aFig fillColor: color]]]
]

{ #category : #'locate manually' }
ManipulateInstances >> startLocateManually [
	
	(self entityClass isNil not and: [self nbEntitiesToCreate value > 0])
		ifTrue:
			[(self builder namedComponents at: #createNentity) disable.
			self class
				entitiesToCreateForSpaceView:
					(Array
						with: self entityClass
						with: initMethod value)	"	self changeCursorToInstanceFigure."]
]

{ #category : #'locate manually' }
ManipulateInstances >> stopLocateManually [
	
	self class entitiesToCreateForSpaceView: nil.
	(self builder namedComponents at: #createNentity) enable
]

{ #category : #'actions while painting' }
ManipulateInstances >> stopPainting [
	"self linkedSpaceInterface enableAllTools."
	
	self linkedSpaceInterface
		activateToolNamed: self initialTool initialState name.
	self initialTool: nil.	"self linkedSpaceInterface currentTool initialize; selected; cursor: Cursor normal."
	self linkedSpaceInterface view stopClicToChangeAttribute.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v enable]].
	(self builder componentAt: #mainApplyButton) isVisible: true.
	(self builder componentAt: #stopPainting)
		disable;
		isVisible: false
]

{ #category : #aspects }
ManipulateInstances >> targetEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^targetEntities isNil
		ifTrue: [targetEntities := #allEntities asValue]
		ifFalse: [targetEntities]
]

{ #category : #'initialize-release' }
ManipulateInstances >> targetEntitiesChanged [
	
	(self builder componentAt: #mainApplyButton) isVisible
		ifFalse: [self stopPainting].
	self targetEntities value = #subsetEntities
		ifTrue:
			[self resizeWindowToMax.
			(self builder componentAt: #subsetCriteria) isVisible: true]
		ifFalse:
			[self resizeWindowToMin.
			(self builder componentAt: #subsetCriteria) isVisible: false.
			self resetSelection]
]

{ #category : #aspects }
ManipulateInstances >> testElement [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^testElement isNil
		ifTrue: [testElement := String new asValue]
		ifFalse: [testElement]
]

{ #category : #aspects }
ManipulateInstances >> testElementChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^testElementChoices isNil
		ifTrue: [testElementChoices := List new asValue]
		ifFalse: [testElementChoices]
]

{ #category : #aspects }
ManipulateInstances >> testValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^testValue isNil
		ifTrue: [testValue := nil asValue]
		ifFalse: [testValue]
]

{ #category : #aspects }
ManipulateInstances >> toBePerformed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^toBePerformed isNil
		ifTrue: [toBePerformed := #resetColor asValue]
		ifFalse: [toBePerformed]
]

{ #category : #'initialize-release' }
ManipulateInstances >> toBePerformedChanged [
	
	(self builder componentAt: #mainApplyButton) isVisible
		ifFalse: [self stopPainting].
	(self builder componentAt: #controlMethodChoices) disable.
	(self builder componentAt: #attributeToChangeChoices) disable.
	(self builder componentAt: #valueForAttribute) disable.
	self toBePerformed value = #execute
		ifTrue: [^(self builder componentAt: #controlMethodChoices) enable].
	self toBePerformed value = #setValue
		ifTrue:
			[(self builder componentAt: #valueForAttribute) enable.
			(self builder componentAt: #attributeToChangeChoices) enable]
]

{ #category : #'actions while painting' }
ManipulateInstances >> updateFiguresSelectedOnSpaceInterface [
	
	self linkedSpaceInterface drawing clearSelections.
	self linkedSpaceInterface drawing components
		do:
			[:fig | 
			fig model
				ifNotNil:
					[:m | 
					(self selectedEntities includes: m entity)
						ifTrue: [self linkedSpaceInterface drawing toggleSelection: fig]]]
]

{ #category : #'actions while painting' }
ManipulateInstances >> updateInstancesSelectionWith: collecOfInstances lastSelected: anInstance [
	
	self entityClass ~= anInstance class
		ifTrue: [self entity value: anInstance class name asString].
	self selectedEntities: collecOfInstances.
	self nbEntitiesSelected value: self selectedEntities size.
	self isSituatedEntity
		ifTrue:
			[self nbEntitiesSelectedSituated
				value: (self selectedEntities select: [:a | a isSituated]) size].
	self testElement value: 'id'.
	self operator value: '='.
	self testValue value: anInstance id
]

{ #category : #aspects }
ManipulateInstances >> valueForAttribute [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^valueForAttribute isNil
		ifTrue: [valueForAttribute := nil asValue]
		ifFalse: [valueForAttribute]
]
