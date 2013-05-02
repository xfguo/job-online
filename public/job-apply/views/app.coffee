define (require, exports, module) ->
  Backbone = require "backbone" 
  AppView = Backbone.View.extend
    el: "#job-apply"
    events:
      "click #save-changes": "saveChanges"

    saveChanges: ->
      console.log "Just for testing"
      false
      
  module.exports = AppView