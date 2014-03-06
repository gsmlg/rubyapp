define ['backbone'], (Backbone)->
	Articles = Backbone.Collection.extend
		"url": "/articles"

	Articles
