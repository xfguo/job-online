define (require, exports, module) -> 
    Backbone = require "backbone"
    ApplyModel = require "../models/apply"
    ApplysCollection = Backbone.Collection.extend
        model: ApplyModel,

    module.exports = new ApplysCollection()
