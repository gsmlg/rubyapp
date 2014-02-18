require.config({
    baseUrl: "/js/app",
    urlArgs: "_t=" + (new Date()).getTime(),
    paths: {
        'jquery': '../vendor/jquery',
        'underscore': '../vendor/underscore',
        'backbone': '../vendor/backbone',
        'backbone.babysitter': '../vendor/backbone.babysitter',
        'backbone.wreqr'.: '../vendor/backbone.wreqr',
        'backbone.marionette': '../vendor/backbone.marionette',
        'moment': '../vendor/moment',
    }
});

require(['app'], function(app) {
    app.start();
})
