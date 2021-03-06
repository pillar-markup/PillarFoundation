Class {
	#name : #PRPillarMailLinkTest,
	#superclass : #PRPillarExternalLinkTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #private }
PRPillarMailLinkTest >> actualClass [
	^ PRMailLink
]

{ #category : #private }
PRPillarMailLinkTest >> referenceString [
	^ 'renggli@gmail.com'
]

{ #category : #'tests-parsing' }
PRPillarMailLinkTest >> testParseBogus [
	| wiki text tree |
	wiki := '*ab12@x.com*'.
	text := 'ab12@x.com'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: 'ab12@x.com';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
