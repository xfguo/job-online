Backbone.sync = function(method, model, options) { 
    var socket = socket || io.connect();

    var signature = function (){
        var sig = {};

        //sig.endPoint = model.url + (model.id ? ('/' + model.id) : '');
        sig.endPoint = model.url;
        if (model.ctx) sig.ctx = model.ctx;

        return sig;
    };

    var event = function (operation, sig){
        var e = operation + ':';
        e += sig.endPoint;
        if (sig.ctx) e += (':' + sig.ctx);

        return e;
    };

    var read = function (){
        var sign = signature(model);
        var e = event('read', sign);
        socket.emit('read', {'signature': sign, item: {}});
        socket.once(e, function (data) {
            options.success(data);
        });
    };

    var create = function (){
        var sign = signature(model);
        var e = event('create', sign);
        socket.emit('create', {'signature': sign, item: model.attributes });
        socket.once(e, function (data) {
            options.success(data);
        });
    };


    var update = function (){
        var sign = signature(model);
        var e = event('update', sign);
        socket.emit('update', {'signature': sign, item: model.attributes });
        socket.once(e, function (data) {
            console.log(data);
            options.success(data);
        });
    };

    var destroy = function (){
        var sign = signature(model);
        var e = event('delete', sign);
        socket.emit('delete', {'signature': sign, item: model.attributes });
        socket.once(e, function (data){
            console.log(data);
        });
    };

    switch (method) { 
        case 'create':
            create();
            break;
        case 'read':
            read();
            break;
        case 'update':
            update();
            break;
        case 'delete':
            destroy();
            break;
    }
};
