Class {
	#name : #PRPillarTextTest,
	#superclass : #PRPillarDocumentItemTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #testing }
PRPillarTextTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPillarTextTest >> actualClass [
	^ PRText
]

{ #category : #'tests-instantiation' }
PRPillarTextTest >> testContent [
	instance := self actualClass content: 'zork'.
	self assert: self instance text equals: 'zork'
]

{ #category : #'tests-comparing' }
PRPillarTextTest >> testEqualText [
	self deny: (self actualClass content: 'foo') equals: (self actualClass content: 'bar')
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testEscapeCpp [
	| wiki tree |
	wiki := 'Text: \+\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: ++');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testEscapeFirst [
	| wiki tree nLine |
	nLine := Smalltalk os lineEnding.
	wiki := '\* text' , nLine , '\+ text' , nLine , '\= text' , nLine , '\@ text' , nLine , '\! text' , nLine , '\| text'
		, nLine , '\# text' , nLine , '\- text'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: '* text');
						add: PRLineBreak new;
						add: (PRText content: '+ text');
						add: PRLineBreak new;
						add: (PRText content: '= text');
						add: PRLineBreak new;
						add: (PRText content: '@ text');
						add: PRLineBreak new;
						add: (PRText content: '! text');
						add: PRLineBreak new;
						add: (PRText content: '| text');
						add: PRLineBreak new;
						add: (PRText content: '# text');
						add: PRLineBreak new;
						add: (PRText content: '- text');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testEscapeStrange [
	| wiki tree |
	wiki := '< text' , Smalltalk os lineEnding , '> text'.
	tree := PRDocument new
		add:
				(PRParagraph new
						add: (PRText content: '< text');
						add: PRLineBreak new;
						add: (PRText content: '> text');
						yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testEscapeText [
	| wiki tree |
	wiki := 'Text: \*\+'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Text: *+');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testEscapeWiki [
	| wiki tree |
	wiki := 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'Wiki: =, |, !, #, {, }, |{, ||, |}, [, ] and -');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testParseBasic [
	| wiki tree |
	wiki := 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: 'abcdefghijklmnopqrstuvwxyz... ABCDEFGHIJKLMNOPQRSTUVWXYZ... 0123456789...');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testParseHtml [
	| wiki tree |
	wiki := '<strong>strong <emph>strong, emph</emph></strong>'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '<strong>strong <emph>strong, emph</emph></strong>');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testParseLatex [
	| wiki text tree |
	wiki := '\\begin{foo}[bar]$zork$\\end{foo}'.
	text := '\begin{foo}[bar]$zork$\end{foo}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '\begin{foo}[bar]$zork$\end{foo}');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testParseSpecial [
	| wiki tree |
	wiki := '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText
										content: '????????????¬å???????????????¬ú??¬ü¬¬°¬¢¬£¬§¬·?¬ß?¬©¬¬´¬¨?¬Æ¬Ø¬¬±???¬µ¬¬??¬¬ª???¬ø¦Ä¦Å¦Ç¦É¦Ñ¦Ö¦Ü¦á¦à¦â¦ä¦ã¦å¦ç¦é¦è?¦ë¦í¦ì¦î¦ï¦ñ?¦ò¦ô¦ö¦õ¦ú??¦ü¦¦°¦¢¦£¦§¦·¦¶¦ß¦®¦©¦¦´¦¨¦¦Æ¦Ø?¦±¦¦¦¥¦µ¦¦¦¦¦¦ª¦º??');
							yourself);
				yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-parsing' }
PRPillarTextTest >> testParseWiki [
	| wiki tree |
	wiki := ' !_#-|=]@:<>\*'.
	tree := (PRDocument new)
				add: ((PRParagraph new)
							add: (PRText content: ' !_#-|=]@:<>*');
							yourself);
				yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki
]

{ #category : #'tests-printing' }
PRPillarTextTest >> testPrinting [
	| text |
	text := PRText content: 'abcdef'.
	'*abcdef*' match: text printString
]

{ #category : #'tests-accessing' }
PRPillarTextTest >> testText [
	self instance text: 'zork'.
	self assert: self instance text equals: 'zork'
]
