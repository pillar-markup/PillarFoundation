Class {
	#name : #PRPillarBeginEnvironmentAnnotationTest,
	#superclass : #PRPillarAbstractAnnotationTest,
	#category : #'Pillar-Tests-PetitPillar'
}

{ #category : #helpers }
PRPillarBeginEnvironmentAnnotationTest >> actualClass [
	^ PRBeginEnvironmentAnnotation
]

{ #category : #helpers }
PRPillarBeginEnvironmentAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'name')
			valueNode: (PRParameterValue value: 'card').
		PRParameter 
			keyNode: (PRParameterKey named: 'number')
			valueNode: (PRParameterValue value: 10).
		PRParameter 
			keyNode: (PRParameterKey named: 'string')
			valueNode: (PRParameterValue value: 'a string').
		PRParameter 
			keyNode: (PRParameterKey named: 'boolean')
			valueNode: (PRParameterValue value: true).
		}
]

{ #category : #helpers }
PRPillarBeginEnvironmentAnnotationTest >> referenceString [
	^ 'begin:name=card|number=10|string=a string|boolean=true'
]
