versions
version018: spec
	<version: '0.18' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.18'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-03-29T22:26:32.95006+02:00'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.128';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.17';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.11';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.17'. ]