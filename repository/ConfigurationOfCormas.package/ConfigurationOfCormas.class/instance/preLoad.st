doits
preLoad
	" Private - Execute post install actions "

	self ensureMetacelloFileDownload.
	super preLoad.
	self preLoadConfiguration.	
