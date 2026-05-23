Class {
	#name : 'CMParameterFixture',
	#superclass : 'Object',
	#instVars : [
		'bool',
		'boolNamed',
		'enum',
		'enumNamed',
		'int',
		'intNamed',
		'intMinMax',
		'intMinMaxNamed',
		'intMinMaxStep',
		'intMinMaxStepNamed',
		'float',
		'floatMinMax',
		'floatMinMaxNamed',
		'floatMinMaxStep',
		'floatMinMaxStepNamed',
		'floatNamed'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'accessing' }
CMParameterFixture >> bool [
	<parameterBooleanDefault: true>
	^ bool
]

{ #category : 'accessing' }
CMParameterFixture >> bool: anObject [

	bool := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> boolNamed [
	<parameterBoolean: 'Boolean with name' default: true>
	^ boolNamed
]

{ #category : 'accessing' }
CMParameterFixture >> boolNamed: anObject [

	boolNamed := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> enum [
	<parameterValues: #(sunny rainy cloudy) default: #sunny>
	^ enum
]

{ #category : 'accessing' }
CMParameterFixture >> enum: anObject [

	enum := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> enumNamed [
	<parameter: 'Enum with name' values: #(sunny rainy cloudy) default: #sunny>
	^ enumNamed
]

{ #category : 'accessing' }
CMParameterFixture >> enumNamed: anObject [

	enumNamed := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> float [
	<parameterFloatDefault: 0>
	^ float
]

{ #category : 'accessing' }
CMParameterFixture >> float: anObject [

	float := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMax [
	<parameterFloatMin: -1 max: 1 default: 0>
	^ floatMinMax
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMax: anObject [

	floatMinMax := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMaxNamed [
	<parameterFloat: 'Float with min, max and name' min: -1 max: 1 default: 0>
	^ floatMinMaxNamed
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMaxNamed: anObject [

	floatMinMaxNamed := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMaxStep [
	<parameterFloatMin: -1 max: 1 step: 0.1 default: 0>
	^ floatMinMaxStep
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMaxStep: anObject [

	floatMinMaxStep := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMaxStepNamed [
	<parameterFloat: 'Float with min, max, step and name' min: -1 max: 1 step: 0.1 default: 0>
	^ floatMinMaxStepNamed
]

{ #category : 'accessing' }
CMParameterFixture >> floatMinMaxStepNamed: anObject [

	floatMinMaxStepNamed := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> floatNamed [
	<parameterFloat: 'Float with name' default: 0>
	^ floatNamed
]

{ #category : 'accessing' }
CMParameterFixture >> floatNamed: anObject [

	floatNamed := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> int [
	<parameterIntegerDefault: 0>
	^ int
]

{ #category : 'accessing' }
CMParameterFixture >> int: anObject [

	int := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMax [
	<parameterIntegerMin: -10 max: 20 default: 0>
	^ intMinMax
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMax: anObject [

	intMinMax := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMaxNamed [
	<parameterInteger: 'Integer with min, max and name' min: -10 max: 20 default: 0>
	^ intMinMaxNamed
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMaxNamed: anObject [

	intMinMaxNamed := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMaxStep [
	<parameterIntegerMin: -10 max: 20 step: 2 default: 0>
	^ intMinMaxStep
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMaxStep: anObject [

	intMinMaxStep := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMaxStepNamed [
	<parameterInteger: 'Integer with min, max, step and name' min: -10 max: 20 step: 2 default: 0>
	^ intMinMaxStepNamed
]

{ #category : 'accessing' }
CMParameterFixture >> intMinMaxStepNamed: anObject [

	intMinMaxStepNamed := anObject
]

{ #category : 'accessing' }
CMParameterFixture >> intNamed [
	<parameterInteger: 'Integer with name' default: 0>
	^ intNamed
]

{ #category : 'accessing' }
CMParameterFixture >> intNamed: anObject [

	intNamed := anObject
]
