versions
version019: spec
	<version: '0.19' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.19'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-04-01T19:35:03.034345+02:00'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.135';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.17';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.13';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.21'. ]