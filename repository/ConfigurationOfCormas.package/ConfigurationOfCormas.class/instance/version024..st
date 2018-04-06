versions
version024: spec
	<version: '0.24' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.24'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '2016-09-20T16:59:20.243186+02:00'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.153';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-NickPapoulias.34';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.15';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-NickPapoulias.49';
			package: 'Cormas-Model-Diffuse' with:'Cormas-Model-Diffuse-SergeStinckwich.1'.]