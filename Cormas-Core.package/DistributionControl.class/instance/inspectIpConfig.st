actions
inspectIpConfig
	
	| p response |
	p := WinProcess new.
	p encoding: #cp437.
	response := p fork: 'netsh' arguments: #('interface' 'ip' 'show' 'config').
	response inspect