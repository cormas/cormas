versions
version031: spec
	<version: '0.31' imports: #('0.13-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.31'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '3:46:00.479129 pm'.
		spec 
			baseline: 'ClassEditor' ;
			baseline: 'FileDialog' ;
			project: 'CodeGenerator' with: '1.3';
			project: 'ProjectFramework' with: '1.2';
			project: 'Roassal2' with: '1.55';
			"project: 'SpecUIAddOns' with: '1.0';"
			project: 'Tabular' with: '0.2-baseline'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.207';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-NicolasBecu.22';
			package: 'Cormas-Model-DemoAggregates' with:'Cormas-Model-DemoAggregates-NicolasBecu.3';
			package: 'Cormas-Model-Diffuse' with: 'Cormas-Model-Diffuse-NicolasBecu.8';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-NicolasBecu.46';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-EtienneDelay.73';
			package: 'Cormas-OpenMole' with:'Cormas-OpenMole-EtienneDelay.3';
			package: 'Cormas-Tests' with: 'Cormas-Tests-EtienneDelay.24';
			package: 'Cormas-UI' with: 'Cormas-UI-NicolasBecu.73';
			package: #'Cormas-VW-Ported' with: 'Cormas-VW-Ported-HernanMoralesDurand.9'. ].
