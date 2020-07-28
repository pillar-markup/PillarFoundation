Class {
	#name : #PRPillarPreformattedTest,
	#superclass : #PRPillarDocumentGroupTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarPreformattedTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarPreformattedTest >> actualClass [
	^ PRPreformatted
]

{ #category : #'tests-parsing' }
PRPillarPreformattedTest >> testParseBasic [
	| wiki text tree |
	wiki := '= Line'.
	text := 'Line'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: 'Line');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarPreformattedTest >> testParseEmpty [
	| wiki text tree |
	wiki := '= '.
	text := ''.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarPreformattedTest >> testParseMultiple [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '= line 1.1' , nLine , '= line 1.2' , nLine , nLine , '= line 2.1'.
	text := 'line 1.1' , nLine , 'line 1.2' , nLine , nLine , 'line 2.1'.
	tree := PRDocument new
		add:
				(PRPreformatted new
						add: (PRText content: 'line 1.1');
						add: (PRText content: 'line 1.2');
						yourself);
		add: PREmptyParagraph new;
		add:
				(PRPreformatted new
						add: (PRText content: 'line 2.1');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarPreformattedTest >> testParseSpaces [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '=    A line with 3 spaces' , nLine , '= 	A line with a tab'.
	text := '   A line with 3 spaces' , nLine , '	A line with a tab'.
	tree := PRDocument new
		add:
				(PRPreformatted new
						add: (PRText content: '   A line with 3 spaces');
						add: (PRText content: '	A line with a tab');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarPreformattedTest >> testParseSpecials [
	| wiki text tree |
	wiki := '= |, {, }, *, *, [, ||, |{, |}, +, +'.
	text := '|, {, }, *, *, [, ||, |{, |}, +, +'.
	tree := PRDocument new
		add: (PRPreformatted new
			add: (PRText content: '|, {, }, *, *, [, ||, |{, |}, +, +');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarPreformattedTest >> testText [
	self instance addAll: self foobarInstances.
	self assert: self instance text equals: 'foo
bar'

"This test is redefined because for formatted!!!! = Pre merging lines to not make sense!
It got unnoticed because we do not use preformatted."
]
