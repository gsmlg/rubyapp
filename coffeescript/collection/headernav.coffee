define ['backbone'], (Backbone)->
	Nav = Backbone.Collection.extend
		"url": "/menus/head-nav"

	nav = new Nav()

	nav.fetch()

	nav
