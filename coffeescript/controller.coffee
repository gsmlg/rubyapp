define ['backbone.marionette'],
(Marionette)->
	Marionette.Controller.extend {
		'index': ()->
			console.log('Hello World!')
		'user': ()->
			console.log('users!')

	}
