- utilities - binary storage
representBinaryOn33: aBOSSWriter
	"This method is called from CormasModel #saveBOS: aCollection into: aFileName to save a collection of agents using BOSS. Thus, each class to be saved must redefine this method.
The basic approach is to create an instance method named representBinaryOn: in the class whose BOSS representation you want to customize. The method typically returns a MessageSend, which is created by sending a receiver:selector:arguments: message to that class. The receiver argument identifies the class that is to create an instance, typically the object's class. The selector argument is the name of the instance-creation method that is to be used when the data is read by BOSS. The arguments argument is a collection of data values, typically the values of the object's instance variables.
Exemple of redefinition: we want to save the attributs 'name' and 'cashbox' of an agent :
representBinaryOn: aBOSSWriter
	| msg | 
	msg := super representBinaryOn: aBOSSWriter.
	msg arguments first add: self name; add: self cashbox.
	^msg

To load Boss object, boss will call a class method: #newBoss:. 
To redefine newBoss: it could be as following:
newBoss: attributList 
	| ag |
	ag := super newBoss: (attributList copyFrom: 1 to: 3).
	3 timesRepeat: [attributList removeFirst].
	attributList with: #(#name: #cashbox:)
		do: [:array1Element :array2Element | ag perform: array2Element with: array1Element].
"
	
	| msg |
	msg := super representBinaryOn: aBOSSWriter.
	self patch isNil
		ifTrue: [msg arguments first add: nil]
		ifFalse: [msg arguments first add: self patch id].
	^msg