var SearchView = function() {
  this.container = $("#results");
  $('form#search input[type=submit]').on("click", this.searchSpotify.bind(this));
};

SearchView.prototype = {
  searchSpotify: function() {
    event.preventDefault();

    var term = $("#search-keyword").val();

    this.model = new SearchModel(term);
    this.model.getResults().done( this.render.bind(this) );
  },
  render: function() {
    this.container.empty();
    this.model.results.forEach(function(result) {
      this.container.append(
        "<tr><td class='image-container'><img src=" + result.images[2].url + "></td><td>" + result.name + "</td></tr>");
    }.bind(this));

  }
};