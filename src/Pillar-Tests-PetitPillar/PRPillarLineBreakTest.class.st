Class {
	#name : #PRPillarLineBreakTest,
	#superclass : #PRPillarDocumentItemTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarLineBreakTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarLineBreakTest >> actualClass [
	^ PRLineBreak
]

{ #category : #'tests-parsing' }
PRPillarLineBreakTest >> testParseOneEmptyLine [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , 'Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
		
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLineBreakTest >> testParseTreeLines [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , 'Nulla quis urna.' , nLine , 'Vestibulum turpis.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.');
						add: PRLineBreak new;
						add: (PRText content: 'Vestibulum turpis.');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLineBreakTest >> testParseTwoEmptyLines [
	| wiki text tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := 'Lorem ipsum dolor sit amet.' , nLine , nLine , nLine , 'Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						yourself);
		add: PREmptyParagraph new;
		add: PREmptyParagraph new;
		add: (PRParagraph new add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: text.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLineBreakTest >> testParseTwoLines [
	| wiki text tree |
	wiki := 'Lorem ipsum dolor sit amet.' , Smalltalk os lineEnding , 'Nulla quis urna.'.
	text := wiki.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: 'Lorem ipsum dolor sit amet.');
						add: PRLineBreak new;
						add: (PRText content: 'Nulla quis urna.') yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
