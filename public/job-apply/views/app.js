define(function(require, exports, module){
    var Backbone, AppView;

    Backbone = require("backbone");

    AppView = Backbone.View.extend({
        el: "#job-apply",
        events: {
            "click #save-changes": "saveChanges"
        },

        saveChanges: function(){
            console.log("Just for testing");
            return false;
        }
    });

    module.exports = AppView;
})

