Class {
	#name : #PRPillarBoldFormatTest,
	#superclass : #PRPillarFormatTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarBoldFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarBoldFormatTest >> actualClass [
	^ PRBoldFormat
]
