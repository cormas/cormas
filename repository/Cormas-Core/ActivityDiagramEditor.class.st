"
ActivityDiagramEditor is a graphic editor that allows to create activity diagrams for the Cormas entities.

Instance Variables:
	name	<String>	name of activity diagram and also name of the method that will be performed
	targetClass	<Entity>	targetClass where the method will be installed and executed


"
Class {
	#name : #ActivityDiagramEditor,
	#superclass : #Object,
	#instVars : [
		'targetClass',
		'name',
		'cormasModel',
		'option',
		'location'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'interface specs' }
ActivityDiagramEditor class >> activityChooser [
	"Tools.UIPainter new openOnClass: self andSelector: #activityChooser"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: ' ' 
			#min: #(Point 40 20) 
			#bounds: #(Rectangle 720 450 916 677) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(LayoutFrame 0 0 0 0.00440529 0 0.989796 0 0.814978) 
				#name: #list 
				#flags: 15 
				#model: #list 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #doubleClick) 
				#selectionType: #highlight) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.0918367 0 0.85022 0 0.357143 0 0.960352) 
				#name: #ok 
				#model: #doAccept 
				#label: #(UserMessage 
					#key: #OK 
					#defaultString: 'OK' 
					#catalogID: #labels) 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(LayoutFrame 0 0.642857 0 0.85022 0 0.908163 0 0.960352) 
				#name: #cancel 
				#model: #closeCancel 
				#label: #(UserMessage 
					#key: #Cancel 
					#defaultString: 'Cancel' 
					#catalogID: #labels) 
				#defaultable: true))))
]

{ #category : #resources }
ActivityDiagramEditor class >> activityIcon [
	
	^OpaqueImage
		figure: self activityIconImage
		shape: self activityIconMask
]

{ #category : #resources }
ActivityDiagramEditor class >> activityIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #activityIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 64 @ 24
				depth: 6
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 3276 2441)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 2344 1863)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1413 1316)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1124 995)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4015 3918)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 6360 4753)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 1734 1445)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1573 1316)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4593 4529 4497)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 1959 1606)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1316 1124)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(256 224 192)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1188 1124)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2473 2344)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5043 4978)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1702 1606)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3340 2730 2120)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2152 1734)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 5524 4143)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6552 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 3340 2601)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3115 2344)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1156 1027)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 5107 3822)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 2923 2248)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'A@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD@!H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"F"TLA@PDA@PDC X]@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@RDKAQLDA@PDB <HG1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G18#E PDAA$$G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_F0$DA@PTBA<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G0D"A@PD@A<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<AH PDA@@_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_@RHDA@P@G1<_G1<_G1<_G1<_G1<_G1<_@A<_G1<_G1<_G1<@G1<_G1<_@A<_G1<_G1<_G1<_G1<_G1<_G1<_G0D"A@PD@A<_G1<_G1<_G1<_G1<_G1<_@A<@G1<_G1<_@A<_G1<_G1<_G1<_@A<_G1<_G1<_G1<_G1<_G1<_G1<AH PDA@@_G1<_G1<_G1<_G1<_G1<_G0@_@A<_@@@_@@@@G0@@G1<_@A<@@@@@@A<_G0@_G1<_G1<_G1<_G1<_@RHDA@P@G1<_G1<_G1<_G1<_G1<_G0@_G1<@@A<_@A<@G1<@G0@_@A<_@A<@G1<@G0@_G1<_G1<_G1<_G1<_G0D"A@PD@A<_G1<_G1<_G1<_G1<_G1<@@@@@@@@_G1<_@A<_@A<@G0@_G0@_@A<_@A<@G1<_G1<_G1<_G1<_G1<AH PDA@@_G1<_G1<_G1<_G1<_G1<_@A<_G0@@G1<@G0@_G0@_@A<@G1<@G0@_G0@_@A<_G1<_G1<_G1<_G1<_@RHDA@P@G1<_G1<_G1<_G1<_G1<_@A<_G1<_@@@@G1<@@A<@G1<@G1<_@A<@@A<_@A<_G1<_G1<_G1<_G1<_G0D"A@PD@A<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G0@_G1<_G1<_G1<_G1<_G1<AH PDA@@_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G0@_G1<_G1<_G1<_G1<_G1<_@RHDA@P@G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G0D"A@PDEQ8_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<&C PDA@\ G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<_G1<HCQLDA@PLE0LA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDADQ DA@PDA@P\H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H"H!LDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PDA@PD'))
]

{ #category : #resources }
ActivityDiagramEditor class >> activityIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #activityIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 64 @ 24
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 15 255 255 255 255 255 255 248 31 255 255 255 255 255 255 252 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 254 63 255 255 255 255 255 255 252 15 255 255 255 255 255 255 248 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
ActivityDiagramEditor class >> bringToFrontIcon [
	
	^OpaqueImage
		figure: self bringToFrontIconImage
		shape: self bringToFrontIconMask
]

{ #category : #resources }
ActivityDiagramEditor class >> bringToFrontIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bringToFrontIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 26
				depth: 4
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1220 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6552 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6006 7195 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 417 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(385 449 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'QDQDQDQDQDQDQDQDQ@@@@D @@@@@@HQDQDQDQDP@@@A@L3L3L3LDQDQDQDQD@@@@PCL3L3L3ADQDQDQDQ@@@@D@3L3L3L0QDQDQDQDP@@@A@L3L3L3LDQDQDQDQD@@@@PCL1@@@@@@@@@HQDQ@@@@D@3LBH"H"H"H"HDQDP@@@A@L3@"H"H"H"H"ADQD@@@@PCL0H"H"H"H"H QDQ@@@@D@3LBH"H"H"H"HDQDP@@@A@L3@"H"H"H"H"ADQD@@@@PCL0H"H"H"H"H QDQ@@@@DT@@BH"H"H"H"H@@HP@@@ADQD@"H"H"H"H"@3LD@@@@QDQ@H"H"H"H"H L3A@@@@DQDPBH"H"H"H"HCL0P@@@ADQD@"H"H"H"H"@3LD@@@@QDQ@H"H"H"H"H L3A@@@@DQDPBH"H"H"H"HCL0P@@@ADQDX@@@@@@@@@\3LD@@@@QDQDQDQDPCL3L3L3A@@@@DQDQDQDQD@3L3L3L0P@@@ADQDQDQDQ@L3L3L3LD@@@@QDQDQDQDQP@@@@@@U@@@@DQDQDQDQDQDQDQDQDP@@@@b'))
]

{ #category : #resources }
ActivityDiagramEditor class >> bringToFrontIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #bringToFrontIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 26
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 127 248 0 0 127 248 0 0 127 248 0 0 127 248 0 0 127 248 0 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 0 7 255 128 0 7 255 128 0 7 255 128 0 7 255 128 0 0 0 0])
]

{ #category : #resources }
ActivityDiagramEditor class >> conditionIcon [
	
	^OpaqueImage
		figure: self conditionIconImage
		shape: self conditionIconMask
]

{ #category : #resources }
ActivityDiagramEditor class >> conditionIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #conditionIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 28 @ 27
				depth: 5
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5621 160)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1413)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2569 1830)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 3083 2505)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6906 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 256)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2569 1991)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5107 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1284)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 3822)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1060)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 1027)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 192)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DD@P@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAP$EA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@DAQPNE@TD@@@@@@@@@@@@@@@@@@@@@@@@@@@DAQPNC 8T@0(@@@@@@@@@@@@@@@@@@@@@@@@DAQPNC 8NC ,OB @@@@@@@@@@@@@@@@@@@@@DAQPNC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@@DAQPNC 8NC 8NC 8HC0(@@@@@@@@@@@@@@@@@A 4NC 8NC 8NC 8NC  OB @@@@@@@@@@@@@@A 4NC 8NC 8NC 8NC 8NB@<J@@@@@@@@@@@@A 4NC 8NC 8NC 8NC 8NC 8HDQH@@@@@@@@@A 4NC 8NC 8NC 8NC 8NC 8NC \SD @@@@@@A 4NC 8NC 8NC 8NC 8NC 8NC 8N@!LR@@@@A 4NC 8NC 8NC 8NC 8NC 8NC 8NC 8BD1H@A@TTC 8NC 8NC 8NC 8NC 8NC 8NC 8NE@TD@@@DAQPNC 8NC 8NC 8NC 8NC 8NC 8NE@TD@@@@@@PEE@8NC 8NC 8NC 8NC 8NC 8NE@TD@@@@@@@@A@TAC 8NC 8NC 8NC 8NC 8NE@TD@@@@@@@@@@@DC@4NC 8NC 8NC 8NC 8NB@<J@@@@@@@@@@@@@@@FCP8NC 8NC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@XMC 8NC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@@@A 4NC 8NC 8NB@<J@@@@@@@@@@@@@@@@@@@@@@@FCP8NC 8NB@<J@@@@@@@@@@@@@@@@@@@@@@@@@@XMC 8NB@<J@@@@@@@@@@@@@@@@@@@@@@@@@@@@A 4NB@<J@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@FBP<J@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@A@J@@@@@@@@@@@@@@@@'))
]

{ #category : #resources }
ActivityDiagramEditor class >> conditionIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #conditionIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 28 @ 27
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 7 0 0 0 15 128 0 0 31 192 0 0 63 224 0 0 127 240 0 0 255 248 0 1 255 252 0 1 255 254 0 3 255 255 0 7 255 255 128 15 255 255 192 31 255 255 224 63 255 255 240 127 255 255 240 63 255 255 224 31 255 255 192 15 255 255 128 7 255 255 0 1 255 254 0 0 255 252 0 0 127 248 0 0 63 240 0 0 31 224 0 0 15 192 0 0 7 128 0 0 3 0 0])
]

{ #category : #resources }
ActivityDiagramEditor class >> deleteIconImage [
	"UIMaskEditor new openOnClass: self andSelector: #hotPaintEraseImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							((Array new: 5)
								at: 1
									put: ColorValue black;
								at: 2
									put:
										(ColorValue
											red: 3 / 4
											green: 3 / 4
											blue: 0);
								at: 3
									put: ColorValue yellow;
								at: 4
									put: ColorValue white;
								at: 5
									put:
										(ColorValue
											red: 3 / 4
											green: 3 / 4
											blue: 3 / 4);
								yourself))
				usingBits:
					#[51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 48 0 0 3 51 51 51 51 3 35 35 32 51 51 51 48 50 50 50 0 51 51 51 3 35 35 32 16 51 51 48 50 50 50 1 16 51 51 3 35 35 32 17 3 51 48 50 50 50 1 16 51 51 4 68 68 64 17 3 51 51 4 68 68 64 16 51 51 51 4 68 68 64 3 51 51 51 48 0 0 0 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51])
]

{ #category : #resources }
ActivityDiagramEditor class >> deleteIconMask [
	"UIMaskEditor new openOnClass: self andSelector: #hotPaintEraseMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 126 0 0 0 255 0 0 1 255 0 0 3 255 0 0 7 255 0 0 15 254 0 0 31 252 0 0 63 248 0 0 63 240 0 0 63 224 0 0 31 192 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
ActivityDiagramEditor class >> endIcon [
	
	^OpaqueImage
		figure: self endIconImage
		shape: self endIconMask
]

{ #category : #resources }
ActivityDiagramEditor class >> endIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #endIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 25
				depth: 6
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 2826 2826)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 4946 4946)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1798 1798)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 835 835)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(770 770 770)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 3597 3597)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 1798 1798)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2569 2569)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 481 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3726 3726)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2569 2087 2087)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 449 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 610 610)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3340 321 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3340 3340 3340)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4593 4593 4593)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 578 578)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2312 2312 2312)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3501 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1284 1284 1284)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4079 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(256 256 256)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 3083 3083)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 1284 1284)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4336 4336 4336)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3083 481 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2055 2055 2055)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 224 224)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(770 417 417)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 449 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 224 224)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1027 1027 1027)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 3854 3854)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3854 353 353)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5107 5107 5107)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'LC@0LC@0LC@0LC@0LC@0LC@0LC@0LC@0LC@@@C@0LC@0LC@0LC@SOBLEO30CLC@0LC@0LC@0@@@0LC@0LC@0LB8FG#PMAR<4KQH<LC@0LC@0L@@@LC@0LC@0BA(AJ#@0LC@0LC@_MAHSLC@0LC@@@C@0LC@0O@XYLC@0LC@0LC@0LC@_F!$0LC@0@@@0LC@0OCPSLC@0M 0EE0TLI#@0LCXFBC@0L@@@LC@0M!(SLC@0J0(!ABHDHQ0BLC@0B@XSLC@@@C@0LA(YLC@SLS8,DA@PDA@GL0<SLC@#CS@0@@@0LA<RLC@0C2HPDA@PDA@PDA@;C3@0@0XYL@@@LC@4OC@0@#LPDA@PDA@PDA@PDCLBLC@2OS@@@C@CG L0@3\GDA@PDA@PDA@PDA@GM0L0BB$0@@@0OCP0LA$UDA@PDA@PDA@PDA@PDATYLC@-@0@@LB8ALC@QGQ@PDA@PDA@PDA@PDA@]DS@0JP @@C@?K3@0E" PDA@PDA@PDA@PDA@PA@T0L@X*@@@0G1H0LB88DA@PDA@PDA@PDA@PDC .LC@:M @@LA$ZLC@HF1@PDA@PDA@PDA@PDA@[BC@CKS@@@C@0B2X0L@$XDA@PDA@PDA@PDA@XBS@0CBT0@@@0LB<?LC@*EA@PDA@PDA@PDA@PEB(0LB@QL@@@LC@6JPL0LB\5DA@PDA@PDA@,GR\0LBX:@3@@@C@0LC42LC@0I1PXDA@PDA@NIB,0LC@/O3@0@@@0LC@CD 00LC@*BS$!ABD9LP 0LC@QHC@0L@@@LC@0LAL4G3@0LC@SC@TLD3@0LC@QIPL0LC@@@C@0LC@0D1HMI#@0LC@0LC@0LCXRHC@0LC@0@@@0LC@0LC@0H2$ G0L0LC@&O0D:G3@0LC@0L@@@LC@0LC@0LC@SDQH-@@@@B2<.LC@0LC@0LC@@@@@a'))
]

{ #category : #resources }
ActivityDiagramEditor class >> endIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #endIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 25
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 63 128 0 0 255 224 0 3 192 120 0 7 0 28 0 14 63 142 0 28 127 199 0 25 255 243 0 49 255 243 128 51 255 249 128 119 255 253 128 103 255 252 192 103 255 252 192 103 255 252 192 103 255 252 192 103 255 253 128 51 255 249 128 51 255 249 128 57 255 243 128 24 255 227 0 28 127 198 0 14 31 14 0 7 128 56 0 1 241 240 0 0 255 192 0])
]

{ #category : #'interface opening' }
ActivityDiagramEditor class >> forClass: anEntityClass [
	"Open an Editor interface to install the activity created as method of anEntityClass.
	Ex: ActivityDiagramEditor forClass:  CormasNS.Kernel.Entity  "
	
	| editor |
	editor := self new.
	editor targetClass: anEntityClass.
	editor open.
	editor setTitle.
	^editor
]

{ #category : #'interface opening' }
ActivityDiagramEditor class >> forClass: anEntityClass method: aMethodName [
	"Open an Editor interface to install the activity created as aMethodName of anEntityClass.
	Ex: ActivityDiagramEditor forClass:  CormasNS.Kernel.Entity  method: #bidon"
	
	| editor |
	editor := self forClass: anEntityClass.
	editor name: aMethodName.
	editor setTitle.
	^editor
]

{ #category : #resources }
ActivityDiagramEditor class >> hotPaintEraseIcon [
	
	^OpaqueImage
		figure: self hotPaintEraseImage
		shape: self hotPaintEraseMask
]

{ #category : #resources }
ActivityDiagramEditor class >> hotPaintEraseImage [
	"UIMaskEditor new openOnClass: self andSelector: #hotPaintEraseImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							((Array new: 5)
								at: 1
									put: ColorValue black;
								at: 2
									put:
										(ColorValue
											red: 3 / 4
											green: 3 / 4
											blue: 0);
								at: 3
									put: ColorValue yellow;
								at: 4
									put: ColorValue white;
								at: 5
									put:
										(ColorValue
											red: 3 / 4
											green: 3 / 4
											blue: 3 / 4);
								yourself))
				usingBits:
					#[51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 48 0 0 3 51 51 51 51 3 35 35 32 51 51 51 48 50 50 50 0 51 51 51 3 35 35 32 16 51 51 48 50 50 50 1 16 51 51 3 35 35 32 17 3 51 48 50 50 50 1 16 51 51 4 68 68 64 17 3 51 51 4 68 68 64 16 51 51 51 4 68 68 64 3 51 51 51 48 0 0 0 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51 51])
]

{ #category : #resources }
ActivityDiagramEditor class >> hotPaintEraseMask [
	"UIMaskEditor new openOnClass: self andSelector: #hotPaintEraseMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 16 @ 16
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 126 0 0 0 255 0 0 1 255 0 0 3 255 0 0 7 255 0 0 15 254 0 0 31 252 0 0 63 248 0 0 63 240 0 0 63 224 0 0 31 192 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #'instance creation' }
ActivityDiagramEditor class >> newWithActivities: activityFigures connections: transitionModels [
	"Create an Editor interface with the activity diagram from the activityFigures and the transitionModels. Do not display the editor"
	
	| transitionFigures editor figure fromFigure |
	editor := self new.
	editor drawing addAll: activityFigures.
	transitionFigures := OrderedCollection new.
	transitionModels
		do:
			[:aTransitionModel | 
			fromFigure := activityFigures
				detect: [:fig | fig id = aTransitionModel from id].
			figure := fromFigure
				connectFromPoint: aTransitionModel points first
				to: (activityFigures detect: [:fig | fig id = aTransitionModel to id])
				at: aTransitionModel points last.
			figure
				points: aTransitionModel points;
				recomputePreferredBounds.
			transitionFigures add: figure].
	editor drawing addAll: transitionFigures.
	^editor
]

{ #category : #'instance creation' }
ActivityDiagramEditor class >> newWithActivities: activityFigures connections: transitionModels forClass: destinationClass method: aMethodName [
	"Create an Editor interface with the activity diagram from the activityFigures and the transitionModels. Do not display the editor"
	"Set the attributes targetClass as destinationClass and name as aMethodName"
	
	| editor |
	editor := self newWithActivities: activityFigures connections:
			transitionModels.
	editor targetClass: destinationClass.
	editor name: aMethodName.
	^editor
]

{ #category : #'initialize-release' }
ActivityDiagramEditor class >> obsolete [
	
	[Tool reinitialize]
		on: Error
		do: [:ex | ex return: nil].
	super obsolete
]

{ #category : #'interface opening' }
ActivityDiagramEditor class >> open [
	
	^self new open
]

{ #category : #'instance creation' }
ActivityDiagramEditor class >> openWithActivities: activityFigures connections: transitionModels [
	"Open an Editor interface and display the activity diagram from the activityFigures and the transitionModels"
	
	| editor |
	editor := self newWithActivities: activityFigures connections:
			transitionModels.
	editor open.
	^editor
]

{ #category : #'instance creation' }
ActivityDiagramEditor class >> openWithActivities: activityFigures connections: transitionModels forClass: destinationClass [
	"Open an Editor interface and display the activity diagram from the activityFigures and the transitionModels.
	The activities created are installed on anEntityClass"
	
	| editor |
	editor := self openWithActivities: activityFigures connections:
			transitionModels.
	editor targetClass: destinationClass.
	editor setTitle.
	^editor
]

{ #category : #'instance creation' }
ActivityDiagramEditor class >> openWithActivities: activityFigures connections: transitionModels forClass: destinationClass method: aMethodName [
	"Open an Editor interface and display the activity diagram from the activityFigures and the transitionModels.
	The activities created are installed on anEntityClass as aMethodName"
	
	| editor |
	editor := self openWithActivities: activityFigures connections:
			transitionModels.
	editor targetClass: destinationClass.
	editor name: aMethodName.
	editor setTitle.
	^editor
]

{ #category : #'parcel load/unload/save' }
ActivityDiagramEditor class >> postLoadActionFor: aParcel [
	
	Tool reinitialize
]

{ #category : #resources }
ActivityDiagramEditor class >> sendToBackIcon [
	
	^OpaqueImage
		figure: self sendToBackIconImage
		shape: self sendToBackIconMask
]

{ #category : #resources }
ActivityDiagramEditor class >> sendToBackIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sendToBackIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 24
				depth: 4
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1220 931)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 6552 4914)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6006 7195 7291)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 513 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 417 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(385 449 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1124 1349 1381)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1541 1541)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'QDQDQDQDQDQDQDQDQ@@@@D$@@@@@BDQDQDQDQDP@@@A@L3L3L3ADQDQDQDQD@@@@PCL3L3L0QDQDQDQDQ@@@@D@3L3L3LDQDQDQDQDP@@@A@L3L3L3@@@@@@EDQD@@@@PCL3L3L0H"H"H QDQ@@@@D@3L3L3LBH"H"HDQDP@@@A@L3L3L3@"H"H"ADQD@@@@PCL3L3L0H"H"H QDQ@@@@D@3L3L3LBH"H"HDQDP@@@AE@@@@@@X"H"H"ADQD@@@@QDQ@H"H"H"H"H QDQ@@@@DQDPBH"H"HP@@@@@IP@@@ADQD@"H"H"@3L3L3LD@@@@QDQ@H"H"H L3L3L3A@@@@DQDPBH"H"HCL3L3L0P@@@ADQD@"H"H"@3L3L3LD@@@@QDQ@H"H"H L3L3L3A@@@@DQDPBH"H"HCL3L3L0P@@@ADQDT@@@@@@3L3L3LD@@@@QDQDQDQDQ@L3L3L3A@@@@DQDQDQDQDPCL3L3L0P@@@ADQDQDQDQDT@@@@@A4@@@@'))
]

{ #category : #resources }
ActivityDiagramEditor class >> sendToBackIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #sendToBackIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 26 @ 24
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 127 240 0 0 127 240 0 0 127 240 0 0 127 240 0 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 127 255 248 0 7 255 248 0 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 7 255 255 128 0 3 255 128 0 3 255 128 0 3 255 128])
]

{ #category : #resources }
ActivityDiagramEditor class >> startDotIcon [
	
	^OpaqueImage
		figure: self startIconImage
		shape: self startIconMask
]

{ #category : #resources }
ActivityDiagramEditor class >> startIcon [
	
	^OpaqueImage
		figure: self startIconImage
		shape: self startIconMask
]

{ #category : #resources }
ActivityDiagramEditor class >> startIconImage [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #startIconImage"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 24
				depth: 7
				bitsPerPixel: 8
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7934 7934 7934)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2698 2923 2698)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(160 3437 160)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1798 2120 1798)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(289 3019 289)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4079 4079 4079)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(160 3115 160)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6906 6906 6906)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(289 417 289)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(224 385 224)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1541 1830 1541)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(835 1124 835)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 4914 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 1606 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 4753 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 1445 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(513 1284 513)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 4593 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5878 5878 5878)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(578 1156 578)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(642 867 642)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3597 3758 3597)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(578 1316 578)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4850 4850 4850)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1060 1349 1060)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(995 1316 995)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7677 7677 7677)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2376 2633 2376)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6649 6649 6649)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 4464 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4304 4497 4304)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 4304 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 4143 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 3983 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(385 770 385)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5621 5621 5621)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(449 642 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 2055 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 1734 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7420 7420 7420)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(674 1027 674)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3501 3693 3501)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4946 5043 4946)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6392 6392 6392)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2601 2890 2601)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 3693 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 3533 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(256 2698 256)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 3212 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 3051 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5364 5364 5364)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3019 3212 3019)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(128 192 128)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(610 1027 610)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(2826 3115 2826)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(481 1124 481)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(1991 2344 1991)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7163 7163 7163)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3372 3501 3372)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(417 610 417)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(963 1316 963)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6135 6135 6135)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(128 2666 128)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 2923 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(770 1220 770)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(449 1863 449)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(321 2120 321)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 2762 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 2441 0)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					(ByteArray fromPackedString:
							'MST5MST5MST5MST5MST5MST5MST5MST@MST5MST5MST5N2PFA! ,MST5MST5MST@MST5MST5MQLYH2]FQ$PQIR(AMST5MST@MST5MSTAN@8"CP4MCP4MG#@>BCT5MST@MST5MQ4>AP4MCP4MCP4MCP4!EA<5MST@MST5JDH!CP4MCP4MCP4MCP4MC4L+MST@MST5N LMCP4MCP4MCP4MCP4MCQH7JCT@MST+I 4MCP4MCP4MCP4MCP4MCP4/ACT@MPD=D 4MCP4MCP4MCP4MCP4MCP4MC!L@MSMCCP4MCP4MCP4MCP4MCP4MCP4ML H@MSQACP4MCP4MCP4MCP4MCP4MCP4MHAT@MQ01CP4MCP4MCP4MCP4MCP4MCP4MCP@@MPP.CP4MCP4MCP4MCP4MCP4MCP4MCP@@MPH2CP4MCP4MCP4MCP4MCP4MCP4MC3X@MS1ECP4MCP4MCP4MCP4MCP4MCP4MHP0@MS<PCP4MCP4MCP4MCP4MCP4MCP4MPAX@MSTLHP4MCP4MCP4MCP4MCP4MCP4MNQ4@MST,DP4MCP4MCP4MCP4MCP4MCP40J#T@MST5J#@MCP4MCP4MCP4MCP4MCRD>@ST@MST5@Q(/CP4MCP4MCP4MCP4MG!\,MST@MST5MR DI!HMCP4MCP4MCP4GJS<5MST@MST5MST5J3\2D 4MCP4MK 8-F3T5MST@MST5MST5MR BBQ@PDA@JAAL5MST5MST@MST5MST5MST5MS<?O3<[MST5MST5MST@'))
]

{ #category : #resources }
ActivityDiagramEditor class >> startIconMask [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #startIconMask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 23 @ 24
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 126 0 0 1 255 192 0 7 255 224 0 15 255 240 0 31 255 248 0 31 255 252 0 63 255 252 0 127 255 254 0 127 255 254 0 127 255 254 0 127 255 254 0 127 255 254 0 127 255 254 0 127 255 254 0 127 255 254 0 63 255 254 0 63 255 252 0 31 255 252 0 31 255 248 0 15 255 240 0 3 255 224 0 1 255 128 0 0 62 0 0])
]

{ #category : #resources }
ActivityDiagramEditor class >> stopDotIcon [
	
	^OpaqueImage
		figure: self endIconImage
		shape: self endIconMask
]

{ #category : #'interface specs' }
ActivityDiagramEditor class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false #openType #advanced #sizeType #specifiedSize #positionType #positionSystemDefault) 
			#label: 'Activity Diagram Editor' 
			#min: #(Point 20 20) 
			#max: #(Point 0 0) 
			#bounds: #(Rectangle 840 525 1395 1005) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 2 0 34 0 0 1.0 0 1.0) 
				#flags: 11 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#component: #drawing) #(ArbitraryComponentSpec 
				#layout: #(LayoutFrame 3 0 0 0 0 1.0 34 0) 
				#flags: 0 
				#component: #toolbar) #(ActionButtonSpec 
				#layout: #(LayoutOrigin 0 0.873874 0 0.00833333) 
				#name: #ActionButton1 
				#model: #verifyAndInstall 
				#label: 'Install' 
				#defaultable: true))))
]

{ #category : #actions }
ActivityDiagramEditor >> compileForClass: aTargetClass selector: selectorName [
	"this method is called from the #install button. 
	It creates 2 methods in the aTargetClass: 
			an instance method (into the #@ control_diagram protocol) called selectorName, and 
			a class method (into the #+ activityDiagram protocol) called activity_SelectorName"
	
	| codeStream string protocol |
	self setActivitiesId.	" ****    writting the #activity_method as CLASS Method: activity_selectorName   **** "
	codeStream := String new writeStream.
	codeStream
		nextPutAll:
				aTargetClass preStringForActivitySelector , selectorName asString;
		cr.
	self writeCommentForClassMethodOn: codeStream.
	self writeDiagramDefinitionOn: codeStream.
	string := codeStream contents.
	protocol := '+ activityDiagram'.
	self option isSymbol ifTrue: [protocol := protocol , '_' , self option].
	aTargetClass class compile: string classified: protocol notifying: nil.	" ****    writting the #method as INSTANCE Method: selectorName    **** "
	codeStream := String new writeStream.
	codeStream
		nextPutAll: selectorName;
		cr.
	self writeCommentForInstanceMethodOn: codeStream.
	codeStream nextPutAll: '	self performActivityDiagram: #' , selectorName.
	string := codeStream contents.
	protocol := '@ control_diagram'.
	(aTargetClass includesBehavior: CormasModelOld)
		ifTrue:
			[protocol := Dialog choose:
					'Please, choose a protocol to install the diagram?'
				fromVerticallyAlignedButtonsWithLabels:
					#('init' 'control' '@ control_diagram') values:
					#('init' 'control' '@ control_diagram') default: '@ control_diagram'].
	aTargetClass compile: string classified: protocol notifying: nil.
	self cormasModel isNil ifFalse: [self cormasModel addDiagram: self]
]

{ #category : #accessing }
ActivityDiagramEditor >> cormas [
	"Acces to the Cormas instance"
	
	^Cormas current
]

{ #category : #accessing }
ActivityDiagramEditor >> cormasModel [
	
	^cormasModel
]

{ #category : #accessing }
ActivityDiagramEditor >> cormasModel: anObject [
	
	cormasModel := anObject
]

{ #category : #accessing }
ActivityDiagramEditor >> defaultLocation [
	
	^Rectangle
		origin: 420 @ 10
		width: 550
		height: 500
]

{ #category : #accessing }
ActivityDiagramEditor >> location [
	
	^location ifNil: [location := self defaultLocation]
]

{ #category : #accessing }
ActivityDiagramEditor >> location: anObject [
	
	location := anObject
]

{ #category : #accessing }
ActivityDiagramEditor >> name [
	
	^name ifNil: [name := '']
]

{ #category : #accessing }
ActivityDiagramEditor >> name: anObject [
	
	name := anObject
]

{ #category : #'interface opening' }
ActivityDiagramEditor >> open [
	"Open the editor interface.
	self new open"
	
	^self openIn: self location
]

{ #category : #'interface opening' }
ActivityDiagramEditor >> openIn: aRectangle [
	"Open the editor interface into the specified rectangle, corrected by the current screen on which the stored editor is opened"
	
	| win newRectangle height width origine |
	height := Screen default bounds height min: aRectangle height.
	width := Screen default bounds width min: aRectangle width.
	origine := aRectangle origin.
	origine x + width > Screen default bounds width
		ifTrue: [origine x: Screen default bounds width - width].
	origine y + height > Screen default bounds height
		ifTrue: [origine y: Screen default bounds height - height].
	newRectangle := Rectangle origin: origine width: width height: height.
	win := (self allButOpenInterface: #windowSpec) window.
	^win openIn: newRectangle
]

{ #category : #'interface opening' }
ActivityDiagramEditor >> openWithActivities: activityFigures connections: transitionModels [
	
	| transitionFigures figure |
	self open.
	self drawing addAll: activityFigures.
	transitionFigures := OrderedCollection new.
	transitionModels
		do:
			[:aTransitionModel | 
			figure := (activityFigures
				detect: [:fig | fig id = aTransitionModel from id])
				connectFromPoint: aTransitionModel points first
				to: (activityFigures detect: [:fig | fig id = aTransitionModel to id])
				at: aTransitionModel points last.
			figure
				points: aTransitionModel points;
				recomputePreferredBounds.
			transitionFigures add: figure].
	self drawing addAll: transitionFigures.
	self setTitle
]

{ #category : #accessing }
ActivityDiagramEditor >> option [
	
	^option
]

{ #category : #accessing }
ActivityDiagramEditor >> option: anObject [
	
	option := anObject
]

{ #category : #actions }
ActivityDiagramEditor >> setActivitiesId [
	
	| id |
	id := 1.
	(self drawing components select: [:fig | fig class = StartFigure])
		do:
			[:act | 
			act id: id.
			act model id: id.
			id := id + 1].
	(self drawing components select: [:fig | fig class = EndFigure])
		do:
			[:act | 
			act id: id.
			act model id: id.
			id := id + 1].
	(self drawing components
		select: [:fig | fig isActivityFigure or: [fig isDiamondFigure]])
		do:
			[:act | 
			act id: id.
			act model id: id.
			id := id + 1]
]

{ #category : #title }
ActivityDiagramEditor >> setTitle [
	
	| title |
	title := 'Activity Diagram Editor for Entity < ' , self targetClass name ,
			' > '.
	self name isEmpty
		ifFalse: [title := title , ' and method ' , self name printString].
	self builder window label: title
]

{ #category : #accessing }
ActivityDiagramEditor >> targetClass [
	
	^targetClass
]

{ #category : #accessing }
ActivityDiagramEditor >> targetClass: anObject [
	
	targetClass := anObject
]

{ #category : #'drawing description' }
ActivityDiagramEditor >> toolNames [
	"Return the list of names for the tools. 'nil' represents a space between tools in the icon bar.
	To each name (String), an icon should be associated at the class level and an initializeTool method should be design at the level of Tool class (these methods must be draged into Cormas Package)
	Ex: 'Inspect Tool'  -> inspectIcon -> initializeInspectTool
		'Manipulate Tool'  -> manipulateIcon -> initializeManipulateTool
		'Zoom Tool' -> zoomIcon -> initializeZoomTool

	To add a new toolState in the States dictionary of Tool, you must define it from the StateTransition Diagram. Ex with 'Activity Tool' :
In Tool class, create a method called #initializeActivityTool from the #initializeInspectTool method (changing the name of the method and accept will create the new method). Then open the editor by evaluating the comment and create 'Activity Tool' as initial state. Do whatever transitions you want, verify the diagram and compile it as #initializeActivityTool
"
	
	^#('Selection Tool' nil 'Delete Tool' 'Bring To Front Tool' 'Send To Back Tool' nil 'StartDot Tool' 'StopDot Tool' nil 'Activity Tool' 'Condition Tool')
]

{ #category : #actions }
ActivityDiagramEditor >> verify [
	
	| outTransitions |
	(self drawing components contains: [:fig | fig class = StartFigure])
		ifFalse:
			[self cormas warn: 'Error: there is no Start Point'.
			^false].
	(self drawing components select: [:fig | fig class = StartFigure]) size >
			1
		ifTrue:
			[self cormas warn: 'Error: there is more than one Start Point'.
			^false].
	(self drawing components contains: [:fig | fig class = EndFigure])
		ifFalse:
			[self cormas warn: 'Error: there is no End Point'.
			^false].
	outTransitions := (self drawing components
		detect: [:fig | fig class = StartFigure]) model outgoing.
	outTransitions isEmpty
		ifTrue:
			[self cormas warn: 'Error: the Start Point has no outgoing transition'.
			^false].
	outTransitions size > 1
		ifTrue:
			[self cormas warn:
					'Error: the Start Point has more than one outgoing transition'.
			^false].
	(self drawing components select: [:fig | fig class = ActivityFigure])
		do:
			[:act | 
			| s |
			s := act model selectedActivity value.
			s = ActivityModel defaultName
				ifTrue:
					[self cormas warn: 'Error: an activity has no name << ?? >>'.
					^false].
			act model incoming isEmpty
				ifTrue:
					[self cormas warn:
							'Error: the activity %<%<<1s>>> has no incoming transition' with: s.
					^false].
			act model outgoing isEmpty
				ifTrue:
					[self cormas warn:
							'Error: the activity %<%<<1s>>> has no outgoing transition' with: s.
					^false]].
	(self drawing components select: [:fig | fig class = DiamondFigure])
		do:
			[:act | 
			| s |
			s := act model selectedActivity value.
			s = DecisionPointModel defaultName
				ifTrue:
					[self cormas warn: 'Error: a Decision Point has no name << ?? >>'.
					^false].
			act model incoming isEmpty
				ifTrue:
					[self cormas
						warn:
							'Error: the Decision Point %<%<<1s>' , act model selectedActivity value ,
									'>> has no incoming transition'
						with: s.
					^false].
			act model outgoingTrue isNil
				ifTrue:
					[self cormas warn:
							'Error: the Decision Point %<%<<1s>>> has no outgoing transition for [TRUE]'
						with: s.
					^false].
			act model outgoingFalse isNil
				ifTrue:
					[self cormas warn:
							'Error: the Decision Point %<%<<1s>>> has no outgoing transition for [FALSE]'
						with: s.
					^false]].
	^true
]

{ #category : #actions }
ActivityDiagramEditor >> verifyAndInstall [
	
	| aName |
	self verify ifFalse: [^false].	"check if targetClass is defined"
	self targetClass
		ifNil:
			[| answer |
			answer := Dialog
				choose: 'On which class to install the diagram?'
				fromList: (CMEntity allTerminalClasses collect: [:cl | cl name asString])
				values: CMEntity allTerminalClasses
				lines: 8
				cancel: [nil].
			answer isNil
				ifTrue: [^nil]
				ifFalse: [self targetClass: answer]].
	aName := Dialog
		request: 'Name of the operation?'
		initialAnswer: self name.
	aName isEmpty ifTrue: [^self].
	aName := aName asSymbol.	"check if aName is a standart instance method already defined"
	(self targetClass allInstanceSelectors includes: aName)
		ifTrue:
			[(self cormas
				confirm:
					'The <' , aName printString , '> method already exist into '
						, self targetClass name asString
						, ' or its super classes. \Redifine it?' withCRs)
				ifFalse: [^self verifyAndInstall]].
	self name: aName.	"store this instance of activityDiagram into activityDiagrams class variable dictionary"
	self targetClass activityDiagrams
		at: self name
		put: self.	"store this instance of activityDiagram as 2 new methods (#aName and #activity_aName)"
	self
		compileForClass: self targetClass
		selector: self name.
	self setTitle
]

{ #category : #actions }
ActivityDiagramEditor >> writeActivityDefinitionsOn: codeStream [
	
	states do: [:each | each writeDefinitionOn: codeStream]
]

{ #category : #actions }
ActivityDiagramEditor >> writeCommentForClassMethodOn: codeStream [
	"writting the comments of instance method"
	"Example: Productor activity_bidonC open
			This method was automatically generated by the ActivityDiagramEditor."
	
	codeStream
		nextPutAll:
				'	" ' , self targetClass name , ' activity_' , self name , ' open"';
		cr;
		nextPutAll:
				'	"This method was automatically generated by the ActivityDiagramEditor."';
		cr
]

{ #category : #actions }
ActivityDiagramEditor >> writeCommentForInstanceMethodOn: codeStream [
	"writting the comments of instance method"
	"Example: Productor openActivityDiagram: #bidonC
			This method was automatically generated by the ActivityDiagramEditor."
	
	codeStream
		nextPutAll:
				'	" ' , self targetClass name , ' openActivityDiagram: #' , self name ,
							' "';
		cr;
		nextPutAll:
				'	"This method was automatically generated by the ActivityDiagramEditor."';
		cr
]

{ #category : #actions }
ActivityDiagramEditor >> writeDiagramDefinitionOn: codeStream [
	"Create the code of the diagram"
	
	| elementFigures connections win |
	"write the Stop & Start Figures"
	codeStream
		nextPutAll:
				'	| stopStarts activities transitions realActivityFigure virtualActivities editor |';
		cr;
		nextPutAll: '	"Set the list of Figures."';
		cr;
		nextPutAll: '	stopStarts := '.
	elementFigures := self drawing components
		select: [:fig | fig class = StartFigure or: [fig class = EndFigure]].
	elementFigures storeOn: codeStream.
	codeStream
		nextPut: $.;
		cr;
		nextPutAll: '	stopStarts do:[: fig | fig model id: fig id].';
		cr;
		cr;
		nextPutAll: '	activities := (Core.OrderedCollection new).';
		cr;
		nextPutAll: '	virtualActivities :='.	"write the activty & decisionPoint Figures"
	elementFigures := self drawing components
		select: [:fig | fig isActivityFigure or: [fig isDiamondFigure]].
	elementFigures storeOn: codeStream.
	codeStream
		nextPut: $.;
		cr;
		cr;
		nextPutAll: '	"Creates the Figures."';
		cr;
		nextPutAll:
				'	virtualActivities do: [:actFig |
		realActivityFigure := actFig class createAt: ((actFig bounds) center) forClass: self.
		realActivityFigure lineColor: actFig lineColor; fillColor: actFig fillColor; lineWidth: actFig lineWidth.
		realActivityFigure id:  actFig id.
		realActivityFigure model selectedActivity value: actFig info.
		realActivityFigure model id: actFig id.
		activities add: realActivityFigure].'.
	codeStream
		cr;
		nextPutAll: '	activities addAllFirst: stopStarts.';
		cr.
	codeStream
		cr;
		nextPutAll: '	"Creates the Transitions."';
		cr;
		nextPutAll: '	transitions := OrderedCollection new. '.	"write the transitions Figures"
	connections := self drawing components
		select: [:fig | fig class = LineFigure].
	connections
		do:
			[:each | 
			codeStream nextPutAll:
					'	transitions add: (Refactory.HotDraw.ToolStateTransitionModel new'.
			each writeStoreStringOn: codeStream.
			codeStream
				nextPutAll: ').';
				cr].	"write to create an instance of the editor"
	win := self builder window.
	codeStream
		cr;
		nextPutAll: '	"Creates and open the new Editor."';
		cr;
		nextPutAll:
				'	editor := ActivityDiagramEditor newWithActivities: activities connections: transitions forClass: self method: #'
						, self name , '.';
		cr;
		nextPutAll:
				'	editor location: (Rectangle origin: ' , win globalOrigin asString ,
							' width: ' , win width asString , ' height: ' , win height asString
						, ').';
		cr;
		nextPutAll: '	^editor'
]
