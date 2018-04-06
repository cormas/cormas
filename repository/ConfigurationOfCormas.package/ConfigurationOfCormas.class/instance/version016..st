versions
version016: spec
	<version: '0.16' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.16'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-03-26T19:27:23.016354+01:00'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.120';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-nbecu.16';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.9';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.15'. ]