baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'STON-Core';
        package: 'STON-UTF8-Core' with: [ spec requires: 'STON-Core' ];
        package: 'STON-Tests' with: [ spec requires: 'STON-Core' ];
        package: 'STON-UTF8-Tests' with: [ spec requires: 'STON-UTF8-Core' ];
        yourself.
      spec
        group: 'default' with: #('Core' 'UTF8');
        group: 'Core' with: #('STON-Core');
        group: 'UTF8' with: #('STON-UTF8-Core');
        group: 'Tests' with: #('STON-Tests' 'STON-UTF8-Tests');
        yourself ].
  spec
    for: #'pharo'
    do: [ 
      spec
        package: 'STON-Core' with: [ spec includes: #('STON-Pharo-Core') ];
        package: 'STON-Pharo-Core' with: [ spec requires: #('STON-Core') ];
        yourself ]