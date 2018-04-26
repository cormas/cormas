model entities
createIdProtocol: newClass
	"c'est inutile !"
	"newClass addClassVarName: 'CurrentId'.
	newClass class compile: 'CurrentId\	^CurrentId isNil \		ifTrue: [0] \		ifFalse: [CurrentId]' withCRs
		classified: 'id'
		notifying: nil.
	newClass class compile: 'CurrentId: x\	^CurrentId := x' withCRs
		classified: 'id'
		notifying: nil.
	newClass
		compile: 'initId\	self id: (self class CurrentId: self class CurrentId + 1)' withCRs
		classified: 'init'
		notifying: nil"
	
	