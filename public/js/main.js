require.config({
    baseUrl: "/js/vendor",
    urlArgs: "_t=" + (new Date()).getTime(),
    paths: {
        app: '../app'
    }
});

require(['app/app'], function(app) {
    app.start();
})
