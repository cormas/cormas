versions
version020: spec
	<version: '0.20' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.20'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-04-03T15:26:10.057156+02:00'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.137';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.19';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.15';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.22'. ]