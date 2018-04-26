initialize-release
openOnEntity: aE attribute: att model: aModel
	
	| a |
	a := self new.
	a cormasModel: aModel.
	a initForEntity: aE attribute: att