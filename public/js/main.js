require.config({
    baseUrl: "/js/app",
    paths: {
        'jquery': '../vendor/jquery',
        'underscore': '../vendor/underscore',
        'backbone': '../vendor/backbone',
        'backbone.babysitter': '../vendor/backbone.babysitter',
        'backbone.wreqr': '../vendor/backbone.wreqr',
        'backbone.marionette': '../vendor/backbone.marionette',
        'moment': '../vendor/moment'
    }
});

require(['app'], function(App) {
    App.start();
});
