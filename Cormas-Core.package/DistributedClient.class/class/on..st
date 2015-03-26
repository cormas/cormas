instance creation
on: aDistributionControl
	
	^(self new)
		distributionControl: aDistributionControl;
		hostName: aDistributionControl broker accessPoint hostName;
		port: aDistributionControl broker accessPoint port;
		habitusNames: aDistributionControl habitusNames selections asArray;
		yourself