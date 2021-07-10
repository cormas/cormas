Class {
	#name : #CMLoadLogException,
	#superclass : #CMLoadException,
	#category : #'Cormas-Core-Exceptions'
}

{ #category : #handling }
CMLoadLogException >> defaultAction [

	Stdio stdout 
		nextPutAll: ' ------------ Loading CORMAS project/model ------------';
		lf;
		nextPutAll: self messageText;
		lf;
		nextPutAll: ' ------------ Loading CORMAS project/model ------------';
		lf.

]
