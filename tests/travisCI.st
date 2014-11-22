"Load and run tests to be performed by TravisCI"
| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeGLASS1.

"load the STON tests"
Metacello new
  baseline: 'Ston';
  repository: 'filetree://', gitPath, '/ston/repository';
  load: 'Tests'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfSton' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

