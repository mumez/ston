tests
testUnicodeStrings
  | strings |
  strings := {(String
    withAll:
      {(Character codePoint: 0).
      (Character codePoint: 255).
      (Character codePoint: 256)}).
  'Я можу їсти скло, і воно мені не зашкодить.'.
  '𣎏'.
  'élève en Français'}.
  self serializeAndMaterialize: strings