private
materialize: string
  ^ STON reader
    on: string readStream;
    allowComplexMapKeys: true;
    next