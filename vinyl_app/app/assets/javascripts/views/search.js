var SearchView = function() {
  this.container = $("#results");
  $('form#search input[type=submit]').on("click", this.searchSpotify.bind(this));
  $("#results").on("click", "button[type=button]", this.searchRecordInfo);
};

SearchView.prototype = {
  searchSpotify: function() {
    event.preventDefault();

    var term = $("#search-keyword").val();

    this.model = new SearchModel(term);
    this.model.getResults().done( this.render.bind(this) );
  },
  searchRecordInfo: function(){
    event.preventDefault();

    var term = this.id;

    this.model = new SearchModel(term);
    this.model.getRecord();
  },
  render: function() {
    this.container.empty();
    this.model.searchResults.forEach(function(result) {
      this.container.append("<tr class='record-result' id='" + result.id + "'><td class='image-container'><img src=" + result.images[2].url + "></td><td><h4>" + result.name + "</h4></td><td><button type='button' class='btn btn-default' aria-label='Left Align' id='" + result.id + "'><span class='glyphicon glyphicon glyphicon-plus' aria-hidden='true'></span></button></td></tr>");
    }.bind(this));
  }
};