define [
	'home/layout', 'jquery', 'app',
	'home/headernav', 'role/role', 'collection/headernav'
	'collection/articles', 'home/articlesview'],
(layout, $, App, HeaderNav, role, navs, Articles, ArticlesView)->
	App.module "Home", (Home, App, Backbone, Marionette, $, _) ->
		Home.addInitializer ()->
			$('#layout').html(layout.el)
			articles = new Articles()
			articles.fetch()

			layout.nav.show new HeaderNav model:role, collection: navs
			layout.articles.show new ArticlesView collection: articles
