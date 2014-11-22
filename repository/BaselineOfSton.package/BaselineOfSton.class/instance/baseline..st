baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'GLASS1'
          with: [ 
              spec
                loads: #('GsSqueakCommon');
                repository: 'github://glassdb/glass:master/repository' ];
        yourself.
      spec
        package: 'STON-Core';
        package: 'STON-Tests' with: [ spec requires: 'STON-Core' ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('STON-Core');
        group: 'Tests' with: #('STON-Tests');
        yourself ]