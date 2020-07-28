"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #PRPillarDocumentItemTest,
	#superclass : #PRObjectTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #private }
PRPillarDocumentItemTest >> actualClass [
	^ PRDocumentItem
]

{ #category : #utilities }
PRPillarDocumentItemTest >> addText: aString to: aDocumentItem [
	^ aDocumentItem
		add: (PRText content: aString);
		yourself
]

{ #category : #utilities }
PRPillarDocumentItemTest >> assertTree: aDocument equalsText: aString [
	self assert: (PRTextWriter write: aDocument) = aString description: aString resumable: true
]

{ #category : #utilities }
PRPillarDocumentItemTest >> assertTree: aDocument equalsWiki: aString [
	"Assert that traversing aDocument using the wiki writer results in aString."

	self assert: (PRPillarWriter write: aDocument) = aString description: aString resumable: false
]

{ #category : #utilities }
PRPillarDocumentItemTest >> assertWiki: aString equalsTree: aDocument [
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true
]

{ #category : #private }
PRPillarDocumentItemTest >> barInstance [
	^ PRText content: 'bar'
]

{ #category : #private }
PRPillarDocumentItemTest >> fooInstance [
	^ PRText content: 'foo'
]

{ #category : #private }
PRPillarDocumentItemTest >> foobarInstances [
	^ Array with: self fooInstance with: self barInstance
]

{ #category : #helper }
PRPillarDocumentItemTest >> parser [
	^ PRDocument parser
]

{ #category : #'tests-copying' }
PRPillarDocumentItemTest >> testCopy [
	self assert: self instance equals: self instance copy.
	self assert: self instance hash equals: self instance copy hash.

	self deny: self instance identicalTo: self instance copy
]

{ #category : #'tests-comparing' }
PRPillarDocumentItemTest >> testEqual [
	self assert: self instance equals: self instance.
	self assert: self instance equals: self actualInstance
]

{ #category : #'tests-comparing' }
PRPillarDocumentItemTest >> testEqualNil [
	self deny: self instance isNil
]

{ #category : #'tests-comparing' }
PRPillarDocumentItemTest >> testEqualOther [
	self deny: self instance equals: self fooInstance.
	self deny: self instance equals: self barInstance
]

{ #category : #'tests-testing' }
PRPillarDocumentItemTest >> testHasChildren [
	self deny: self instance hasChildren
]

{ #category : #'tests-comparing' }
PRPillarDocumentItemTest >> testHash [
	self assert: self instance hash equals: self instance copy hash
]

{ #category : #tests }
PRPillarDocumentItemTest >> testIsHeader [
	self deny: self instance isHeader
]

{ #category : #tests }
PRPillarDocumentItemTest >> testIsLink [
	self deny: self instance isLink
]

{ #category : #'tests-accessing' }
PRPillarDocumentItemTest >> testText [
	self assert: self instance text isString
]
