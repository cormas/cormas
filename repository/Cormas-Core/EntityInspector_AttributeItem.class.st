Class {
	#name : #'EntityInspector_AttributeItem',
	#superclass : #Object,
	#instVars : [
		'name',
		'value',
		'entity'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #resources }
EntityInspector_AttributeItem class >> blankIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #blankIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 11 @ 9
				depth: 1
				bitsPerPixel: 1
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0])
]

{ #category : #resources }
EntityInspector_AttributeItem class >> chartIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #chartIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 9 @ 8
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 3822 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(7644 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[192 255 192 0 192 255 192 0 192 213 192 0 192 213 192 0 192 213 192 0 192 213 192 0 192 213 192 0 170 170 128 0])
]

{ #category : #resources }
EntityInspector_AttributeItem class >> diveIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #eyeIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 11 @ 9
				depth: 3
				bitsPerPixel: 4
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(6617 6617 4753)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(3180 3180 3180)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4240 4240 4240)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 6070)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[67 51 51 51 48 64 0 0 66 68 68 68 16 64 0 0 68 37 85 81 4 64 0 0 68 49 85 81 4 64 0 0 68 66 85 16 68 64 0 0 68 67 21 16 68 64 0 0 68 68 33 4 68 64 0 0 68 68 49 4 68 64 0 0 68 68 64 68 68 64 0 0])
]

{ #category : #resources }
EntityInspector_AttributeItem class >> eyeIcon [
	"Tools.UIMaskEditor new openOnClass: self andSelector: #eyeIcon"
	
	<resource: #image>
	^CachedImage
		on:
			(Image
				extent: 11 @ 9
				depth: 2
				bitsPerPixel: 2
				palette:
					(MappedPalette
						withColors:
							(#(#(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(5460 5460 5460)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(0 0 0)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(8191 8191 8191)) #(ColorValue 
								#scaledRed:scaledGreen:scaledBlue: #(4111 4111 4111)))
								collect:
									[:each | 
									(each at: 1) value
										perform: (each at: 2)
										withArguments: (each at: 3)]))
				usingBits:
					#[170 170 168 0 170 2 168 0 171 255 168 0 143 87 200 0 61 85 240 0 143 87 200 0 171 255 168 0 170 2 168 0 170 170 168 0])
]

{ #category : #'initialize-release' }
EntityInspector_AttributeItem class >> for: object name: att [
	
	| item attValue nb classesSet |
	item := self new.
	item entity: object.
	item name: att.
	attValue := object perform: att asSymbol.
	attValue
		ifNil:
			[item initValue: attValue printString.
			^item].
	item isSymbol
		ifTrue:
			[item initValue: attValue printString.
			^item].
	item isString
		ifTrue:
			[item initValue: attValue.
			^item].	"check if it is an association to another model entity"
	item isAssociation
		ifTrue:
			[item initValue: 'a ' , attValue class name.
			^item].
	item isCollection
		ifTrue:
			[attValue size = 1
				ifTrue:
					[item initValue: '1 ' , (attValue asOrderedCollection at: 1) class name.
					^item].
			attValue size = 0
				ifTrue:
					[item initValue: 'isEmpty'.
					^item].
			nb := attValue size printString.
			classesSet := (attValue collect: [:e | e class]) asSet.
			classesSet size > 1
				ifTrue:
					[item initValue: nb , ' mixed items'.
					^item].
			item
				initValue:
					nb , ' ' , attValue asOrderedCollection first class name , 's'.
			^item].
	(item isNumber or: [item isBoolean])
		ifTrue:
			[item initValue: attValue printString.
			^item].	"In case it is none of the upper options, it must be an association to an object which is not a cormas entity"
	item initValue: 'a ' , attValue class name.
	^item
]

{ #category : #'private-icons' }
EntityInspector_AttributeItem >> buttonImage [
	
	self isNumber ifTrue: [^self class chartIcon].
	self isCollection ifTrue: [^self class diveIcon].
	self isBoolean ifTrue: [^self class chartIcon].
	self isAssociation ifTrue: [^self class eyeIcon].
	self isString ifTrue: [^self class chartIcon].
	self isSymbol ifTrue: [^self class chartIcon].
	^self class blankIcon
]

{ #category : #accessing }
EntityInspector_AttributeItem >> entity [
	
	^entity
]

{ #category : #accessing }
EntityInspector_AttributeItem >> entity: anObject [
	
	entity := anObject
]

{ #category : #accessing }
EntityInspector_AttributeItem >> initValue: anObject [
	
	value := anObject
]

{ #category : #testing }
EntityInspector_AttributeItem >> isAssociation [
	
	^(self entity perform: self name asSymbol) class inheritsFrom: Entity
]

{ #category : #testing }
EntityInspector_AttributeItem >> isBoolean [
	
	^(self entity perform: self name asSymbol) class inheritsFrom: Boolean
]

{ #category : #testing }
EntityInspector_AttributeItem >> isCollection [
	
	| aV |
	aV := self entity perform: self name asSymbol.
	^aV isCollection and: [aV isSymbol not and: [aV isString not]]
]

{ #category : #testing }
EntityInspector_AttributeItem >> isNumber [
	
	^(self entity perform: self name asSymbol) class inheritsFrom: Number
]

{ #category : #testing }
EntityInspector_AttributeItem >> isString [
	
	^(self entity perform: self name asSymbol) isString
]

{ #category : #testing }
EntityInspector_AttributeItem >> isSymbol [
	
	^(self entity perform: self name asSymbol) isSymbol
]

{ #category : #accessing }
EntityInspector_AttributeItem >> name [
	
	^name
]

{ #category : #accessing }
EntityInspector_AttributeItem >> name: anObject [
	
	name := anObject
]

{ #category : #accessing }
EntityInspector_AttributeItem >> value [
	
	^value
]

{ #category : #accessing }
EntityInspector_AttributeItem >> value: anObject [
	
	value := anObject.
	entity
		ifNotNil:
			[entity
				perform: (name , ':') asSymbol
				with: value	"(Cormas valueOfValueInString:"	")"]
]
