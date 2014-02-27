define ['backbone.marionette', 'controller'],
(Marionette, Controller) ->
	Router = Marionette.AppRouter.extend {
		appRoutes: {
			'': 'index'
			'user': 'user'
		}
		controller: new Controller()
	}

	Router
