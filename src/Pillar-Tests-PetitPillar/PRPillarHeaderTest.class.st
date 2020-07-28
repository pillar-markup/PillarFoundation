Class {
	#name : #PRPillarHeaderTest,
	#superclass : #PRPillarDocumentGroupTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarHeaderTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarHeaderTest >> actualClass [
	^ PRHeader
]

{ #category : #'tests-comparing' }
PRPillarHeaderTest >> testEqualLevel [
	self deny: (self actualClass new level: 1) equals: (self actualClass new level: 2)
]

{ #category : #tests }
PRPillarHeaderTest >> testIsHeader [
	self assert: self actualInstance isHeader
]

{ #category : #'tests-accessing' }
PRPillarHeaderTest >> testName [
	self instance level: 3.
	self assert: self instance level equals: 3
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseEmpty [
	| wiki text tree |
	wiki := '!'.
	text := ''.
	tree := PRDocument new
		add: (PRHeader new
			level: 1;
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseLevel1 [
	| wiki text tree |
	wiki := '!foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseLevel2 [
	| wiki text tree |
	wiki := '!!foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 2;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseLevel3 [
	| wiki text tree |
	wiki := '!!!foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 3;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseLevel4 [
	| wiki text tree |
	wiki := '!!!!foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 4;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseLevel5 [
	| wiki text tree |
	wiki := '!!!!!foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 5;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseLevel6 [
	| wiki text tree |
	wiki := '!!!!!!foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 6;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseMultiline [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '!!Hello ""This is' , nLine , 'bold"" end' , nLine , 'new'.
	text := 'Hello This is' , nLine , 'bold end' , nLine , 'new'.
	tree := PRDocument new
		add:
				(PRHeader new
						level: 2;
						add: (PRText content: 'Hello ');
						add: (self addText: 'This is' , nLine , 'bold' to: PRBoldFormat new);
						add: (PRText content: ' end');
						yourself);
		add: (self addText: 'new' to: PRParagraph new);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseNested [
	| wiki text tree |
	wiki := '!!Hello *Link*'.
	text := 'Hello Link'.
	tree := PRDocument new
		add: (PRHeader new
			level: 2;
			add: (PRText content: 'Hello ');
			add: (PRInternalLink new
				reference: 'Link';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarHeaderTest >> testParseWithTrailingSpaces [
	| wiki text tree |
	wiki := '!  foo'.
	text := 'foo'.
	tree := PRDocument new
		add: ((PRHeader new)
			level: 1;
			add: (PRText content: 'foo');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-instantiation' }
PRPillarHeaderTest >> testWithAllLevel [
	instance := self actualClass withAll: self foobarInstances level: 3.
	self assert: self instance children size equals: 2.
	self assert: self instance children first equals: self fooInstance.
	self assert: self instance children second equals: self barInstance.
	self assert: self instance level equals: 3
]
