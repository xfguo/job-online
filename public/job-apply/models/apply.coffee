define (require, exports, module) ->
    Backbone = require "backbone"
    ApplyModel = Backbone.View.extend
        defaults:
            name: '',

    module.exports = ApplyModel
