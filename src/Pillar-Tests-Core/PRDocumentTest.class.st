Class {
	#name : #PRDocumentTest,
	#superclass : #PRDocumentGroupTest,
	#category : #'Pillar-Tests-Core'
}

{ #category : #testing }
PRDocumentTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRDocumentTest >> actualClass [
	^ PRDocument
]
