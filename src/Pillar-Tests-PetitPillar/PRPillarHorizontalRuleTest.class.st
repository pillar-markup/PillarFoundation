Class {
	#name : #PRPillarHorizontalRuleTest,
	#superclass : #PRPillarDocumentItemTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarHorizontalRuleTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarHorizontalRuleTest >> actualClass [
	^ PRHorizontalRule
]

{ #category : #'tests-parsing' }
PRPillarHorizontalRuleTest >> testParseBasic [
	| wiki text tree |
	wiki := '_'.
	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHorizontalRuleTest >> testParseLink [
	| wiki1 wiki2 text tree |
	wiki1 := '_ *link*'.
	wiki2 := '\_ *link*'.
	text := '_ link'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ ');
			add: (PRInternalLink new
				reference: 'link';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki1 equalsTree: tree.
	self assertWiki: wiki2 equalsTree: tree.
	self assertTree: tree equalsWiki: wiki2.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHorizontalRuleTest >> testParseMultiple [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '_' , nLine , '_' , nLine , nLine , '_'.
	text := self textString , nLine , self textString , nLine , nLine , self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		add: PRHorizontalRule new;
		add: PREmptyParagraph new;
		add: PRHorizontalRule new;
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHorizontalRuleTest >> testParseParagraph [
	| wiki text tree |
	wiki := '\_ is parsed as paragraph'.
	text := '_ is parsed as paragraph'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '_ is parsed as paragraph');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHorizontalRuleTest >> testParseSpaces [
	| wiki text tree |
	wiki := '_       '.
	text := self textString.
	tree := PRDocument new
		add: PRHorizontalRule new;
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: '_'.
	self assertTree: tree equalsText: text
]

{ #category : #private }
PRPillarHorizontalRuleTest >> textString [
	^ String new: 40 withAll: $-
]
