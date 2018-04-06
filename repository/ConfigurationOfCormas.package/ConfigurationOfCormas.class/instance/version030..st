versions
version030: spec
	<version: '0.30' imports: #('0.10-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.30'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '1/9/2018 09:50'.
		spec 
			baseline: 'ClassEditor' ;
			baseline: 'FileDialog' ;
			project: 'CodeGenerator' with: '1.3';
			project: 'ProjectFramework' with: '1.2';
			project: 'Roassal2' with: '1.55';
			project: 'SpecUIAddOns' with: '1.0';
			project: 'Tabular' with: '0.2-baseline'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-HernanMoralesDurand.173';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-HernanMoralesDurand.16';
			package: 'Cormas-Model-Diffuse' with: 'Cormas-Model-Diffuse-HernanMoralesDurand.3';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-HernanMoralesDurand.39';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-HernanMoralesDurand.52';
			package: 'Cormas-Tests' with: 'Cormas-Tests-SergeStinckwich.3';
			package: 'Cormas-UI' with: 'Cormas-UI-HernanMoralesDurand.46';
			package: #'Cormas-VW-Ported' with: 'Cormas-VW-Ported-HernanMoralesDurand.6'. ].
