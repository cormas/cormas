baselines
baseline04: spec
	<version: '0.4-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'http://smalltalkhub.com/mc/SergeStinckwich/CORMAS/main'.
			spec
				package: 'Cormas-Core';
				package: 'Cormas-Model-ECEC';
				package: 'Cormas-Model-Conway';
				package: 'Cormas-Model-FireAutomata' ]