version
systemInformationString

	^ String streamContents: [ : stream |
		stream 
			cr;
			nextPutAll: self currentVersion;
			cr; cr;
			nextPutAll: self licenseString;
			cr; cr;
			nextPutAll: self downloadString;
			cr; cr;
			nextPutAll: self contributors ]