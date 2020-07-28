Class {
	#name : #PRPillarSectionTest,
	#superclass : #PRPillarDocumentGroupTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarSectionTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarSectionTest >> actualClass [
	^ PRSection
]
