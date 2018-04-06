versions
version015: spec
	<version: '0.15' imports: #('0.4-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.15'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '11/19/2015 15:10'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-nbecu.119';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-nbecu.16';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-nbecu.8';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-nbecu.14'. ]