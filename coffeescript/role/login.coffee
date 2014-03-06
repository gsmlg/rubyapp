define ['backbone.marionette'], (Marionette)->
    LoginView = Marionette.View.extend
        tagName: "div"
        className: "modal fade"
        attributs:
            "tabindex": "-1"
            "role": "dialog"
            "aria-labelledby": "myModalLabel"
            "aria-hidden": "true"
        template: "#login-template"
