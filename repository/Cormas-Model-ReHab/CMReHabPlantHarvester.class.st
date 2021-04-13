Class {
	#name : #CMReHabPlantHarvester,
	#superclass : #CMAgentLocation,
	#instVars : [
		'label',
		'harvest',
		'myClan'
	],
	#classVars : [
		'CurrentId'
	],
	#classInstVars : [
		'maxHarvest'
	],
	#category : #'Cormas-Model-ReHab'
}

{ #category : #id }
CMReHabPlantHarvester class >> CurrentId [
	^CurrentId isNil
		ifTrue: [0]
		ifFalse: [CurrentId]
]

{ #category : #id }
CMReHabPlantHarvester class >> CurrentId: x [
	^CurrentId := x
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_PlantHarvester [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.0 0.0 0.0 0.0 0.0 0.0 3 1 #center #(0.0@-11.97 11.97@0.0 0.0@11.97 -11.97@0.0 0.0@-11.97) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_black [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.0 0.0 0.0 0.0 0.0 0.0 1 1 #random #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_blue [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.0 0.0 1.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_brown [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.670004 0.284703 0.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_cyan [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.0 1.0 1.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_gray [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.399951 0.399951 0.399951 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_green [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.0 0.670004 0.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_harvest0 [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 1.0 1.0 0.0 0.0 0.0 3 1 #center #(0.0@-11.97 11.97@0.0 0.0@11.97 -11.97@0.0 0.0@-11.97) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_harvest1 [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 0.580027 1.0 0.0 0.0 0.0 3 1 #center #(0.0@-11.97 11.97@0.0 0.0@11.97 -11.97@0.0 0.0@-11.97) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_harvest2 [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 0.0 1.0 0.0 0.0 0.0 3 1 #center #(0.0@-11.97 11.97@0.0 0.0@11.97 -11.97@0.0 0.0@-11.97) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_magenta [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 0.0 1.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_olive [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.670004 0.670004 0.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_orange [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 0.549994 0.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_paleGreen [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.0 1.0 0.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_pink [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 0.0 1.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_purple [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.670004 0.0 0.670004 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_red [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 0.0 0.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_springGreen [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(0.0 0.670004 0.502503 0.0 0.0 0.0 3 1 #center #(0.0@-11.97 11.97@0.0 0.0@11.97 -11.97@0.0 0.0@-11.97) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_white [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 1.0 1.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #'pov symbols' }
CMReHabPlantHarvester class >> VectorialPOV_yellow [
"Returns an array containing the settings of a Situated entity vectorial pov symbol in the following order:
(color red) (color green) (color blue) (lineColor red) (lineColor green) (lineColor blue) lineWidth sizeratio position (array of outline vertices) isDistortable."
^#(1.0 1.0 0.0 0.0 0.0 0.0 1 1 #center #(0.0@-18.3077 4.57692@-17.3923 10.0692@-14.6462 13.7308@-10.9846 16.4769@-6.40769 17.3923@-1.83077 17.3923@3.66154 15.5615@8.23846 11.9@12.8154 7.32308@15.5615 2.74615@17.3923 -2.74615@17.3923 -8.23846@15.5615 -11.9@12.8154 -15.5615@8.23846 -17.3923@3.66154 -18.3077@-1.83077 -16.4769@-6.40769 -13.7308@-10.9846 -10.0692@-14.6462 -5.49231@-17.3923 0.0@-18.3077) true)
]

{ #category : #image }
CMReHabPlantHarvester class >> defaultImage [
"defaultImage adapted for Cormas versions previous to 2010. Returns a copy of the POV image stored in the povDict of the class at a specifed symbol key"
^((self povDict keys includes: #CMReHabPlantHarvester) ifTrue:[self povDict at:#CMReHabPlantHarvester] ifFalse:[super defaultImage]) copy
]

{ #category : #'default value' }
CMReHabPlantHarvester class >> harvest_default [
	"Return the default value of harvest attribute"
	^0
]

{ #category : #accessing }
CMReHabPlantHarvester class >> imageHighlight [

	^self image isStroked: false
]

{ #category : #'default value' }
CMReHabPlantHarvester class >> label_default [
	"Return the default value of label attribute"
	^'toto'
]

{ #category : #accessing }
CMReHabPlantHarvester class >> maxHarvest [
	maxHarvest ifNil: [maxHarvest := 2].
	^maxHarvest
]

{ #category : #accessing }
CMReHabPlantHarvester class >> maxHarvest: anObject [
	maxHarvest := anObject
]

{ #category : #'default value' }
CMReHabPlantHarvester class >> maxHarvest_default [
	"Return the default value of maxHarvest attribute"
	^2
]

{ #category : #'default value' }
CMReHabPlantHarvester class >> myClan_default [
	"Return the default value of myClan attribute"
	^nil
]

{ #category : #testing }
CMReHabPlantHarvester >> atHome [

	^self patch isNil or: [(self patch myCSE: CMReHabZone) isNil]
]

{ #category : #moving }
CMReHabPlantHarvester >> goBackHome [

	self myClan bringBackHomeMember: self
]

{ #category : #accessing }
CMReHabPlantHarvester >> harvest [
	"Getter accessor with default value = 0 "
	harvest isNil ifTrue:[harvest := 0].

	^harvest
]

{ #category : #accessing }
CMReHabPlantHarvester >> harvest: anObject [
	"Setter accessor of attribute harvest.
	!! This method was automatically generated by Cormas !!  "
	harvest = anObject ifTrue:[^nil].   "for optimization"
	harvest := anObject.
	self changed
]

{ #category : #info }
CMReHabPlantHarvester >> info_harvest [

	^(self myClan isNil or: [self myClan highlight not])
		ifTrue: ['']
		ifFalse: [self harvest printString]
]

{ #category : #accessing }
CMReHabPlantHarvester >> label [
	"Getter accessor with default value = 'toto' "
	label isNil ifTrue:[label := 'toto'].

	^label
]

{ #category : #accessing }
CMReHabPlantHarvester >> label: anObject [
	label := anObject
]

{ #category : #accessing }
CMReHabPlantHarvester >> myClan [

	^ myClan
]

{ #category : #accessing }
CMReHabPlantHarvester >> myClan: anObject [
	myClan := anObject
]

{ #category : #pov }
CMReHabPlantHarvester >> pov [

	^((self myClan isNil or: [self myClan highlight not]) ifTrue: [self class name] ifFalse: [self povHarvest])
]

{ #category : #pov }
CMReHabPlantHarvester >> povColor [
	self myClan ifNil: [ ^ self class name ].
	^ self myClan color ifNil: [ self colorOfNumber: self myClan id ]
		ifNotNil: [ self myClan color ]
]

{ #category : #pov }
CMReHabPlantHarvester >> povHarvest [

	^('harvest' , self harvest printString) asSymbol
]
