define (require, exports, module) ->
    Backbone = require "backbone"
    applys = require "../collections/applys"
    socket = new eio.Socket()
 
    AppView = Backbone.View.extend
      el: "#job-apply"
      events:
        "click #save-changes": "saveChanges"

      send: ->
          socket.send "testing"

      initialize: ->
          that = this

          socket.onopen = ->
              that.send()
              return

          socket.onmessage = (message_content) ->
              console.log message_content.toString()
              setTimeout that.send, 1000
              return

          return 

      saveChanges: ->
          applys.create {'name': "testing", "name2": "works"}
          return false
        
    module.exports = AppView
