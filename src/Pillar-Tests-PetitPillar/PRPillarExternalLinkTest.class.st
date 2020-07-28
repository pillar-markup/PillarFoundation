Class {
	#name : #PRPillarExternalLinkTest,
	#superclass : #PRPillarLinkTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarExternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarExternalLinkTest >> actualClass [
	^ PRExternalLink
]

{ #category : #private }
PRPillarExternalLinkTest >> referenceString [
	^ 'http://www.lukas-renggli.ch'
]

{ #category : #tests }
PRPillarExternalLinkTest >> testIsExternal [
	self assert: self instance isExternal
]

{ #category : #tests }
PRPillarExternalLinkTest >> testLinkToAFigureIsExternalLink [
	| wiki text tree |
	wiki := '*file://foo.png*'.
	text := self actualClass new
		reference: 'file://foo.png';
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'file://foo.png';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRPillarExternalLinkTest >> testTitle [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance title equals: 'http://www.lukas-renggli.ch'
]

{ #category : #'tests-accessing' }
PRPillarExternalLinkTest >> testUrl [
	self instance reference: 'http://www.lukas-renggli.ch'.
	self assert: self instance url equals: 'http://www.lukas-renggli.ch'
]
