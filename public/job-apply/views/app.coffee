define (require, exports, module) ->
  Backbone = require "backbone"
  applys = require "../collection/applys.coffee"

  AppView = Backbone.View.extend
    el: "#job-apply"
    events:
      "click #save-changes": "saveChanges"

    saveChanges: ->
      alert "Just for testing"
      false
      
  module.exports = AppView
