Class {
	#name : #PRPillarAnnotatedParagraphTest,
	#superclass : #PRPillarDocumentGroupTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarAnnotatedParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarAnnotatedParagraphTest >> actualClass [
	^ PRAnnotatedParagraph
]

{ #category : #'tests-parsing' }
PRPillarAnnotatedParagraphTest >> testParseBasic [
	| wiki text tree |
	wiki := '@@foo bar zork'.
	text := 'bar zork'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			add: (PRText content: 'bar zork');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarAnnotatedParagraphTest >> testParseEmptyFollwedByPreformatted [
	| wiki text tree nLine|
	nLine := Smalltalk os lineEnding.
	wiki := '@@foo' , nLine , '= bar'.
	text := nLine , 'bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		add: (PRPreformatted new
			add: (PRText content: 'bar');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarAnnotatedParagraphTest >> testParseOnlyAnnotation [
	| wiki text tree |
	wiki := '@@foo'.
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: 'foo';
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarAnnotatedParagraphTest >> testParseOnlyNothing [
	| wiki text tree |
	wiki := '@@'.
	text := ''.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			annotation: '';
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarAnnotatedParagraphTest >> testParseOnlyText [
	| wiki text tree |
	wiki := '@@ foo bar'.
	text := 'foo bar'.
	tree := PRDocument new
		add: (PRAnnotatedParagraph new
			add: (PRText content: 'foo bar');
			annotation: '';
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
