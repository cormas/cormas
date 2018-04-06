versions
version025: spec
	<version: '0.25' imports: #('0.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.25'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '9/20/2017 15:49'.
		spec 
"			baseline: 'DeployUtils' ;"
			project: 'ProjectFramework' with: '1.2';
			project: 'Roassal2' with: '1.49';
			project: 'SpecUIAddOns' with: '0.2-baseline'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-HernanMoralesDurand.158';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.15';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-JigyasaGrover.36';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-NickPapoulias.49';
			package: 'Cormas-Tests' with: 'Cormas-Tests-SergeStinckwich.3';
			package: 'Cormas-UI' with: 'Cormas-UI-HernanMoralesDurand.14';
			package: #'Cormas-VW-Ported' with: 'Cormas-VW-Ported-HernanMoralesDurand.1'. ].
