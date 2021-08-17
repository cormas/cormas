Class {
	#name : #CMSpMorphicConfigurationForMicrodown,
	#superclass : #SpMorphicConfiguration,
	#category : #'Cormas-UI-Spec2'
}

{ #category : #accessing }
CMSpMorphicConfigurationForMicrodown >> defaultStyleSheet [

	^ SpStyleVariableSTONReader fromString: self defaultStyleSheetData
	
]

{ #category : #accessing }
CMSpMorphicConfigurationForMicrodown >> defaultStyleSheetData [

	^ '.application [  
	Draw { 
		#color: #red,
		#backgroundColor: #veryVeryLightGray
	},
	
Geometry { 
	#hResizing: true,
	#vResizing: true,
	#width: 100,
	#height: 25,
	#minWidth: 50,
	#minHeight: 25
}
]'

" ,

  .aboutMorph [ 
		Font { 
			#name: ""Times New Roman""
		}
	]"
]

{ #category : #accessing }
CMSpMorphicConfigurationForMicrodown >> styleSheet [
	"Define the default styleSheet to use in your application. You can override this and add your 
	 own application dependent styles (and you can compose them, see *SpStyle*).
	
	[[[language=Smalltalk
	^ SpStyle defaultStyleSheet copy
	]]]"
	
	^ styleSheet ifNil: [ styleSheet := self defaultStyleSheet copy ]
]
