Class {
	#name : #PRPillarMockAnnotationTest,
	#superclass : #PRPillarAbstractAnnotationTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #helpers }
PRPillarMockAnnotationTest >> actualClass [
	^ PRMockAnnotation
]

{ #category : #helpers }
PRPillarMockAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'value')
			valueNode: (PRParameterValue value: 'Foo').
		PRParameter 
			keyNode: (PRParameterKey named: 'number')
			valueNode: (PRParameterValue value: 5) }
]

{ #category : #helpers }
PRPillarMockAnnotationTest >> referenceString [
	^ 'mock:value=Foo|number=5'
]

{ #category : #tests }
PRPillarMockAnnotationTest >> testParseUndclaredParametersShouldRaiseAnError [
	| input |
	input := '${mock:Foo|option=bar}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError.
	input := '${mock:Foo|option=bar|toto=4}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError.
	input := '${mock|option=bar}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError
]

{ #category : #tests }
PRPillarMockAnnotationTest >> testParseWithBadInterpretation [
	| input |
	input := '${mock:Foo|number=cinq}$'.
	self should: [ PRDocument parser parse: input ] raise: Error
]

{ #category : #tests }
PRPillarMockAnnotationTest >> testParseWithInterpretation [
	| input expected |
	input := '${mock:value=Foo|number=5}$'.
	expected := PRMockAnnotation withParameters: (
		PRParameters withAll: { 
			PRParameter 
				keyNode: (PRParameterKey named: 'value')
				valueNode: (PRParameterValue value: 'Foo').
			PRParameter 
				keyNode: (PRParameterKey named: 'number')
				valueNode: (PRParameterValue value: 5) }).
	self
		assert:
			(PRDocument parser parse: input startingAt: #annotation)
		equals: expected
]

{ #category : #tests }
PRPillarMockAnnotationTest >> testParseWithoutARequiredParameter [
	| input |
	input := '${mock}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError
]

{ #category : #tests }
PRPillarMockAnnotationTest >> testParseWithoutFirstKey [
	"an annotation can have a default parameter name that the user does not have to be forced to specify.
	 ${mock:Foo|number=5}$ means  ${mock:value=Foo|number=5}$ since mock defines defaultParameterName as 'value'.
	"

	| input expected |
	input := '${mock:value=Foo}$'.
	expected := PRMockAnnotation withParameters: (
		PRParameters withAll: { 
			PRParameter 
				keyNode: (PRParameterKey named: 'value')
				valueNode: (PRParameterValue value: 'Foo') }).
	expected hadAllKeys: false.
	self assert: (PRDocument parser parse: input startingAt: #annotation) equals: expected
]
