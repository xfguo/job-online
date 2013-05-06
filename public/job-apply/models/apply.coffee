define (require, exports, module) ->
    Backbone = require "backbone"
    ApplyModel = Backbone.Model.extend
        defaults:
            name: '',

    module.exports = ApplyModel
