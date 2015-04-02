version
updateModelToCurrentCormasVersion
	"Test if the model should be convert to Cormas2010.06 format (Add 'isAbstract' information)"
	
	((self cormasModelClass class findSelector: #cormasCompatibleVersion)
		isNil
		or:
			[(self cormasModelClass cormasCompatibleVersion at: 1) * 100
				+ (self cormasModelClass cormasCompatibleVersion at: 2) < 201006])
		ifTrue: [self convertToCormas201006].	"Test if the model should be convert to Cormas2011 format (Add '_default' parameters)"
	((self cormasModelClass class findSelector: #cormasCompatibleVersion)
		isNil
		or:
			[(self cormasModelClass cormasCompatibleVersion at: 1) * 100
				+ (self cormasModelClass cormasCompatibleVersion at: 2) < 201111])
		ifTrue: [self convertToCormas2011]