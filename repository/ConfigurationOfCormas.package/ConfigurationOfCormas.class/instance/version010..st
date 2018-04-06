versions
version010: spec
	<version: '0.10' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.10'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '4/21/2015 17:20'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.75';
			package: 'Cormas-HotDraw-Tools' with: 'Cormas-HotDraw-Tools-SergeStinckwich.5';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.5';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.5';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.6'. ]
