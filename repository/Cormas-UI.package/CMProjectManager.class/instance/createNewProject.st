callbacks
createNewProject
	" Private - See superimplementor's comment "
	
	| answer |

	(answer := self requestMessage: self translator tNewProjectName) isEmptyOrNil 
		ifFalse: [ 
			self createAppProject: answer.
			self fsm handleEvent: #actionNew.
			(CMSpecModelComments for: self) openWithSpec ]
		ifTrue: [ self informMessage: self translator tNewProjectEmptyName ].

