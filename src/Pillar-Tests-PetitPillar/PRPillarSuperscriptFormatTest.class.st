Class {
	#name : #PRPillarSuperscriptFormatTest,
	#superclass : #PRPillarFormatTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarSuperscriptFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarSuperscriptFormatTest >> actualClass [
	^ PRSuperscriptFormat
]
