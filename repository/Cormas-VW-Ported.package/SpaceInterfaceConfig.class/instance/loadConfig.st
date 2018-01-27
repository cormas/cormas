actions
loadConfig
	
	| collec choice |
	collec := self spaceInterface cormasModel habitusNames.
	choice := Dialog
		choose: 'Choose a configuration'
		fromList: collec
		values: collec
		lines: 8
		cancel: [nil].
	choice ifNil: [^nil].
	self loadConfigName: choice