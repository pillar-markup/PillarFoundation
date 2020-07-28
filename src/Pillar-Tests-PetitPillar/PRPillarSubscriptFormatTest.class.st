Class {
	#name : #PRPillarSubscriptFormatTest,
	#superclass : #PRPillarFormatTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarSubscriptFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarSubscriptFormatTest >> actualClass [
	^ PRSubscriptFormat
]
