Class {
	#name : #PRPillarInternalLinkTest,
	#superclass : #PRPillarLinkTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarInternalLinkTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarInternalLinkTest >> actualClass [
	^ PRInternalLink
]

{ #category : #private }
PRPillarInternalLinkTest >> referenceString [
	^ 'Page'
]

{ #category : #'tests-parsing' }
PRPillarInternalLinkTest >> testParseAnchored [
	| wiki text tree |
	wiki := '*' , self referenceString , '@Anchor*'.
	text := self actualClass new
		reference: self referenceString;
		anchor: 'Anchor';
		title.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarInternalLinkTest >> testParseEverything [
	| wiki text tree |
	wiki := '*Alias>' , self referenceString , '@Anchor*'.
	text := 'Alias'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (self actualClass new
				add: (PRText content: 'Alias');
				reference: self referenceString;
				anchor: 'Anchor';
				yourself);
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-accessing' }
PRPillarInternalLinkTest >> testReferenceAsHTML [
	| link |
	link := PRInternalLink reference: 'foo.pillar'.
	self assert: link referenceAsHTML equals: 'foo.html'.
	link := PRInternalLink reference: 'foo.pilla'.
	self should: [ link referenceAsHTML ] raise: PRLinkWarning
]

{ #category : #'tests-accessing' }
PRPillarInternalLinkTest >> testReferenceAsMarkdown [
	| link |
	link := PRInternalLink reference: 'foo.pillar'.
	self assert: link referenceAsMarkdown equals: 'foo.md'.
	link := PRInternalLink reference: 'foo.pilla'.
	self should: [ link referenceAsMarkdown ] raise: PRLinkWarning
]
