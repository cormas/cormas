"
The objective of this class is to provide a method to facilitate the integration of methods and models developed with the previous version under visual work
"
Class {
	#name : #CMCompatibilityVW,
	#superclass : #Object,
	#category : #'Cormas-Core-Communication'
}

{ #category : #'as yet unclassified' }
CMCompatibilityVW class >> overpassNameSpaceFor: myImportedpackage with:  packagesName [
"You provide a package name this method convert oldfashone name in the pharo fashone without name space. "
| newClassPrefix env model |
newClassPrefix := 'CM'.
env := RBBrowserEnvironment new forPackageNames:  myImportedpackage .
model := (RBClassModelFactory rbNamespace onEnvironment: env) name: packagesName; yourself.

RBClassRegexRefactoring new
  model: model;
  renameClasses;
  replace: '^(.*)$' with: newClassPrefix , '$1';
  execute.
]
