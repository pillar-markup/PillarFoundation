Class {
	#name : #PRPillarLinkTest,
	#superclass : #PRPillarReferenceTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #private }
PRPillarLinkTest >> actualClass [
	^ PRLink
]

{ #category : #private }
PRPillarLinkTest >> markup [
	^ PRPillarParser markups at: PRLink
]

{ #category : #'tests-parsing' }
PRPillarLinkTest >> testParseAliased [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '*'.
	text := 'Alias'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLinkTest >> testParseAliasedEmpty [
	| wiki text tree |
	wiki := '*>' , self referenceString , '*'.
	text := ''.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: '');
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLinkTest >> testParseBasic [
	| wiki text tree |
	wiki := '*' , self referenceString , '*'.
	text := self actualClass new
		reference: self referenceString;
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLinkTest >> testParseParameters [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '|a=1|b=2|c=true*'.
	text := 'Alias'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add:
								(self actualClass new
										add: (PRText content: 'Alias');
										reference: self referenceString;
										parameters:
												(OrderedDictionary new
														add: 'a' -> 1;
														add: 'b' -> 2;
														add: 'c' -> true;
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLinkTest >> testParseParametersEmpty [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '|a||b|*'.
	text := 'Alias'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add:
								(self actualClass new
										add: (PRText content: 'Alias');
										reference: self referenceString;
										parameters:
												(OrderedDictionary new
														add: 'a' -> true;
														add: 'b' -> true;
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarLinkTest >> testParseParametersEscaped [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '|2=\|\=|\|\==1*'.
	text := 'Alias'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add:
								(self actualClass new
										add: (PRText content: 'Alias');
										reference: self referenceString;
										parameters:
												(OrderedDictionary new
														add: '2' -> '|=';
														add: '|=' -> 1;
														yourself);
										yourself);
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]
