
define (require) ->
  require("backbone_io")

  app = require './views/app'
  new app()
