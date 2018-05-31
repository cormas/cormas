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
			"project: 'SpecUIAddOns' with: '1.0';"
			project: 'Tabular' with: '0.2-baseline'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-NickPapoulias.195';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.18';
			package: 'Cormas-Model-Diffuse' with: 'Cormas-Model-Diffuse-HernanMoralesDurand.3';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-NickPapoulias.41';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-NickPapoulias.53';
			package: 'Cormas-Tests' with: 'Cormas-Tests-EtienneD.13';
			package: 'Cormas-UI' with: 'Cormas-UI-NickPapoulias.59';
			package: #'Cormas-VW-Ported' with: 'Cormas-VW-Ported-HernanMoralesDurand.9'. ].
