Class {
	#name : #PRPillarParagraphTest,
	#superclass : #PRPillarDocumentGroupTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarParagraphTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarParagraphTest >> actualClass [
	^ PRParagraph
]

{ #category : #'tests-parsing' }
PRPillarParagraphTest >> testParent [
	| tree text |
	text := PRText content: 'Lorem ipsum dolor sit amet.'.
	tree := PRDocument new
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: text;
						yourself);
		yourself.
	self assert: tree children first parent equals: tree.
	self assert: tree children second parent equals: tree.
	self assert: text parent equals: tree children second
]

{ #category : #'tests-parsing' }
PRPillarParagraphTest >> testParseEmptyLineAtBeginning [
	| wiki text tree |
	wiki := '' , Smalltalk os lineEnding , 'Lorem ipsum dolor sit amet.'.
	text := wiki.
	tree := PRDocument new
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarParagraphTest >> testParseOneLine [
	| wiki text tree |
	wiki := 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: wiki);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarParagraphTest >> testParseThreeEmptyLines [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine , 'Nulla mattis elementum nulla.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: 'Nulla mattis elementum nulla.');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarParagraphTest >> testParseTwoConsecutiveNonTextLines [
	| wiki text tree sentence title nLine |
	nLine := Smalltalk os lineEnding.
	sentence := 'sentence'.
	title := 'title'.
	wiki := sentence , nLine , '!' , title.
	text := sentence , nLine , title.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: sentence);
						yourself);
		add:
				(PRHeader new
						level: 1;
						add: (PRText content: title);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarParagraphTest >> testParseTwoEmptyLines [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , 'Nulla mattis elementum nulla.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add:
				(PRParagraph new
						add: (PRText content: 'Nulla mattis elementum nulla.');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
