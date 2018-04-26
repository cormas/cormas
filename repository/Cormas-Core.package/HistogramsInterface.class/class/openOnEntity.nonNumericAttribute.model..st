initialize-release
openOnEntity: aE nonNumericAttribute: att model: aModel
	
	| a |
	a := self new.
	a cormasModel: aModel.
	a attributeType: #NotNumeric.
	a initForEntity: aE attribute: att