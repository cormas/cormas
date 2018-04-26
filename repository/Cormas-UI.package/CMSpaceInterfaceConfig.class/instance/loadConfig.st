actions
loadConfig
	
	| collec |
	collec := self spaceInterface cormasModel habitusNames.
	^ (self requestFrom: collec message: self translator tChooseConfig title: 'CORMAS')
		ifNotNil: [ : choice | self loadConfigName: choice ] 
		ifNil: [ nil ]
	