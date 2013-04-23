define(function(require, exports, module){
    var Backbone, AppView;

    Backbone = require("backbone");

    AppView = Backbone.View.extend({
        el: "#job-apply",
    });

    module.exports = AppView;
})

