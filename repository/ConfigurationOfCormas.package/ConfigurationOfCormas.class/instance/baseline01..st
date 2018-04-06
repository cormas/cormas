baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/SergeStinckwich/CORMAS/main'.
		spec 
			package: 'Cormas-Core';
			package: 'Cormas-Tests-Core';
			package: 'Cormas-model-ECEC'. ].
