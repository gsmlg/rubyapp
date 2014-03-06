define ['backbone.marionette'], (Marionette)->
	ArticleView = Marionette.ItemView.extend
		className: "col-md-4 col-sm-6 col-mg-3"
		template: "#article-template"

	ArticlesView = Marionette.CollectionView.extend
		tagName: "div"
		className: "row"
		itemView: ArticleView
