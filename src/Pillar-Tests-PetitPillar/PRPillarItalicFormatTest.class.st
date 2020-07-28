Class {
	#name : #PRPillarItalicFormatTest,
	#superclass : #PRPillarFormatTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarItalicFormatTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarItalicFormatTest >> actualClass [
	^ PRItalicFormat
]
