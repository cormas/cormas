Class {
	#name : #OneParameterWindow,
	#superclass : #Object,
	#instVars : [
		'classesList',
		'attributsList',
		'selectedClass',
		'selectedAttribut',
		'parameterInitialValue',
		'parameterFinalValue',
		'parameterStep'
	],
	#category : 'Cormas-Core-Tools'
}

{ #category : #'interface specs' }
OneParameterWindow class >> dialogNewParameter [
	"Tools.UIPainter new openOnClass: self andSelector: #dialogNewParameter"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: #(UserMessage 
				#key: #attributAnalysis 
				#defaultString: 'One attribute analysis') 
			#min: #(Point 407 329) 
			#max: #(Point 407 329) 
			#bounds: #(Rectangle 640 427 1047 756) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(SequenceViewSpec 
				#layout: #(Rectangle 16 34 186 162) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #classesList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierInit)) #(SequenceViewSpec 
				#layout: #(Rectangle 214 35 385 161) 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 8191 7679 7167)) 
				#model: #attributsList 
				#callbacksSpec: #(UIEventCallbackSubSpec 
					#doubleClickSelector: #actionModifierControle)) #(ActionButtonSpec 
				#layout: #(Rectangle 144 286 258 316) 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096) 
					#setSelectionBackgroundColor: #(ColorValue 759 6197 759)) 
				#model: #confirmParameter 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Apply and close') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 13 5) 
				#label: #(UserMessage 
					#key: #selectClass 
					#defaultString: 'Select a Class')) #(LabelSpec 
				#layout: #(Point 211 5) 
				#label: #(UserMessage 
					#key: #selectAnAttribut 
					#defaultString: 'Select an attribute')) #(LabelSpec 
				#layout: #(Point 17 258) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #initValue 
					#defaultString: 'Initial value')) #(InputFieldSpec 
				#layout: #(Rectangle 89 257 131 279) 
				#name: #InputField1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096)) 
				#model: #parameterInitialValue 
				#helpText: 'enter initial value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 148 258) 
				#name: #Label2 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'Final value')) #(InputFieldSpec 
				#layout: #(Rectangle 211 257 253 279) 
				#name: #InputField2 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096)) 
				#model: #parameterFinalValue 
				#helpText: 'enter final value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(LabelSpec 
				#layout: #(Point 273 258) 
				#name: #Label3 
				#label: #(UserMessage 
					#key: #stepValue 
					#defaultString: 'Step value')) #(InputFieldSpec 
				#layout: #(Rectangle 338 257 380 279) 
				#name: #InputField3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6143 8191 4096)) 
				#model: #parameterStep 
				#helpText: 'enter a value for the step that will increment the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00') #(GroupBoxSpec 
				#layout: #(Rectangle 13 235 386 320) 
				#name: #GroupBox1 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue 759 6197 759) 
					#setBackgroundColor: #(ColorValue 7178 8191 6141)) 
				#label: #(UserMessage 
					#key: #enterParameterValues 
					#defaultString: 'Set the Parameter Values')) #(GroupBoxSpec 
				#layout: #(Rectangle 13 174 386 231) 
				#name: #GroupBox2 
				#colors: #(LookPreferences 
					#setForegroundColor: #(ColorValue #blue) 
					#setBackgroundColor: #(ColorValue 6143 8191 8191)) 
				#label: #(UserMessage 
					#key: #enterParameterValue 
					#defaultString: 'Set the Parameter Value')) #(ActionButtonSpec 
				#layout: #(Rectangle 238 191 355 220) 
				#name: #ActionButton1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4096 6143 8191)) 
				#model: #confirm1Parameter 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Apply and close') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 19 195) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #newValue 
					#defaultString: 'New value : ')) #(InputFieldSpec 
				#layout: #(Rectangle 116 194 158 216) 
				#name: #InputField4 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 4096 6143 8191)) 
				#model: #parameterInitialValue 
				#helpText: 'set a new value to the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0.00'))))
]

{ #category : #'interface specs' }
OneParameterWindow class >> periodDialog [
	"Tools.UIPainter new openOnClass: self andSelector: #periodDialog"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #sizeType #specifiedSize #positionType #positionSystemDefault #openType #advanced) 
			#label: #(UserMessage 
				#key: #attributAnalysis 
				#defaultString: 'Average on period...') 
			#min: #(Point 276 112) 
			#max: #(Point 276 112) 
			#bounds: #(Rectangle 720 450 996 562) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 77 76 136 104) 
				#model: #apply 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Apply') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 18 5) 
				#label: #(UserMessage 
					#key: #selectClass 
					#defaultString: 'Enter Min and Max time steps of the period')) #(LabelSpec 
				#layout: #(Point 74 26) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #initValue 
					#defaultString: 'initial step') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 77 45.5 119 67.5) 
				#name: #InputField1 
				#model: #parameterInitialValue 
				#helpText: 'enter initial value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(LabelSpec 
				#layout: #(Point 188 26) 
				#name: #Label2 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'final step') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 189 45.5 231 67.5) 
				#name: #InputField2 
				#model: #parameterFinalValue 
				#helpText: 'enter final value of the attribute' 
				#alignment: #right 
				#type: #number 
				#formatString: '0') #(ActionButtonSpec 
				#layout: #(Rectangle 157 76 216 104) 
				#name: #cancel 
				#model: #close 
				#label: #(UserMessage 
					#key: #valideandclose 
					#defaultString: 'Cancel') 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 143 44) 
				#name: #Label3 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'to:') 
				#style: #systemDefault) #(LabelSpec 
				#layout: #(Point 33 44) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #finalValue 
					#defaultString: 'From:') 
				#style: #systemDefault))))
]

{ #category : #accessing }
OneParameterWindow >> accept [
	"Getter accessor without default value "
	
	^accept
]

{ #category : #accessing }
OneParameterWindow >> accept: anObject [
	
	accept := anObject
]

{ #category : #event }
OneParameterWindow >> actionModifierControle [
	"redefinition de la methode de maniere a ce que quand l utilisateur double clic sur une liste il ne se passe rien"
	
	^self
]

{ #category : #event }
OneParameterWindow >> actionModifierDynamique [
	"redefinition de la methode de maniere a ce que quand l utilisateur double clic sur une liste il ne se passe rien"
	
	^self
]

{ #category : #event }
OneParameterWindow >> actionModifierInit [
	"redefinition de la methode de maniere a ce que quand l utilisateur double clic sur une liste il ne se passe rien"
	
	^self
]

{ #category : #actions }
OneParameterWindow >> apply [
	
	^self confirmParameter
]

{ #category : #aspects }
OneParameterWindow >> attributsList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^attributsList isNil
		ifTrue: [attributsList := SelectionInList new]
		ifFalse: [attributsList]
]

{ #category : #event }
OneParameterWindow >> classListChanged [
	"Display the list of attributs of the selected class in the 
	attributsList"
	
	| liste |
	selectedClass := classesList selection.
	selectedClass
		ifNil: [attributsList list: List new]
		ifNotNil:
			[liste := List new.
			liste
				addAll:
					(DefaultAttributesSetter getAllAttributsFromClass: selectedClass).
			attributsList list: liste]
]

{ #category : #aspects }
OneParameterWindow >> classesList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^classesList isNil
		ifTrue: [classesList := SelectionInList new]
		ifFalse: [classesList]
]

{ #category : #actions }
OneParameterWindow >> confirm1Parameter [
	
	parameterFinalValue := parameterInitialValue.
	parameterStep := 1.
	^self confirmParameter
]

{ #category : #actions }
OneParameterWindow >> confirmParameter [
	
	self closeRequest.
	self accept value: true.
	^self
]

{ #category : #event }
OneParameterWindow >> indexAttributChanged [
	
	attributsList selection = '-------'
		ifTrue: [attributsList selectionIndex: 0].
	selectedAttribut := attributsList selection
]

{ #category : #acces }
OneParameterWindow >> isParameterSensitive [
	
	^(selectedClass isNil or: [selectedClass isNil]) not
]

{ #category : #init }
OneParameterWindow >> openOn: aModel [
	
	| tmp |
	"self accept: false."
	tmp := OrderedCollection new.
	tmp add: aModel.
	tmp addAll: aModel allEntityClasses asList.
	classesList := SelectionInList new.
	classesList list: tmp.
	classesList selectionIndexHolder onChangeSend: #classListChanged to: self.
	attributsList := SelectionInList new.
	attributsList selectionIndexHolder onChangeSend: #indexAttributChanged to:
			self.
	self openInterface: #dialogNewParameter
]

{ #category : #aspects }
OneParameterWindow >> parameterFinalValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^parameterFinalValue isNil
		ifTrue: [parameterFinalValue := 0 asValue]
		ifFalse: [parameterFinalValue]
]

{ #category : #aspects }
OneParameterWindow >> parameterInitialValue [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^parameterInitialValue isNil
		ifTrue: [parameterInitialValue := 0 asValue]
		ifFalse: [parameterInitialValue]
]

{ #category : #aspects }
OneParameterWindow >> parameterStep [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^parameterStep isNil
		ifTrue: [parameterStep := 0 asValue]
		ifFalse: [parameterStep]
]

{ #category : #acces }
OneParameterWindow >> selectedAttribut [
	
	^selectedAttribut
]

{ #category : #acces }
OneParameterWindow >> selectedAttribut: aClass [
	
	selectedAttribut := aClass
]

{ #category : #acces }
OneParameterWindow >> selectedClass [
	
	^selectedClass
]

{ #category : #acces }
OneParameterWindow >> selectedClass: aClass [
	
	selectedClass := aClass
]
