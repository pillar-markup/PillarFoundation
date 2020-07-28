Class {
	#name : #PRPillarUnderlineFormatTest,
	#superclass : #PRPillarFormatTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarUnderlineFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarUnderlineFormatTest >> actualClass [
	^ PRUnderlineFormat
]
