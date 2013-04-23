
seajs.config({
  // Enable plugins
  plugins: ['shim'],

  // Configure alias
  alias: {
    'jquery': {
      src: 'http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js',
      exports: 'jQuery'
    }
  }
});

