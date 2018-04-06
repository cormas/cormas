versions
version017: spec
	<version: '0.17' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.17'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-03-28T18:09:07.844913+02:00'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.128';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-nbecu.16';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.9';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.15'. ]