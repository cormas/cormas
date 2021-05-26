Extension { #name : #StringTest }

{ #category : #'*Cormas-Tests' }
StringTest >> testAsValidCormasClassName [

	self assert: ('Entity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('CMEntity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: (' Entity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: (' CMEntity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('Entity ' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('CMEntity ' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('Ent ity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('CM Entity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('Ent  ity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('CM   Entity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('123Entity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('1CMEntity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('Entity321' asValidCormasClassName: 'Project1') equals: #CMProject1Entity321.
	self assert: ('CMEntity321' asValidCormasClassName: 'Project1') equals: #CMProject1Entity321.
	self assert: ('Entity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.
	self assert: ('CMEntity' asValidCormasClassName: 'Project1') equals: #CMProject1Entity.

	self should: [ 'CMEntity' asValidCormasClassName: '' ] raise: Error.
	self should: [ '' asValidCormasClassName: 'Project1' ] raise: Error.
]
