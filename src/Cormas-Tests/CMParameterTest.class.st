Class {
	#name : 'CMParameterTest',
	#superclass : 'TestCase',
	#instVars : [
		'fixtureClass'
	],
	#category : 'Cormas-Tests',
	#package : 'Cormas-Tests'
}

{ #category : 'running' }
CMParameterTest >> setUp [

	super setUp.
	fixtureClass := CMParameterFixture
]

{ #category : 'tests' }
CMParameterTest >> testBoolean [
	
	| parameter |
	
	parameter := CMBooleanParameter fromMethod: fixtureClass >> #bool.
	self assert: parameter class equals: CMBooleanParameter.
	self assert: parameter defaultValue equals: true.
	
	self assert: parameter name equals: 'bool'.
]

{ #category : 'tests' }
CMParameterTest >> testBooleanNamed [
	
	| parameter |
	
	parameter := CMBooleanParameter fromMethod: fixtureClass >> #boolNamed.
	self assert: parameter class equals: CMBooleanParameter.
	self assert: parameter defaultValue equals: true.
	
	self assert: parameter name equals: 'Boolean with name'.
]

{ #category : 'tests' }
CMParameterTest >> testEnum [
	
	| parameter |
	
	parameter := CMEnumParameter fromMethod: fixtureClass >> #enum.
	self assert: parameter class equals: CMEnumParameter.
	self assert: parameter values equals: #(sunny rainy cloudy).
	self assert: parameter defaultValue equals: #sunny.
	
	self assert: parameter name equals: 'enum'.
]

{ #category : 'tests' }
CMParameterTest >> testEnumNamed [
	
	| parameter |
	
	parameter := CMEnumParameter fromMethod: fixtureClass >> #enumNamed.
	self assert: parameter class equals: CMEnumParameter.
	self assert: parameter values equals: #(sunny rainy cloudy).
	self assert: parameter defaultValue equals: #sunny.
	
	self assert: parameter name equals: 'Enum with name'.
]

{ #category : 'tests' }
CMParameterTest >> testFloat [
	
	| parameter |
	
	parameter := CMFloatParameter fromMethod: fixtureClass >> #float.
	self assert: parameter class equals: CMFloatParameter.
	self assert: parameter defaultValue equals: 0.
	
	self assert: parameter name equals: 'float'.
]

{ #category : 'tests' }
CMParameterTest >> testFloatMinMax [
	
	| parameter |
	
	parameter := CMFloatParameter fromMethod: fixtureClass >> #floatMinMax.
	self assert: parameter class equals: CMFloatParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -1.
	self assert: parameter maxValue equals: 1.
	
	self assert: parameter name equals: 'floatMinMax'.
]

{ #category : 'tests' }
CMParameterTest >> testFloatMinMaxNamed [
	
	| parameter |
	
	parameter := CMFloatParameter fromMethod: fixtureClass >> #floatMinMaxNamed.
	self assert: parameter class equals: CMFloatParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -1.
	self assert: parameter maxValue equals: 1.
	
	self assert: parameter name equals: 'Float with min, max and name'.
]

{ #category : 'tests' }
CMParameterTest >> testFloatMinMaxStep [
	
	| parameter |
	
	parameter := CMFloatParameter fromMethod: fixtureClass >> #floatMinMaxStep.
	self assert: parameter class equals: CMFloatParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -1.
	self assert: parameter maxValue equals: 1.
	self assert: parameter step equals: 0.1.
	
	self assert: parameter name equals: 'floatMinMaxStep'.
]

{ #category : 'tests' }
CMParameterTest >> testFloatMinMaxStepNamed [
	
	| parameter |
	
	parameter := CMFloatParameter fromMethod: fixtureClass >> #floatMinMaxStepNamed.
	self assert: parameter class equals: CMFloatParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -1.
	self assert: parameter maxValue equals: 1.
	self assert: parameter step equals: 0.1.
	
	self assert: parameter name equals: 'Float with min, max, step and name'.
]

{ #category : 'tests' }
CMParameterTest >> testFloatNamed [
	
	| parameter |
	
	parameter := CMFloatParameter fromMethod: fixtureClass >> #floatNamed.
	self assert: parameter class equals: CMFloatParameter.
	self assert: parameter defaultValue equals: 0.
	
	self assert: parameter name equals: 'Float with name'.
]

{ #category : 'tests' }
CMParameterTest >> testInteger [
	
	| parameter |
	
	parameter := CMIntegerParameter fromMethod: fixtureClass >> #int.
	self assert: parameter class equals: CMIntegerParameter.
	self assert: parameter defaultValue equals: 0.
	
	self assert: parameter name equals: 'int'.
]

{ #category : 'tests' }
CMParameterTest >> testIntegerMinMax [
	
	| parameter |
	
	parameter := CMIntegerParameter fromMethod: fixtureClass >> #intMinMax.
	self assert: parameter class equals: CMIntegerParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -10.
	self assert: parameter maxValue equals: 20.
	
	self assert: parameter name equals: 'intMinMax'.
]

{ #category : 'tests' }
CMParameterTest >> testIntegerMinMaxNamed [
	
	| parameter |
	
	parameter := CMIntegerParameter fromMethod: fixtureClass >> #intMinMaxNamed.
	self assert: parameter class equals: CMIntegerParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -10.
	self assert: parameter maxValue equals: 20.
	
	self assert: parameter name equals: 'Integer with min, max and name'.
]

{ #category : 'tests' }
CMParameterTest >> testIntegerMinMaxStep [
	
	| parameter |
	
	parameter := CMIntegerParameter fromMethod: fixtureClass >> #intMinMaxStep.
	self assert: parameter class equals: CMIntegerParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -10.
	self assert: parameter maxValue equals: 20.
	self assert: parameter step equals: 2.
	
	self assert: parameter name equals: 'intMinMaxStep'.
]

{ #category : 'tests' }
CMParameterTest >> testIntegerMinMaxStepNamed [
	
	| parameter |
	
	parameter := CMIntegerParameter fromMethod: fixtureClass >> #intMinMaxStepNamed.
	self assert: parameter class equals: CMIntegerParameter.
	self assert: parameter defaultValue equals: 0.
	self assert: parameter minValue equals: -10.
	self assert: parameter maxValue equals: 20.
	self assert: parameter step equals: 2.
	
	self assert: parameter name equals: 'Integer with min, max, step and name'.
]

{ #category : 'tests' }
CMParameterTest >> testIntegerNamed [
	
	| parameter |
	
	parameter := CMIntegerParameter fromMethod: fixtureClass >> #intNamed.
	self assert: parameter class equals: CMIntegerParameter.
	self assert: parameter defaultValue equals: 0.
	
	self assert: parameter name equals: 'Integer with name'.
]
