Class {
	#name : #BaselineOfPillarFoundation,
	#superclass : #BaselineOf,
	#category : #BaselineOfPillarFoundation
}

{ #category : #baselines }
BaselineOfPillarFoundation >> baseline: spec [
	<baseline>

	spec
		for: #common
		do: [
			spec 
				"# pillar" 
				package: 'Pillar-PetitPillar' with: [ 
					spec requires: #( 'PetitParser2Core' 'PillarCore' ) ];
				package: 'Pillar-Tests-PetitPillar' with: [ 
					spec requires: #( 'Pillar-PetitPillar' ) ];
				package: 'Pillar-ExporterCore' with: [ 
					spec requires: #('PillarCore' 'ContainersPropertyEnvironment') ];
				package: 'Pillar-Tests-ExporterCore' with: [ 
					spec requires: #('Pillar-ExporterCore') ];
				package: 'Pillar-ExporterPillar' with: [ 
					spec requires: #('Pillar-ExporterCore' 'Pillar-PetitPillar') ];
				package: 'Pillar-Tests-ExporterPillar' with: [ 
					spec requires: #('Pillar-ExporterPillar' 'Pillar-Tests-ExporterCore') ];
				"# microdown"
				package: 'Pillar-Microdown' with: [ 
					spec requires: #('PillarCore' 'Microdown') ];
				package: 'Pillar-ExporterMicrodown' with: [ 
					spec requires: #('PillarCore' 'Microdown' 'Pillar-ExporterRichText') ];
				"# rich text"
				package: 'Pillar-ExporterRichText' with: [ 
					spec requires: #('PillarCore' 'Pillar-ExporterCore' "pillar pear?") ].
		spec 
			group: 'default' with: #('pillar' 'microdown');
			"# pillar "
			group: 'pillar' with: #('pillar-parser' 'pillar-parser-tests' 'pillar-exporter' 'pillar-exporter-tests');
			group: 'pillar-parser' with: #('Pillar-PetitPillar');
			group: 'pillar-parser-tests' with: #('Pillar-Tests-PetitPillar');
			group: 'pillar-exporter' with: #('Pillar-ExporterPillar');
			group: 'pillar-exporter-tests' with: #('Pillar-Tests-ExporterPillar');
			
			"# microdown"
			group: 'microdown' with: #('microdown-parser' "'microdown-parser-tests'" 'microdown-exporter' "'microdown-exporter-tests'");
			group: 'microdown-parser' with: #('Pillar-Microdown');
			"group: 'pillar-parser-tests' with: #('Pillar-Tests-PetitPillar');"
			group: 'microdown-exporter' with: #('Pillar-ExporterMicrodown')";
			group: 'microdown-exporter-tests' with: #('Pillar-Tests-ExporterMicrodown')";
			
			"# rich text"
			group: 'richtext' with: #('richtext-exporter');
			group: 'richtext-exporter' with: #('Pillar-ExporterRichText').
		
		self 
			pillarCore: spec;
			microdown: spec;
			containerPropertyEnvironment: spec;
			petitParser2Core: spec ]
]

{ #category : #baselines }
BaselineOfPillarFoundation >> containerPropertyEnvironment: spec [ 
	spec 
		baseline: 'ContainersPropertyEnvironment' with: [ 
			spec 
				repository: 'github://Ducasse/Containers-PropertyEnvironment' ]
]

{ #category : #baselines }
BaselineOfPillarFoundation >> microdown: spec [ 
	spec 
		baseline: 'Microdown' with: [ 
			spec
				repository: 'github://pillar-markup/MicroDown/src';
				loads: #( 'pillar') ]
]

{ #category : #baselines }
BaselineOfPillarFoundation >> petitParser2Core: spec [ 
	spec 
		baseline: 'PetitParser2Core' with: [ 
			spec
				repository: 'github://kursjan/petitparser2' ]
]

{ #category : #baselines }
BaselineOfPillarFoundation >> pillarCore: spec [ 
	spec 
		baseline: 'PillarCore' with: [ 
			spec
				repository: 'github://pillar-markup/PillarFoundation/src' ]
]
