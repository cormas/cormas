versions
version022: spec
	<version: '0.22' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.22'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-09-20T09:41:32.621469+02:00'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-NickPapoulias.148';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.19';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.15';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-NickPapoulias.48';
			package: 'Cormas-Model-Diffuse' with:'Cormas-Model-Diffuse-SergeStinckwich.1'.]