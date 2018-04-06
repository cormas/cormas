versions
version01: spec
	<version: '0.1' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.1'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '1/6/2015 10:33'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.5';
			package: 'Cormas-Tests-Core' with: 'Cormas-Tests-Core-SergeStinckwich.2';
			package: 'Cormas-model-ECEC' with: 'Cormas-model-ECEC-SergeStinckwich.2'. ].
