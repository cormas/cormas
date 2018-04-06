versions
version012: spec
	<version: '0.12' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.12'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '5/26/2015 16:58'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.91';
			package: 'Cormas-HotDraw-Tools' with: 'Cormas-HotDraw-Tools-SergeStinckwich.5';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.10';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.5';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.9'. ]