Class {
	#name : #PRPillarListTest,
	#superclass : #PRPillarDocumentGroupTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #private }
PRPillarListTest >> actualClass [
	^ PRList
]

{ #category : #private }
PRPillarListTest >> listItemClass [
	^ PRListItem
]

{ #category : #private }
PRPillarListTest >> listItemWithText: aString [
	^ self listItemClass new
		add: (PRText content: aString);
		yourself
]

{ #category : #'tests-parsing' }
PRPillarListTest >> testParseEmpty [
	| wiki text tree |
	wiki := self wikiString.
	text := self textString: 1 level: 1.
	tree := PRDocument new
		add: (self actualClass new
			add: self listItemClass new;
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarListTest >> testParseFlat [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1st' , nLine , self wikiString , '2nd' , nLine , self wikiString , '3rd'.
	text := (self textString: 1 level: 1) , '1st' , nLine , (self textString: 2 level: 1) , '2nd' , nLine
		, (self textString: 3 level: 1) , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarListTest >> testParseMultiple [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := self wikiString , '1st' , nLine , self wikiString , '2nd' , nLine , nLine , self wikiString , '3rd'.
	text := (self textString: 1 level: 1) , '1st' , nLine , (self textString: 2 level: 1) , '2nd' , nLine , nLine
		, (self textString: 1 level: 1) , '3rd'.
	tree := PRDocument new
		add:
				(self actualClass new
						add: (self listItemWithText: '1st');
						add: (self listItemWithText: '2nd');
						yourself);
		add: PREmptyParagraph new;
		add:
				(self actualClass new
						add: (self listItemWithText: '3rd');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarListTest >> testParseWithTrailingSpaces [
	| wiki tree |
	wiki := self wikiString , ' 1st'.
	tree := PRDocument new
		add:
			(self actualClass new
				add: (self listItemWithText: '1st');
				yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree
]

{ #category : #private }
PRPillarListTest >> textString: anObject level: anInteger [
	^ (2 to: anInteger) inject: '' into: [ :result :each | result , '	' ]
]

{ #category : #private }
PRPillarListTest >> wikiString [
	self subclassResponsibility
]
