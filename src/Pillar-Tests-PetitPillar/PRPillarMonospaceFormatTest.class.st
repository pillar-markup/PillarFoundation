Class {
	#name : #PRPillarMonospaceFormatTest,
	#superclass : #PRPillarFormatTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarMonospaceFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarMonospaceFormatTest >> actualClass [
	^ PRMonospaceFormat
]
