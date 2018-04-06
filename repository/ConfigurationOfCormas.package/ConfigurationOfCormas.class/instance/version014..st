versions
version014: spec
	<version: '0.14' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.14'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '6/2/2015 09:14'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.110';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.12';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.7';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.13'. ]