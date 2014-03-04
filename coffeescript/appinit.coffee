define ['backbone.marionette', 'handlebars', 'moment'],
(Marionette, Handlebars) ->
	Handlebars.registerHelper 'ifCond', (v1, operator, v2, options)->
	    switch operator
	        when '=='
	            if (`v1 == v2`) then options.fn(this) else options.inverse(this)
	        when '==='
	            if (v1 == v2) then options.fn(this) else options.inverse(this)
	        when '!='
	            if (`v1 != v2`) then options.fn(this) else options.inverse(this)
	        when '!=='
	            if (v1 != v2) then options.fn(this) else options.inverse(this)
	        when '<'
	            if (v1 < v2) then options.fn(this) else options.inverse(this)
	        when '<='
	            if (v1 <= v2) then options.fn(this) else options.inverse(this)
	        when '>'
	            if (v1 > v2) then options.fn(this) else options.inverse(this)
	        when '>='
	            if (v1 >= v2) then options.fn(this) else options.inverse(this)
	        when '&&'
	            if (v1 && v2) then options.fn(this) else options.inverse(this)
	        when '||'
	            if (v1 || v2) then options.fn(this) else options.inverse(this)
	        else
	            options.inverse(this)

	Handlebars.registerHelper "fromNow", (time)->
		moment(time).fromNow


	Marionette.TemplateCache.prototype.compileTemplate = (rawTemplate)->
		Handlebars.compile(rawTemplate)

	App = new Marionette.Application()

	App
