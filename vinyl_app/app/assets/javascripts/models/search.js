var SearchModel = function(term) {
  this.term = term;
  this.results = [];
};

SearchModel.prototype = {
  getResults: function() {
    var url = "https://api.spotify.com/v1/search?q=" + this.term + "&type=album";

    return $.ajax({
      url: url,
      method: "get",
      context: this
    }).done(function(data) {
      this.results = data.albums.items;
    });
  }
};