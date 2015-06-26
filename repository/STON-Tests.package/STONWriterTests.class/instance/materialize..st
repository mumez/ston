private
materialize: string
  ^ self reader
    on: string readStream;
    allowComplexMapKeys: true;
    next