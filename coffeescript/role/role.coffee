define ['backbone'], (Backbone)->
	Role = Backbone.Model.extend
		url: "/role"
		defaults:
			"role": "anonymous"

	role = new Role()

	role.fetch()

	role
