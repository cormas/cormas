Class {
	#name : #CMEnv2CellsConverterTest,
	#superclass : #TestCase,
	#instVars : [
		'converter'
	],
	#category : #'Cormas-Tests'
}

{ #category : #running }
CMEnv2CellsConverterTest >> setUp [
	super setUp.
	converter := CMEnv2CellsConverter new
]

{ #category : #running }
CMEnv2CellsConverterTest >> testConvert [
	| env cells |
	env := 'dimensions      2 3
cloture closed
connexite       six
ignore what i do not know
attributs       bool(Boolean) num(Number) undefined(nil)
true,1.2,nil
false,-3.4,nil
nil,1,nil
false,2,nil
nil,-5,nil
true,nil,nil'.
	cells := 'dimensions: [2, 3]
closure: closed
connectivity: six
attributes_defs:
 bool: Boolean
 num: Number
 undefined: nil
attributes_values:
 bool:
  - [true,false]
  - [nil,false]
  - [nil,true]
 num:
  - [1.2,-3.4]
  - [1,2]
  - [-5,nil]
 undefined:
  - [nil,nil]
  - [nil,nil]
  - [nil,nil]'.
	self
		assert: (converter convert: env readStream) trim
		equals: cells trim
]

{ #category : #running }
CMEnv2CellsConverterTest >> testConvertInto [
	| env cells |
	env := 'dimensions      2 3
cloture closed
connexite       six
ignore what i do not know
attributs       bool(Boolean) num(Number) undefined(nil)
true,1.2,nil
false,-3.4,nil
nil,1,nil
false,2,nil
nil,-5,nil
true,nil,nil'.
	cells := 'dimensions: [2, 3]
closure: closed
connectivity: six
attributes_defs:
 bool: Boolean
 num: Number
 undefined: nil
attributes_values:
 bool:
  - [true,false]
  - [nil,false]
  - [nil,true]
 num:
  - [1.2,-3.4]
  - [1,2]
  - [-5,nil]
 undefined:
  - [nil,nil]
  - [nil,nil]
  - [nil,nil]'.
	self
		assert:
			(String
				streamContents: [ :stream | converter convert: env readStream into: stream ])
				trim withInternalLineEndings
		equals: cells trim
]
