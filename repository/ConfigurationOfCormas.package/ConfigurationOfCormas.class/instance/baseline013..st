baselines
baseline013: spec
	<version: '0.13-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec postLoadDoIt: #postLoad.		
		spec repository: 'http://ss3.gemtalksystems.com/ss/Cormas'.
 		spec 
			baseline: 'ClassEditor' 
			with: [ spec repository: 'github://openponk/class-editor/repository' ];
			baseline: 'FileDialog'
			with: [ spec repository: 'github://peteruhnak/file-dialog/repository' ];
			baseline: 'ProjectFramework' 
			with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ];
			baseline: 'SpecUIAddOns' 
			with: [ spec repository: 'github://hernanmd/SpecUIAddOns/repository' ];
			baseline: 'CodeGenerator' 
			with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];

			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'Tabular' with: [
				spec
					className: #ConfigurationOfTabular;
					versionString: #'development';
					repository: 'http://ss3.gemtalksystems.com/ss/Tabular' ];
			project: 'NeoJSON' with: [
				spec
					className: 'ConfigurationOfNeoJSON';
					version: #stable;
					repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main' ].		
		spec 
			package: 'Cormas-Core';
			package: 'Cormas-Model-Conway';
			package: #'Cormas-Model-DemoAggregates';
			package: 'Cormas-Model-Diffuse';
			package: 'Cormas-Model-ECEC';
			package: 'Cormas-Model-FireAutomata';
			package: 'Cormas-Tests';
			package: 'Cormas-UI' with: [
				spec requires: #('FileDialog' 'ProjectFramework' 'CodeGenerator' 'Roassal2' ). ];
			package: #'Cormas-VW-Ported'.
		spec 
			group: 'All' with: #(#'Cormas-VW-Ported' 'Cormas-UI' 'Cormas-Tests' 'Cormas-Model-FireAutomata' 'Cormas-Model-ECEC' 'Cormas-Model-Conway' 'Cormas-Core' 'ClassEditor' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' );
			group: 'Core' with: #('Cormas-Core' );
			group: 'Models' with: #('Cormas-Model-Conway' 'Cormas-Core' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' );
			group: 'Tests' with: #('Cormas-Core' 'Cormas-Tests' );
			group: 'UI' with: #(#'Cormas-UI' 'Cormas-Core' 'Cormas-Model-Conway' 'Cormas-Model-ECEC' 'Cormas-Model-FireAutomata' 'Cormas-Model-Diffuse' #'Cormas-Model-DemoAggregates' ). ].
