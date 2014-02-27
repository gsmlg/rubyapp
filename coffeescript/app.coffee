define ['appinit', 'router', 'backbone'], (App, Router, Backbone)->
	App.addInitializer (()->
		@router = new Router()
		)

	App.onStart = ()->
		Backbone.history.start()

	App
