Class {
	#name : #AddOnManager,
	#superclass : #UIApplicationModel,
	#instVars : [
		'cormas',
		'selectedRow',
		'addOns_List'
	],
	#classInstVars : [
		'isWinOpen'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #resources }
AddOnManager class >> fileSaveIcon [
	
	^OpaqueImage
		figure: self fileSaveImage
		shape: self fileSaveMask
]

{ #category : #resources }
AddOnManager class >> fileSaveImage [
	"UIMaskEditor new openOnClass: self andSelector: #fileSave20x20"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							((Array new: 7)
								at: 1
									put: ColorValue black;
								at: 2
									put:
										(ColorValue scaledRed: 5548 scaledGreen: 5548 scaledBlue: 5548);
								at: 3
									put:
										(ColorValue scaledRed: 6869 scaledGreen: 6869 scaledBlue: 6869);
								at: 4
									put:
										(ColorValue scaledRed: 3170 scaledGreen: 3170 scaledBlue: 3170);
								at: 5
									put: ColorValue white;
								at: 6
									put:
										(ColorValue scaledRed: 5548 scaledGreen: 7398 scaledBlue: 7926);
								at: 7
									put:
										(ColorValue scaledRed: 2113 scaledGreen: 2113 scaledBlue: 2113);
								yourself))
				usingBits:
					(ByteArray fromPackedString:
							'QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@QDY&@@@@@@QDQ@@@QDX"H@@QDAADQ@@@QDX!D@@QDADDQ@@@QDX!D@@QDADDQ@@@QDX!D@@@@QDDQ@@@QDX!DQDQDQDDQ@@@QDX!L3L3L1DDQ@@@QDX#QDQDQSDDQ@@@QDX#QDQDUCDDQ@@@QDX#QDQEQSDDQ@@@QDX#QDQTUSDDQ@@@QDX#QDUEUS@DQ@@@QDX#QEQUUSPDQ@@@QD@@@@@@@@@DQ@@@QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@QDQDQDQDQDQDQ@@@'))
]

{ #category : #resources }
AddOnManager class >> fileSaveMask [
	"UIMaskEditor new openOnClass: self andSelector: #fileSave20x20mask"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 20 @ 20
				depth: 1
				bitsPerPixel: 1
				palette: CoveragePalette monoMaskPalette
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 31 254 0 0 31 255 0 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 31 255 128 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #accessing }
AddOnManager class >> isWinOpen [
	
	^isWinOpen ifNil: [isWinOpen := false]
]

{ #category : #accessing }
AddOnManager class >> isWinOpen: anObject [
	
	isWinOpen := anObject
]

{ #category : #resources }
AddOnManager class >> toolBar [
	"Tools.MenuEditor new openOnClass: self andSelector: #toolBar"
	
	<resource: #menu>
	^#(Menu #(#(MenuItem 
		#rawLabel: 'Save' 
		#value: #saveAddOnsSettings 
		#labelImage: #(ResourceRetriever ToolbarIconLibrary #fileSave) 
		#helpText: 'Save settings. Selected add-ons will be loaded each time you open Cormas')) #(1) nil)
		decodeAsLiteralArray
]

{ #category : #'interface specs' }
AddOnManager class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: 'Add-Ons Manager' 
			#min: #(Point 467 423) 
			#max: #(Point 1500 850) 
			#bounds: #(Rectangle 702 279 1169 702) 
			#flags: 11 
			#toolBar: #toolBar 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7679 8191 7167))) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 97 32 174 54) 
				#name: #selectNone 
				#model: #selectNone 
				#label: 'Select none' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 266 20 322 46) 
				#name: #loadAddOns 
				#model: #loadAddOns 
				#label: 'Load' 
				#style: #systemDefault 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 9 3) 
				#name: #Label1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7679 8191 7167)) 
				#label: 'Select add-ons you want to load' 
				#style: #systemDefault) #(ActionButtonSpec 
				#layout: #(Rectangle 16 32 85 54) 
				#name: #selectAll 
				#model: #selectAll 
				#label: 'Select all' 
				#defaultable: true) #(ActionButtonSpec 
				#layout: #(Rectangle 333 20 421 46) 
				#name: #ActionButton1 
				#model: #loadAddOnsAndClose 
				#label: 'Load - Close' 
				#style: #systemDefault 
				#defaultable: true) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showVerticalLines true #allowColumnReordering true #showLineNumbers true #allowColumnResizing true #rowLabelsAsButtons false #showHorizontalLines true) 
				#layout: #(LayoutSizedOrigin 0 0 62 0 1400 800) 
				#name: #Dataset1 
				#flags: 13 
				#model: #addOns_List 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing false) 
					#label: ' N¬∞' 
					#labelIsImage: false 
					#width: 25 
					#rendererType: #rowSelector 
					#editorType: #rowSelector 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #disable true #labelFromApplication false #allowResizing true #allowSorting true) 
					#model: #'selectedRow nameAsString' 
					#label: 'Name' 
					#labelIsImage: false 
					#width: 130 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow versionAsString' 
					#label: 'Version' 
					#labelIsImage: false 
					#width: 45 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow categoryAsString' 
					#label: 'Category' 
					#labelIsImage: false 
					#width: 130 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing false) 
					#model: #'selectedRow shouldLoad' 
					#label: 'Load' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #CheckBox 
					#editorType: #CheckBox 
					#noScroll: false) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow typeAsString' 
					#label: 'Type' 
					#labelIsImage: false 
					#width: 30 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow authorAsString' 
					#label: 'Author' 
					#labelIsImage: false 
					#width: 120 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow fileAsString' 
					#label: 'File' 
					#labelIsImage: false 
					#width: 120 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting true #allowResizing true) 
					#model: #'selectedRow dateAsString' 
					#label: 'Creation date' 
					#labelIsImage: false 
					#width: 110 
					#rendererType: #Text 
					#editorType: #Label 
					#noScroll: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow addOnDescription' 
					#label: 'Description' 
					#labelIsImage: false 
					#width: 400 
					#rendererType: #Text 
					#editorType: #InputField 
					#noScroll: true)) 
				#labelsAsButtons: true))))
]

{ #category : #aspects }
AddOnManager >> addOns_List [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^addOns_List isNil
		ifTrue:
			[addOns_List := SelectionInListSortAware new.
			addOns_List selectionIndexHolder
				compute: [:v | self selectedRow value: addOns_List selection].
			addOns_List]
		ifFalse: [addOns_List]
]

{ #category : #alert }
AddOnManager >> alert_NoAddOn [
	
	^self cormas
		warn: (UserMessage defaultString: 'No Add-On available' key: #noAddOn)
]

{ #category : #accessing }
AddOnManager >> cormas [
	
	^cormas
]

{ #category : #actions }
AddOnManager >> loadAddOns [
	
	(self addOns_List list select: [:i | i shouldLoad])
		do:
			[:i | 
			i typeAsString = 'ST' ifTrue: [i file fileIn].
			i typeAsString = 'Parcel' ifTrue: [Parcel loadParcelFrom: i file]]
]

{ #category : #actions }
AddOnManager >> loadAddOnsAndClose [
	
	self loadAddOns.
	self closeAndUnschedule.
	self class isWinOpen: false
]

{ #category : #obsolete }
AddOnManager >> loadDefaultAddOns [
	
	| collec aFile |
	collec := self readDefaultAddOnsToLoad.
	self halt.
	collec
		do:
			[:aString | 
			aFile := Cormas addOnsPath asFilename construct: aString.
			aFile exists
				ifTrue:
					[aFile extension = '.st' ifTrue: [aFile fileIn].
					aFile extension = '.pcl' ifTrue: [Parcel loadParcelFrom: aFile]]]
]

{ #category : #'instance creation' }
AddOnManager >> openOn: aCormas [
	
	| win |
	cormas := aCormas.
	self prepareTable ifNil: [^self class isWinOpen: false].
	win := (self allButOpenInterface: #windowSpec) window.
	win open.
	self class isWinOpen: true
]

{ #category : #'instance creation' }
AddOnManager >> prepareTable [
	"Detect all add-ons availble in the add-on diirectory and put them in the dataset"
	
	| dir tmp aList corruptedFiles |
	dir := Cormas addOnsPath asFilename.
	tmp := SortedCollection sortBlock: [:a :b | a asString < b asString].
	dir directoryContents do: [:each | tmp add: (dir construct: each)].
	tmp removeAllSuchThat: [:file | file isDirectory].
	corruptedFiles := Set new.
	(tmp select: [:f | f extension = '.pcl'])
		do:
			[:aPcl | 
			(tmp
				contains:
					[:aF | 
					aF tail
						=
							((aPcl tail
								copyFrom: 1
								to: aPcl tail size - 4) , '.pst')])
				ifFalse:
					[self cormas warn: '.pst file is missing for add-on ''' , aPcl tail , ''''.
					corruptedFiles add: aPcl]].
	tmp removeAll: corruptedFiles.
	tmp := tmp select: [:f | f extension = '.st' or: [f extension = '.pcl']].
	tmp isEmpty
		ifTrue:
			[self alert_NoAddOn.
			^nil].
	aList := List new.
	tmp do: [:aFile | aList add: (AddOnManager_ListItem newOnFile: aFile)].
	self addOns_List list: aList.
	self setDefaultAddOnsToLoad
]

{ #category : #'default add-ons' }
AddOnManager >> readDefaultAddOnsToLoad [
	
	| aFile |
	aFile := Cormas addOnsPath asFilename construct:
			'Cormas_DefaultAddOnsToLoad.txt'.
	aFile exists
		ifTrue: [^Cormas loadLinesInCollecFromTxtFile: aFile]
		ifFalse: [^#()]
]

{ #category : #'instance creation' }
AddOnManager >> requestForWindowClose [
	
	cormas := nil.
	self class isWinOpen: false.
	^super requestForWindowClose
]

{ #category : #'default add-ons' }
AddOnManager >> saveAddOnsSettings [
	
	| aFile collec |
	aFile := Cormas addOnsPath asFilename construct:
			'Cormas_DefaultAddOnsToLoad.txt'.
	aFile exists ifTrue: [aFile delete].
	collec := (self addOns_List list select: [:i | i shouldLoad])
		collect: [:i | i fileAsString].
	collec isEmpty
		ifFalse: [Cormas saveElementsOfCollec: collec inFile: aFile]
]

{ #category : #actions }
AddOnManager >> selectAll [
	
	self addOns_List
		refreshList: (self addOns_List list do: [:i | i shouldLoad: true])
]

{ #category : #actions }
AddOnManager >> selectNone [
	
	self addOns_List
		refreshList: (self addOns_List list do: [:i | i shouldLoad: false])
]

{ #category : #aspects }
AddOnManager >> selectedRow [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^selectedRow isNil
		ifTrue: [selectedRow := nil asValue]
		ifFalse: [selectedRow]
]

{ #category : #actions }
AddOnManager >> selectedRowAuthorAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x authorAsString displayString <= y authorAsString displayString].
	dscSortBlock := [:x :y | x authorAsString displayString >= y authorAsString displayString].
	sortBlock := self addOns_List sortAspect == #selectedRowAuthorAsString
		ifTrue:
			[self addOns_List sortDirection == #asc
				ifTrue:
					[self addOns_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self addOns_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self addOns_List sortAspect: #selectedRowAuthorAsString.
			self addOns_List sortDirection: #dsc.
			ascSortBlock].
	self addOns_List
		refreshList:
			(SortedCollection
				withAll: self addOns_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
AddOnManager >> selectedRowCategoryAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x categoryAsString displayString <= y categoryAsString displayString].
	dscSortBlock := [:x :y | x categoryAsString displayString >= y categoryAsString displayString].
	sortBlock := self addOns_List sortAspect == #selectedRowCategoryAsString
		ifTrue:
			[self addOns_List sortDirection == #asc
				ifTrue:
					[self addOns_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self addOns_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self addOns_List sortAspect: #selectedRowCategoryAsString.
			self addOns_List sortDirection: #dsc.
			ascSortBlock].
	self addOns_List
		refreshList:
			(SortedCollection
				withAll: self addOns_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
AddOnManager >> selectedRowDateAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x dateAsString displayString <= y dateAsString displayString].
	dscSortBlock := [:x :y | x dateAsString displayString >= y dateAsString displayString].
	sortBlock := self addOns_List sortAspect == #selectedRowDateAsString
		ifTrue:
			[self addOns_List sortDirection == #asc
				ifTrue:
					[self addOns_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self addOns_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self addOns_List sortAspect: #selectedRowDateAsString.
			self addOns_List sortDirection: #dsc.
			ascSortBlock].
	self addOns_List
		refreshList:
			(SortedCollection
				withAll: self addOns_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
AddOnManager >> selectedRowFileAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x fileAsString displayString <= y fileAsString displayString].
	dscSortBlock := [:x :y | x fileAsString displayString >= y fileAsString displayString].
	sortBlock := self addOns_List sortAspect == #selectedRowFileAsString
		ifTrue:
			[self addOns_List sortDirection == #asc
				ifTrue:
					[self addOns_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self addOns_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self addOns_List sortAspect: #selectedRowFileAsString.
			self addOns_List sortDirection: #dsc.
			ascSortBlock].
	self addOns_List
		refreshList:
			(SortedCollection
				withAll: self addOns_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
AddOnManager >> selectedRowNameAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x nameAsString displayString <= y nameAsString displayString].
	dscSortBlock := [:x :y | x nameAsString displayString >= y nameAsString displayString].
	sortBlock := self addOns_List sortAspect == #selectedRowNameAsString
		ifTrue:
			[self addOns_List sortDirection == #asc
				ifTrue:
					[self addOns_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self addOns_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self addOns_List sortAspect: #selectedRowNameAsString.
			self addOns_List sortDirection: #dsc.
			ascSortBlock].
	self addOns_List
		refreshList:
			(SortedCollection
				withAll: self addOns_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
AddOnManager >> selectedRowShouldLoadLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x shouldLoad	"displayString <= y shouldLoad displayString"].
	dscSortBlock := [:x :y | x shouldLoad not	"displayString >= y shouldLoad displayString"].
	sortBlock := self addOns_List sortAspect == #selectedRowShouldLoad
		ifTrue:
			[self addOns_List sortDirection == #asc
				ifTrue:
					[self addOns_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self addOns_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self addOns_List sortAspect: #selectedRowShouldLoad.
			self addOns_List sortDirection: #dsc.
			ascSortBlock].
	self addOns_List
		refreshList:
			(SortedCollection
				withAll: self addOns_List list
				sortBlock: sortBlock) asList
]

{ #category : #actions }
AddOnManager >> selectedRowTypeAsStringLabelPressed [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined."
	
	| ascSortBlock dscSortBlock sortBlock |
	ascSortBlock := [:x :y | x typeAsString displayString <= y typeAsString displayString].
	dscSortBlock := [:x :y | x typeAsString displayString >= y typeAsString displayString].
	sortBlock := self addOns_List sortAspect == #selectedRowTypeAsString
		ifTrue:
			[self addOns_List sortDirection == #asc
				ifTrue:
					[self addOns_List sortDirection: #dsc.
					ascSortBlock]
				ifFalse:
					[self addOns_List sortDirection: #asc.
					dscSortBlock]]
		ifFalse:
			[self addOns_List sortAspect: #selectedRowTypeAsString.
			self addOns_List sortDirection: #dsc.
			ascSortBlock].
	self addOns_List
		refreshList:
			(SortedCollection
				withAll: self addOns_List list
				sortBlock: sortBlock) asList
]

{ #category : #'default add-ons' }
AddOnManager >> setDefaultAddOnsToLoad [
	
	| collec |
	collec := self readDefaultAddOnsToLoad.
	collec isEmpty
		ifFalse:
			[self addOns_List list
				do:
					[:i | (collec includes: i fileAsString) ifTrue: [i shouldLoad: true]]]
]
