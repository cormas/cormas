baselines
baseline010: spec
	<version: '0.10-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec postLoadDoIt: #postLoad.
		spec repository: 'http://smalltalkhub.com/mc/SergeStinckwich/CORMAS/main'.
		spec 
			baseline: 'ClassEditor' 
			with: [ spec repository: 'github://openponk/class-editor/repository' ];
			baseline: 'FileDialog'
			with: [ spec repository: 'github://peteruhnak/file-dialog/repository' ];
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'SpecUIAddOns' with: [
				spec
					className: #ConfigurationOfSpecUIAddOns;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/SpecUIAddOns/main/' ];
			project: 'Tabular' with: [
				spec
					className: #ConfigurationOfTabular;
					versionString: #'development';
					repository: 'http://ss3.gemtalksystems.com/ss/Tabular' ].
		spec 
			package: 'Cormas-Core';
			package: 'Cormas-Model-Conway';
			package: 'Cormas-Model-Diffuse';
			package: 'Cormas-Model-ECEC';
			package: 'Cormas-Model-FireAutomata';
			package: 'Cormas-Tests';
			package: 'Cormas-UI' with: [
				spec requires: #('FileDialog' 'ProjectFramework' 'CodeGenerator' 'Roassal2' ). ];
			package: #'Cormas-VW-Ported'.
		spec 
			group: 'All' with: #(#'Cormas-VW-Ported' 'Cormas-UI' 'Cormas-Tests' 'Cormas-Model-FireAutomata' 'Cormas-Model-ECEC' 'Cormas-Model-Conway' 'Cormas-Core' 'ClassEditor' 'Cormas-Model-Diffuse');
			group: 'Core' with: #('Cormas-Core' );
			group: 'Models' with: #('Cormas-Model-Conway' 'Cormas-Core' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' );
			group: 'Tests' with: #('Cormas-Core' 'Cormas-Tests' );
			group: 'UI' with: #(#'Cormas-UI' 'Cormas-Core' 'Cormas-Model-Conway' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' ). ].
