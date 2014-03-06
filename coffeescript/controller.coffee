define ['backbone.marionette'],
(Marionette)->
	Marionette.Controller.extend {
		'index': ()->
			require ['home/index'], (Home)->
				Home.start()
		'user': ()->
			console.log('users!')

	}
