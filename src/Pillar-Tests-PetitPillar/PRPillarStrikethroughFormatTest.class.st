Class {
	#name : #PRPillarStrikethroughFormatTest,
	#superclass : #PRPillarFormatTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarStrikethroughFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarStrikethroughFormatTest >> actualClass [
	^ PRStrikethroughFormat
]
