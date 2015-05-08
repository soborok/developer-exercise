var Quote = Backbone.Model.extend({
  defaults: {
    quote: "",
    context: "", 
    source: "", 
    theme: ""
  }
});

var QuoteCollection = Backbone.Collection.extend({
  url: "https://gist.githubusercontent.com/anonymous/8f61a8733ed7fa41c4ea/raw/1e90fd2741bb6310582e3822f59927eb535f6c73/quotes.json",

  model: Quote
});

var QuoteListView = Backbone.View.extend({
  tagName: "ul",

  className: "quote-list-ul",

  addOne: function(quote) {
    var quoteView = new QuoteView({ model: quote});
    quoteView.render();
    this.$el.append(quoteView.el);

    return this;
  },

  addAll: function(quotes) {
    this.collection.each(function(quote) {
      this.addOne(quote);
    }, this);
    return this;
  }
});

var QuoteView = Backbone.View.extend({
  tagName: "li", 

  className: "quote",

  render: function() {
    var quoteInfo = quoteTemplate(this.model.attributes);
    this.$el.html(quoteInfo);

    return this;
  }
});

function quoteTemplate(attr) {
  var template;
  var quote = "<h3>" + attr.quote + "</h3>";
  var quoteInfo = "<div id='quote-details'><span class='quote context'>" + attr.context + "</span><span class='quote source'>" + attr.source + "</span><span class='quote theme " + attr.theme + "'>" + attr.theme + "</span></div>"

  template = quote + quoteInfo;
  return template;
}
