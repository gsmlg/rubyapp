define ['backbone.marionette'], (Marionette)->
	MenuItem = Marionette.ItemView.extend
		tagName: "li"
		template: "#head-nav-link-template"

	HeaderNav = Marionette.CompositeView.extend
		tagName: "nav"
		className: "navbar navbar-inverse"
		attributes:
			role: "navigation"
		itemView: MenuItem
		template: "#head-nav-template"
		itemViewContainer: "#header-nav-links"

	HeaderNav
