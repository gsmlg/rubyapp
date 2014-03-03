define ['backbone.marionette'], (Marionette)->
	AppLayout = Backbone.Marionette.Layout.extend
  		template: "#layout-template"
  		regions:
    		nav: "#header-navbar"
    		title: "#title"
    		articles: "#articles"
    		aside: "#article-aside"

	layout = new AppLayout();

	layout.render();

	layout
