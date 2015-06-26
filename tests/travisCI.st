"Load and run tests to be performed by TravisCI"
| gitPath |
| gitCache gitPath loadBlock |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

(Smalltalk at: #ConfigurationOfGLASS ifAbsent: [])
  ifNotNil: [:cls |
    "Upgrade to GLASS1"
    Gofer new
      package: 'GsUpgrader-Core';
      url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
      load.
    (Smalltalk at: #GsUpgrader) upgradeGLASS1 ]
  ifNil: [
    "Upgrade to latest Metacello"
    Metacello new
      baseline: 'Metacello';
      repository: 'github://dalehenrich/metacello-work:master/repository';
      get.
    Metacello new
      baseline: 'Metacello';
      repository: 'github://dalehenrich/metacello-work:master/repository';
      onConflict: [:ex | ex allow];
      load ].


"load the STON tests"
loadBlock := [
  Metacello new
    baseline: 'Ston';
    repository: 'filetree://', gitPath, '/ston/repository';
    load: 'Tests' ].

[  
  (Smalltalk at: #GsDeployer ifAbsent: [])
    ifNil: [ loadBlock value]
    ifNotNil: [:cls |
      "GemStone, use GsDeployer to load"
      cls deploy: loadBlock ] .
  ] on: Warning 
    do: [:ex |
      Transcript cr; show: ex description.
      ex resume ].

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfSton' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

