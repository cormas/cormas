versions
version013: spec
	<version: '0.13' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.13'.
		spec author: 'SergeStinckwich'.
		spec timestamp: '5/29/2015 07:28'.
		spec 
			package: 'Cormas-Core' with: 'Cormas-Core-SergeStinckwich.100';
			package: 'Cormas-HotDraw-Tools' with: 'Cormas-HotDraw-Tools-SergeStinckwich.5';
			package: 'Cormas-Model-ECEC' with: 'Cormas-Model-ECEC-SergeStinckwich.10';
			package: 'Cormas-Model-Conway' with: 'Cormas-Model-Conway-SergeStinckwich.5';
			package: 'Cormas-Model-FireAutomata' with: 'Cormas-Model-FireAutomata-SergeStinckwich.9'. ]