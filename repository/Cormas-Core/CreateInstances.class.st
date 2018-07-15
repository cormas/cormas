Class {
	#name : #CreateInstances,
	#superclass : #UIApplicationModel,
	#instVars : [
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
		'entitiesToCreateForSpaceView',
		'newArcInstance'
	],
	#classInstVars : [
		'timeTagForLocateManually',
		'entityClass'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #resources }
CreateInstances class >> createEntityIcon [
	
	^OpaqueImage
		figure: self createEntityIconImage
		shape: self createEntityIconMask
]

{ #category : #resources }
CreateInstances class >> createEntityIconImage [
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
CreateInstances class >> createEntityIconMask [
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
CreateInstances class >> entityClass [
	
	^entityClass
]

{ #category : #accessing }
CreateInstances class >> entityClass: anObject [
	
	entityClass := anObject
]

{ #category : #'instance creation' }
CreateInstances class >> openOnSpaceInterface: aSpaceInterface [
	
	| aWin |
	aWin := super new.
	aWin linkedSpaceInterface: aSpaceInterface.
	(aWin openOn: aSpaceInterface cormasModel)
		ifNotNil:
			[aSpaceInterface createInstancesController: aWin.
			aWin initialTool: aSpaceInterface currentTool.
			aSpaceInterface activateToolNamed: 'CreateEntity Tool']
		ifNil: [Dialog warn: 'No entities can be created']
]

{ #category : #accessing }
CreateInstances class >> timeTagForLocateManually [
	
	^timeTagForLocateManually
]

{ #category : #accessing }
CreateInstances class >> timeTagForLocateManually: anObject [
	
	timeTagForLocateManually := anObject
]

{ #category : #'interface specs' }
CreateInstances class >> winPatchesConstraints [
	"Tools.UIPainter new openOnClass: self andSelector: #winPatchesConstraints"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Patches constraints' 
			#min: #(Point 238 74) 
			#max: #(Point 238 74) 
			#bounds: #(Rectangle 719 449 957 523) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7798 7798 7798)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 165 43.0 224 65.0) 
				#name: #applyPatchesConstraints 
				#model: #applyPatchesConstraints 
				#label: 'Done' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 181 2 231 21) 
				#name: #att1Value 
				#model: #att1Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 135 2 180 21) 
				#name: #att1OpeChoices 
				#model: #att1Ope 
				#comboList: #att1OpeChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 18 2 134 21) 
				#name: #att1Choices 
				#model: #att1 
				#comboList: #att1Choices) #(LabelSpec 
				#layout: #(Point 4 1) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: '1-') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 181 21 231 40) 
				#name: #att2Value 
				#model: #att2Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 135 21 180 40) 
				#name: #att2OpeChoices 
				#model: #att2Ope 
				#comboList: #att2OpeChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 18 21 134 40) 
				#name: #att2Choices 
				#model: #att2 
				#comboList: #att2Choices) #(LabelSpec 
				#layout: #(Point 4 18) 
				#name: #Label3 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: '2-') 
				#style: #pixelDefault) #(CheckBoxSpec 
				#layout: #(Point 19 44) 
				#name: #CheckBox1 
				#model: #shouldBeEmptyPatches 
				#label: 'Should be empty'))))
]

{ #category : #'interface specs' }
CreateInstances class >> windowLocatedOnly [
	"Tools.UIPainter new openOnClass: self andSelector: #windowLocatedOnly"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Create instances' 
			#min: #(Point 271 148) 
			#max: #(Point 800 148) 
			#bounds: #(Rectangle 720 450 991 598) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7798 7798 7798)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(LayoutSizedOrigin -65 1.0 3 0 59 53) 
				#name: #Region1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(LayoutFrame 5 0 53 0 -2 1 145 0) 
				#name: #GroupBox1 
				#label: 'Create and initialize N instances') #(InputFieldSpec 
				#layout: #(Rectangle 106 25 133 42) 
				#name: #InputField5 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #nbExistingEntities 
				#tabable: false 
				#helpText: 'Number of entities already created' 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(ComboBoxSpec 
				#layout: #(LayoutFrame 49 0 85.0 0 -60 1 104.0 0) 
				#name: #initMethodChoices 
				#model: #initMethod 
				#helpText: 'If necessary, select an #initialization method' 
				#comboList: #initMethodChoices) #(InputFieldSpec 
				#layout: #(Rectangle 8 85.0 46 104.0) 
				#name: #nbEntitiesToCreate 
				#model: #nbEntitiesToCreate 
				#helpText: #(UserMessage 
					#key: #writeNumberEntities 
					#defaultString: 'write the number of Entities to create  or a letter for undetermine number') 
				#alignment: #right 
				#type: #text) #(LabelSpec 
				#layout: #(Point 3 3) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Entity' 
				#style: #systemDefault) #(ComboBoxSpec 
				#layout: #(LayoutFrame 43 0 6 0 -68 1 25 0) 
				#name: #entityChoices 
				#model: #entity 
				#tabable: true 
				#helpText: 'Select a Class to be instanciated' 
				#comboList: #entityChoices) #(LabelSpec 
				#layout: #(Point 6 65) 
				#name: #nbEntitiesToCreate 
				#label: 'Number') #(LabelSpec 
				#layout: #(Point 52 65) 
				#name: #textInitMethodChoices 
				#label: 'Initialization method') #(RadioButtonSpec 
				#layout: #(Point 63 107) 
				#name: #locateCreatedEntities_Random 
				#model: #locateCreatedEntities 
				#label: 'randomly' 
				#select: #random) #(LabelSpec 
				#layout: #(Point 5 105) 
				#name: #LabelLocate1 
				#label: 'Locate' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 63 123) 
				#name: #locateCreatedEntities_SpaceView 
				#model: #locateCreatedEntities 
				#label: 'manually' 
				#select: #manually) #(RadioButtonSpec 
				#layout: #(Point 135 107) 
				#name: #locateCreatedEntities_Constrained 
				#model: #locateCreatedEntities 
				#label: 'constrained' 
				#select: #constrained) #(LabelSpec 
				#layout: #(Point 5 120) 
				#name: #LabelLocate2 
				#label: 'instances' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 7 23) 
				#name: #Label1 
				#label: '(number of entities') #(LabelSpec 
				#layout: #(Point 126 23) 
				#name: #Label2 
				#label: ' )') #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin -66 1.0 2 0 62 57) 
				#name: #entityImage 
				#component: #entityImage) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 82 0) 
				#name: #stopCreateManually 
				#flags: 56 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #red) 
					#setBackgroundColor: #(ColorValue #yellow)) 
				#model: #stopLocateManually 
				#label: 'Stop' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 82 0) 
				#name: #createNentity 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #createNentity 
				#helpText: 'Create one entity (if located, then click on the grid)' 
				#label: 'Create' 
				#defaultable: true))))
]

{ #category : #'interface specs' }
CreateInstances class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Create instances' 
			#min: #(Point 265 152) 
			#max: #(Point 800 152) 
			#bounds: #(Rectangle 800 450 1065 602) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7798 7798 7798)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(RegionSpec 
				#layout: #(LayoutSizedOrigin -65 1.0 3 0 59 53) 
				#name: #Region1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #white) 
					#setBackgroundColor: #(ColorValue #white)) 
				#lineWidth: 1) #(GroupBoxSpec 
				#layout: #(LayoutFrame 3 0 54 0 -4 1 146 0) 
				#name: #GroupBox1 
				#label: 'Create and initialize N instances') #(InputFieldSpec 
				#layout: #(Rectangle 107 25 134 42) 
				#name: #InputField5 
				#flags: 0 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #nbExistingEntities 
				#tabable: false 
				#helpText: 'Number of entities already created' 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(ComboBoxSpec 
				#layout: #(LayoutFrame 49 0 87 0 -60 1 106 0) 
				#name: #initMethodChoices 
				#model: #initMethod 
				#helpText: 'If necessary, select an #initialization method' 
				#comboList: #initMethodChoices) #(InputFieldSpec 
				#layout: #(Rectangle 8 87.0 46 106.0) 
				#name: #nbEntitiesToCreate 
				#model: #nbEntitiesToCreate 
				#helpText: #(UserMessage 
					#key: #writeNumberEntities 
					#defaultString: 'write the number of Entities to create  or a letter for undetermine number') 
				#alignment: #right 
				#type: #text) #(LabelSpec 
				#layout: #(Point 3 3) 
				#name: #Label3 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 2048 2048 8191)) 
				#label: 'Entity' 
				#style: #systemDefault) #(ComboBoxSpec 
				#layout: #(LayoutFrame 43 0 6 0 -68 1 25 0) 
				#name: #entityChoices 
				#model: #entity 
				#tabable: true 
				#helpText: 'Select a Class to be instanciated' 
				#comboList: #entityChoices) #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 56 36) 
				#name: #LabelSituated 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#label: '(situated' 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 105.5 42 133.5 52) 
				#name: #nbExistingEntitiesSituated 
				#flags: 32 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915) 
					#setBackgroundColor: #(ColorValue 7700 7700 7700)) 
				#model: #nbExistingEntitiesSituated 
				#tabable: false 
				#alignment: #right 
				#isReadOnly: true 
				#type: #number) #(LabelSpec 
				#layout: #(Point 6 67) 
				#name: #nbEntitiesToCreate 
				#label: 'Number') #(LabelSpec 
				#layout: #(Point 52 67) 
				#name: #textInitMethodChoices 
				#label: 'Initialization method') #(RadioButtonSpec 
				#layout: #(Point 62 125) 
				#name: #locateCreatedEntities_No 
				#model: #locateCreatedEntities 
				#label: 'no' 
				#select: #no) #(RadioButtonSpec 
				#layout: #(Point 62 109) 
				#name: #locateCreatedEntities_Random 
				#model: #locateCreatedEntities 
				#label: 'randomly' 
				#select: #random) #(LabelSpec 
				#layout: #(Point 5 107) 
				#name: #LabelLocate1 
				#label: 'Locate' 
				#style: #small) #(RadioButtonSpec 
				#layout: #(Point 134 125) 
				#name: #locateCreatedEntities_SpaceView 
				#model: #locateCreatedEntities 
				#label: 'manually' 
				#select: #manually) #(RadioButtonSpec 
				#layout: #(Point 134 109) 
				#name: #locateCreatedEntities_Constrained 
				#model: #locateCreatedEntities 
				#label: 'constrained' 
				#select: #constrained) #(LabelSpec 
				#layout: #(Point 5 122) 
				#name: #LabelLocate2 
				#label: 'instances' 
				#style: #small) #(LabelSpec 
				#layout: #(Point 8 23) 
				#name: #Label1 
				#label: '(number of entities') #(LabelSpec 
				#layout: #(Point 127 23) 
				#name: #Label2 
				#label: ' )') #(LabelSpec 
				#properties: #(PropertyListDictionary #labelFromApplication false) 
				#layout: #(Point 127 35) 
				#name: #Label4 
				#flags: 32 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 4915 4915 4915)) 
				#label: ' )' 
				#style: #pixelDefault) #(ArbitraryComponentSpec 
				#layout: #(LayoutSizedOrigin -66 1.0 2 0 62 57) 
				#name: #entityImage 
				#component: #entityImage) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 82 0) 
				#name: #stopCreateManually 
				#flags: 56 
				#model: #stopLocateManually 
				#label: 'Stop' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutOrigin -58 1 84 0) 
				#name: #createNentity 
				#model: #createNentity 
				#helpText: 'Create one entity (if located, then click on the grid)' 
				#label: 'Create' 
				#defaultable: true))))
]

{ #category : #aspects }
CreateInstances >> attributeToChange [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributeToChange isNil
		ifTrue: [attributeToChange := String new asValue]
		ifFalse: [attributeToChange]
]

{ #category : #aspects }
CreateInstances >> attributeToChangeChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributeToChangeChoices isNil
		ifTrue: [attributeToChangeChoices := List new asValue]
		ifFalse: [attributeToChangeChoices]
]

{ #category : #'interact with spaceInterface' }
CreateInstances >> changeAttributeByPainting [
	
	self linkedSpaceInterface activeSpatialEntity notNil ifFalse: [self halt].	"self linkedSpaceInterface buttons view controller "
	self linkedSpaceInterface view
		clicToChangeAttribute: self attributeToChange value
		withValue: self valueForAttribute value.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v disable]].
	(self builder componentAt: #setAttributeValue) isVisible: false.
	(self builder componentAt: #stopPaintCellValue)
		enable;
		isVisible: true.
	self initialTool: self linkedSpaceInterface view controller currentTool.	"self linkedSpaceInterface disableAllTools."
	self linkedSpaceInterface activateToolNamed: 'ChangeAttribute Tool'
]

{ #category : #'initialize-release' }
CreateInstances >> changeEntity [
	
	| aList compo |
	nbExistingEntities value: self entitiesCollection size.
	compo := #(#LabelSituated #nbExistingEntitiesSituated #LabelLocate1 #LabelLocate2 #locateCreatedEntities_No #locateCreatedEntities_Random #locateCreatedEntities_SpaceView #locateCreatedEntities_Constrained #entityImage #Region1).
	self isSituatedEntity
		ifTrue:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compo refersToLiteral: k)
						ifTrue:
							[v
								enable;
								isVisible: true]].
			self nbExistingEntitiesSituated
				ifNotNil:
					[nbExistingEntitiesSituated
						value: (self entitiesCollection select: [:a | a isSituated]) size].
			entityImage
				figure: (self entityClass imageAtPov: self entityClass name) asFigure.
			entityImage invalidate.	"invalidate message will ask the view to update its display"
			self linkedSpaceInterface
				ifNotNil:
					[self nbEntitiesToCreate value: 'x' asText.
					self locateCreatedEntities value: #manually]
				ifNil:
					[self nbEntitiesToCreate value: '0' asText.
					self locateCreatedEntities value: #no.
					(self builder namedComponents at: #locateCreatedEntities_SpaceView)
						disable;
						isVisible: false]]
		ifFalse:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(compo refersToLiteral: k)
						ifTrue:
							[v
								disable;
								isVisible: false]].
			self nbExistingEntitiesSituated value: 0].
	aList := List with: ''.
	aList addAll: self entityClass methodsForInit.
	self initMethodChoices value: aList.
	initMethod value: nil	"self initMethod value isNil ifFalse:[(initMethodChoices value includes: initMethod value asSymbol) ifFalse:[initMethod value:nil]] "
]

{ #category : #aspects }
CreateInstances >> checkLocateManually [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^checkLocateManually isNil
		ifTrue: [checkLocateManually := false asValue]
		ifFalse: [checkLocateManually]
]

{ #category : #'initialize-release' }
CreateInstances >> closeWithSpaceInterface [
	
	self requestForWindowClose.
	self closeAndUnschedule
]

{ #category : #aspects }
CreateInstances >> controlMethod [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^controlMethod isNil
		ifTrue: [controlMethod := String new asValue]
		ifFalse: [controlMethod]
]

{ #category : #aspects }
CreateInstances >> controlMethodChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^controlMethodChoices isNil
		ifTrue: [controlMethodChoices := List new asValue]
		ifFalse: [controlMethodChoices]
]

{ #category : #accessing }
CreateInstances >> cormas [
	
	^Cormas current
]

{ #category : #accessing }
CreateInstances >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
CreateInstances >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : #'locate manually' }
CreateInstances >> createInstancesOnCell: aCell [
	
	| aClass aE |
	self isNbEntitiesToCreatePositive ifFalse: [^self stopLocateManually].
	aClass := self entity value asSymbol class.
	self reduceNbEntitiesToCreateBy: 1.
	aE := cormasModel newEntity: aClass.
	(initMethod value isNil or: [initMethod value = ''])
		ifFalse:
			[(initMethod value includes: $:)
				ifFalse: [aE perform: initMethod value asSymbol]
				ifTrue:
					[aE
						perform: initMethod value asSymbol
						with: (Cormas askUserArgumentsForMethod: initMethod value)]].
	aE isArcEntity
		ifTrue:
			[aE
				initFromCell: aCell
				toCell: aCell randomNeighbour]
		ifFalse:
			[aClass isObjectLocationClass
				ifTrue: [aE isMovedTo: aCell]
				ifFalse: [aE moveTo: aCell]].
	self isNbEntitiesToCreatePositive ifFalse: [self stopLocateManually].
	cormasModel updateEntities.
	self updateNbOfEntities
]

{ #category : #actions }
CreateInstances >> createNentity [
	"lors du click sur bouton Create"
	
	| nb args constrainedCells |
	nb := self numberEntitiesToCreate.
	nb
		ifNil:
			[(self locateCreatedEntities value = #no
				or:
					[self locateCreatedEntities value = #random
						or: [self locateCreatedEntities value = #constrained]])
				ifTrue:
					[^self cormas
						warn:
							(UserMessage defaultString: ' Please, define a number !  ' key:
									#defineNumber)]].
	(self entityClass isNil not and: [self isNbEntitiesToCreatePositive])
		ifFalse: [^nil].	"Storing the model state before modification"
	self linkedSpaceInterface isNil
		ifFalse: [self linkedSpaceInterface storeBeforeManipulation].	"On g√®re ici le cas de la cr√©ation d'instances non localis√© ou localis√© al√©atoirement"
	(initMethod value isNil or: [initMethod value = ''])
		ifTrue:
			[self locateCreatedEntities value = #no
				ifTrue:
					[cormasModel
						createN: nb
						entity: self entityClass].
			self locateCreatedEntities value = #random
				ifTrue:
					[(self entityClass inheritsFrom: AgentLocation)
						ifTrue:
							[cormasModel
								setRandomlyLocatedAgents: self entityClass
								n: nb].
					(self entityClass inheritsFrom: CMObjectLocation)
						ifTrue:
							[cormasModel
								setRandomlyLocatedObjects: self entityClass
								n: nb]].
			self locateCreatedEntities value = #constrained
				ifTrue:
					[constrainedCells := self requestConstraintsOnPatches.
					(constrainedCells isNil or: [constrainedCells isEmpty]) ifTrue: [^nil].
					(self entityClass inheritsFrom: AgentLocation)
						ifTrue:
							[(cormasModel
								createN: nb
								entity: self entityClass)
								do: [:e | e moveTo: (Cormas selectRandomlyFrom: constrainedCells)]].
					(self entityClass inheritsFrom: CMObjectLocation)
						ifTrue:
							[(cormasModel
								createN: nb
								entity: self entityClass)
								do:
									[:e | e isMovedTo: (Cormas selectRandomlyFrom: constrainedCells)]]]]
		ifFalse:
			[self locateCreatedEntities value = #no
				ifTrue:
					[(initMethod value includes: $:)
						ifFalse:
							[cormasModel
								createN: nb
								entity: self entityClass
								initMethod: initMethod value asSymbol]
						ifTrue:
							[args := Cormas askUserArgumentsForMethod: initMethod value.
							args ifNil: [^nil].
							cormasModel
								createN: nb
								entity: self entityClass
								initMethod: initMethod value asSymbol
								arguments: args]].
			self locateCreatedEntities value = #random
				ifTrue:
					[(initMethod value includes: $:)
						ifFalse:
							[(self entityClass inheritsFrom: AgentLocation)
								ifTrue:
									[cormasModel
										setRandomlyLocatedAgents: self entityClass
										n: nb
										initMethod: initMethod value asSymbol].
							(self entityClass inheritsFrom: CMObjectLocation)
								ifTrue:
									[cormasModel
										setRandomlyLocatedObjects: self entityClass
										n: nb
										initMethod: initMethod value asSymbol]]
						ifTrue:
							[cormasModel
								setRandomlyLocatedAgents: self entityClass
								n: nb
								initMethod: initMethod value asSymbol
								arguments: (Cormas askUserArgumentsForMethod: initMethod value)]].
			self locateCreatedEntities value = #constrained
				ifTrue:
					[constrainedCells := self requestConstraintsOnPatches.
					(constrainedCells isNil or: [constrainedCells isEmpty]) ifTrue: [^nil].
					(initMethod value includes: $:)
						ifFalse:
							[(self entityClass inheritsFrom: AgentLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol)
										do:
											[:e | e moveTo: (Cormas selectRandomlyFrom: constrainedCells)]].
							(self entityClass inheritsFrom: CMObjectLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol)
										do:
											[:e | e isMovedTo: (Cormas selectRandomlyFrom: constrainedCells)]]]
						ifTrue:
							[(self entityClass inheritsFrom: AgentLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol
										arguments: (Cormas askUserArgumentsForMethod: initMethod value))
										do:
											[:e | e moveTo: (Cormas selectRandomlyFrom: constrainedCells)]].
							(self entityClass inheritsFrom: CMObjectLocation)
								ifTrue:
									[(cormasModel
										createN: nb
										entity: self entityClass
										initMethod: initMethod value asSymbol
										arguments: (Cormas askUserArgumentsForMethod: initMethod value))
										do:
											[:e | e isMovedTo: (Cormas selectRandomlyFrom: constrainedCells)]]]]].	"On g√®re ici le cas de la cr√©ation d'instances  localis√© manuellement"
	self locateCreatedEntities value = #manually
		ifTrue: [self startLocateManually].	"enfin on met √† jour les compteurs du nombre d''entit√©s"
	self updateNbOfEntities
]

{ #category : #'locate manually' }
CreateInstances >> createStartArcEntityOn: aStartCell [
	
	| aClass initNode |
	self isNbEntitiesToCreatePositive ifFalse: [^self stopLocateManually].
	aClass := self entity value asSymbol class
	self reduceNbEntitiesToCreateBy: 1.
	newArcInstance := cormasModel newEntity: aClass.
	(initMethod value isNil or: [initMethod value = ''])
		ifFalse:
			[(initMethod value includes: $:)
				ifFalse: [newArcInstance perform: initMethod value asSymbol]
				ifTrue:
					[newArcInstance
						perform: initMethod value asSymbol
						with: (Cormas askUserArgumentsForMethod: initMethod value)]].
	initNode := newArcInstance newEntity: newArcInstance startNodeType.
	initNode isMovedTo: aStartCell.
	newArcInstance startNode: initNode.
	initNode checkToReplaceNode	"must be repeated when creating an arc from a place where others nodes already exist "
]

{ #category : #'locate manually' }
CreateInstances >> createStopArcEntityOn: aStopCell [
	
	| stopNode |
	stopNode := newArcInstance newEntity: newArcInstance stopNodeType.
	newArcInstance stopNode: stopNode.
	stopNode isMovedTo: aStopCell.
	newArcInstance
		isMovedFrom: newArcInstance startNode patch
		to: aStopCell.
	self isNbEntitiesToCreatePositive ifFalse: [self stopLocateManually].
	cormasModel updateEntities
]

{ #category : #accessing }
CreateInstances >> entitiesCollection [
	
	self entityClass isAbstract
		ifFalse: [^cormasModel theEntities: self entityClass]
		ifTrue: [^cormasModel allTheEntities: self entityClass]
]

{ #category : #accessing }
CreateInstances >> entitiesToCreateForSpaceView [
	
	^entitiesToCreateForSpaceView
]

{ #category : #accessing }
CreateInstances >> entitiesToCreateForSpaceView: anObject [
	
	entitiesToCreateForSpaceView := anObject
]

{ #category : #aspects }
CreateInstances >> entity [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^entity isNil
		ifTrue: [entity := String new asValue]
		ifFalse: [entity]
]

{ #category : #aspects }
CreateInstances >> entityChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^entityChoices isNil
		ifTrue: [entityChoices := List new asValue]
		ifFalse: [entityChoices]
]

{ #category : #accessing }
CreateInstances >> entityClass [
	
	self class entityClass: (self entityName class).
	^self class entityClass
]

{ #category : #aspects }
CreateInstances >> entityImage [
	"self entityClass ifNil:[^nil]."
	
	^entityImage
		ifNil:
			[entityImage := EntityPOVView new	" model: (self entityClass defaultImage)"]
]

{ #category : #accessing }
CreateInstances >> entityName [
	
	^self entity value copyUpTo: $+
]

{ #category : #actions }
CreateInstances >> getSelectedEntities [
	
	((((testValue value = true or: [testValue value = false])
		or: [testValue value isSymbol]) or: [testValue value isString])
		or:
			[self entityClass methodsForTesting includes: testElement value asSymbol])
		ifTrue: [operator value ~= '=' ifTrue: [^nil]].
	^self entitiesCollection
		select:
			[:e | 
			(e perform: testElement value asSymbol)
				perform: operator value asSymbol
				with: testValue value	"Cormas valueOfValueInString: "]
]

{ #category : #aspects }
CreateInstances >> initMethod [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^initMethod isNil
		ifTrue: [initMethod := String new asValue]
		ifFalse: [initMethod]
]

{ #category : #aspects }
CreateInstances >> initMethodChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^initMethodChoices isNil
		ifTrue: [initMethodChoices := List new asValue]
		ifFalse: [initMethodChoices]
]

{ #category : #accessing }
CreateInstances >> initialTool [
	
	^initialTool
]

{ #category : #accessing }
CreateInstances >> initialTool: anObject [
	
	initialTool := anObject
]

{ #category : #actions }
CreateInstances >> inspectSelectedEntities [
	"This stub method was generated by UIDefiner"
	
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
CreateInstances >> isCompoundSpatialEntity [
	
	^cormasModel compoundSpatialClasses includes: self entityClass
]

{ #category : #'locate manually' }
CreateInstances >> isCreatingInstancesManuallyLocated [
	
	^(self builder namedComponents at: #createNentity) isVisible not
]

{ #category : #testing }
CreateInstances >> isNbEntitiesToCreatePositive [
	
	self numberEntitiesToCreate isNil ifTrue: [^true].
	^self numberEntitiesToCreate > 0
]

{ #category : #testing }
CreateInstances >> isSituatedEntity [
	
	^self entityClass isSituatedClass
]

{ #category : #testing }
CreateInstances >> isSpatialEntity [
	
	^self entityClass isSpatialClass
]

{ #category : #accessing }
CreateInstances >> linkedSpaceInterface [
	
	^linkedSpaceInterface
]

{ #category : #accessing }
CreateInstances >> linkedSpaceInterface: anObject [
	
	linkedSpaceInterface := anObject
]

{ #category : #aspects }
CreateInstances >> locateCreatedEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^locateCreatedEntities isNil
		ifTrue: [locateCreatedEntities := #manually asValue]
		ifFalse: [locateCreatedEntities]
]

{ #category : #accessing }
CreateInstances >> locateCreatedEntitiesOption [
	
	self locateCreatedEntities value = #locateCreatedEntities_Rand
		ifTrue: [^#random].
	self locateCreatedEntities value = #locateCreatedEntities_No
		ifTrue: [^#no].
	self locateCreatedEntities value = #locateCreatedEntities_Contrained
		ifTrue: [^#contrained].
	self locateCreatedEntities value = #locateCreatedEntities_SpaceView
		ifTrue: [^#manually]
]

{ #category : #aspects }
CreateInstances >> nbEntitiesSelected [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbEntitiesSelected isNil
		ifTrue: [nbEntitiesSelected := nil asValue]
		ifFalse: [nbEntitiesSelected]
]

{ #category : #aspects }
CreateInstances >> nbEntitiesSelectedSituated [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbEntitiesSelectedSituated isNil
		ifTrue: [nbEntitiesSelectedSituated := nil asValue]
		ifFalse: [nbEntitiesSelectedSituated]
]

{ #category : #aspects }
CreateInstances >> nbEntitiesToCreate [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbEntitiesToCreate isNil
		ifTrue: [nbEntitiesToCreate := 'x' asValue]
		ifFalse: [nbEntitiesToCreate]
]

{ #category : #aspects }
CreateInstances >> nbExistingEntities [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbExistingEntities isNil
		ifTrue: [nbExistingEntities := 0 asValue]
		ifFalse: [nbExistingEntities]
]

{ #category : #aspects }
CreateInstances >> nbExistingEntitiesSituated [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^nbExistingEntitiesSituated isNil
		ifTrue: [nbExistingEntitiesSituated := 0 asValue]
		ifFalse: [nbExistingEntitiesSituated]
]

{ #category : #accessing }
CreateInstances >> newArcInstance [
	
	^newArcInstance
]

{ #category : #accessing }
CreateInstances >> newArcInstance: anObject [
	
	newArcInstance := anObject
]

{ #category : #accessing }
CreateInstances >> numberEntitiesToCreate [
	"return a number or nil if nbEntitiesToCreate value is not a number"
	
	| result |
	result := self nbEntitiesToCreate value asNumber.
	result = 0
		ifTrue:
			[self nbEntitiesToCreate value string = '0' ifFalse: [result := nil]].
	^result
]

{ #category : #'initialize-release' }
CreateInstances >> openOn: aModel [
	
	cormasModel := aModel.
	self prepareClasses ifNil: [^nil].
	self linkedSpaceInterface
		ifNotNil:
			[builder := self allButOpenInterface: #windowLocatedOnly.
			entityChoices value isEmpty
				ifFalse: [self entity setValue: entityChoices value first].
			builder window
				label:
					builder window label , ' >View '
						,
							(self linkedSpaceInterface view class allInstances
								indexOf: self linkedSpaceInterface view) printString.
			self linkedSpaceInterface manipInstancesController
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
									self linkedSpaceInterface manipInstancesController builder window)]]
		ifNil:
			[builder := self allButOpenInterface: #windowSpec.
			self entity value: entityChoices value first.
			builder window open].
	self changeEntity
]

{ #category : #aspects }
CreateInstances >> operator [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^operator isNil
		ifTrue: [operator := String new asValue]
		ifFalse: [operator]
]

{ #category : #aspects }
CreateInstances >> operatorChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^operatorChoices isNil
		ifTrue: [operatorChoices := List new asValue]
		ifFalse: [operatorChoices]
]

{ #category : #'initialize-release' }
CreateInstances >> prepareClasses [
	
	| modelClasses |
	(self linkedSpaceInterface isNil not
		and: [self linkedSpaceInterface siConfig isNil not])
		ifTrue:
			[modelClasses := self linkedSpaceInterface siConfig createEntitiesList list
				collect: [:cl | cl name]]
		ifFalse:
			[modelClasses := SortedCollection new.
			modelClasses
				addAll:
					((cormasModel class socialClasses
						select: [:c | c isAbstract not and: [c isSituatedClass]])
						collect: [:cl | cl name]).
			modelClasses
				addAll:
					((cormasModel class passiveObjectClasses
						select: [:c | c isAbstract not and: [c isSituatedClass]])
						collect: [:cl | cl name])].
	modelClasses isEmpty
		ifTrue: [^nil]
		ifFalse: [entity := modelClasses first asValue].
	entityChoices := (List withAll: modelClasses) asValue.
	self entity onChangeSend: #changeEntity to: self
]

{ #category : #accessing }
CreateInstances >> reduceNbEntitiesToCreateBy: aNumber [
	"return a number or nil if nbEntitiesToCreate value is not a number"
	
	| result |
	result := self numberEntitiesToCreate.
	result ifNil: [^nil].
	self nbEntitiesToCreate value: (result - aNumber) asString
]

{ #category : #actions }
CreateInstances >> requestConstraintsOnPatches [
	"open a Patch selection window 
and return a collec of pacthes "
	
	| dialog |
	dialog := PatchConstraintDialog new.
	dialog cells: self cormasModel theESE.
	dialog open.
	^dialog selectedCells
]

{ #category : #'initialize-release' }
CreateInstances >> requestForWindowClose [
	
	cormasModel := nil.
	self linkedSpaceInterface
		ifNotNil: [self linkedSpaceInterface createInstancesController: nil].
	^super requestForWindowClose
]

{ #category : #accessing }
CreateInstances >> selectedEntities [
	
	^selectedEntities ifNil: [selectedEntities := Set new]
]

{ #category : #accessing }
CreateInstances >> selectedEntities: anObject [
	
	selectedEntities := anObject
]

{ #category : #'locate manually' }
CreateInstances >> startLocateManually [
	
	(self entityClass isNil not and: [self isNbEntitiesToCreatePositive])
		ifTrue:
			[self builder namedComponents
				keysAndValuesDo:
					[:k :v | 
					(#(#entityChoices #createNentity #locateCreatedEntities_No #locateCreatedEntities_Random #locateCreatedEntities_SpaceView #locateCreatedEntities_Constrained)
						refersToLiteral: k) ifTrue: [v disable]].
			(self builder namedComponents at: #createNentity) beInvisible.
			(self builder namedComponents at: #stopCreateManually) beVisible.
			(self builder namedComponents at: #stopCreateManually) enable].
	self initialTool: self linkedSpaceInterface currentTool.	"self linkedSpaceInterface disableAllTools."
	self linkedSpaceInterface activateCreateEntityTool
]

{ #category : #'locate manually' }
CreateInstances >> stopLocateManually [
	
	self reduceNbEntitiesToCreateBy: self numberEntitiesToCreate.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #createNentity #locateCreatedEntities_No #locateCreatedEntities_Random #locateCreatedEntities_SpaceView #locateCreatedEntities_Constrained)
				refersToLiteral: k) ifTrue: [v enable]].
	(self builder namedComponents at: #stopCreateManually) beInvisible.
	(self builder namedComponents at: #stopCreateManually) disable.
	(self builder namedComponents at: #createNentity) beVisible.
	(self linkedSpaceInterface currentTool)
		initialize;
		selected;
		cursor: Cursor normal
]

{ #category : #'interact with spaceInterface' }
CreateInstances >> stopPaintCellValue [
	
	self linkedSpaceInterface enableAllTools.
	self linkedSpaceInterface
		activateToolNamed: self initialTool initialState name.
	self initialTool: nil.
	self linkedSpaceInterface view stopClicToChangeAttribute.
	self builder namedComponents
		keysAndValuesDo:
			[:k :v | 
			(#(#entityChoices #controlMethodChoices #executeMethodOnEntities #attributeToChangeChoices #valueForAttribute #setAttributeValue #inspectSelectedEntities #setColorOfEntities #resetSelection #testElementChoices #operatorChoices #testValue #selectEntities #addToEntitiesSelection #removeFromEntitiesSelection)
				refersToLiteral: k) ifTrue: [v enable]].
	(self builder componentAt: #setAttributeValue) isVisible: true.
	(self builder componentAt: #stopPaintCellValue)
		disable;
		isVisible: false
]

{ #category : #aspects }
CreateInstances >> testElement [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^testElement isNil
		ifTrue: [testElement := String new asValue]
		ifFalse: [testElement]
]

{ #category : #aspects }
CreateInstances >> testElementChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^testElementChoices isNil
		ifTrue: [testElementChoices := List new asValue]
		ifFalse: [testElementChoices]
]

{ #category : #aspects }
CreateInstances >> testValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^testValue isNil
		ifTrue: [testValue := nil asValue]
		ifFalse: [testValue]
]

{ #category : #'interact with spaceInterface' }
CreateInstances >> updateFiguresSelectedOnSpaceInterface [
	
	self linkedSpaceInterface drawing clearSelections.
	self linkedSpaceInterface drawing components
		do:
			[:fig | 
			(self selectedEntities includes: fig model entity)
				ifTrue: [self linkedSpaceInterface drawing toggleSelection: fig]]
]

{ #category : #'interact with spaceInterface' }
CreateInstances >> updateInstancesSelectionWith: collecOfInstances lastSelected: anInstance [
	
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

{ #category : #actions }
CreateInstances >> updateNbOfEntities [
	
	nbExistingEntities value: self entitiesCollection size.
	(self isSituatedEntity and: [nbExistingEntitiesSituated isNil not])
		ifTrue:
			[nbExistingEntitiesSituated
				value: (self entitiesCollection select: [:a | a isSituated]) size]
]

{ #category : #aspects }
CreateInstances >> valueForAttribute [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^valueForAttribute isNil
		ifTrue: [valueForAttribute := nil asValue]
		ifFalse: [valueForAttribute]
]
