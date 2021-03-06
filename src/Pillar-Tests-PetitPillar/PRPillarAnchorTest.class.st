Class {
	#name : #PRPillarAnchorTest,
	#superclass : #PRPillarDocumentItemTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarAnchorTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarAnchorTest >> actualClass [
	^ PRAnchor
]

{ #category : #'tests-parsing' }
PRPillarAnchorTest >> testParseBasic [
	| wiki text tree |
	wiki := '@name'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'name');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarAnchorTest >> testParseMultiple [
	| wiki text tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '@one' , nLine , '@two' , nLine , nLine , '@tree'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one');
		add: (PRAnchor named: 'two');
		add: PREmptyParagraph new;
		add: (PRAnchor named: 'tree');
		yourself.
	self 
		assertWiki: wiki
		equalsTree: tree.
	self 
		assertTree: tree
		equalsWiki: wiki.
	self 
		assertTree: tree
		equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarAnchorTest >> testParseSpaces [
	| wiki text tree |
	wiki := '@one two'.
	text := ''.
	tree := PRDocument new
		add: (PRAnchor named: 'one two');
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
