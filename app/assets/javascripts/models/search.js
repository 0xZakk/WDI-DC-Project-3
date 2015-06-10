var SearchModel = function(term) {
  this.term = term;
  this.searchResults = [];
};

SearchModel.prototype = {
  getResults: function() {
    var url = "https://api.spotify.com/v1/search?q=" + this.term + "&type=album";

    return $.ajax({
      url: url,
      method: "get",
      context: this
    }).done(function(data) {
      this.searchResults = data.albums.items;
    });
  },
  getRecord: function() {
    var url = "https://api.spotify.com/v1/albums/" + this.term;

    return $.ajax({
      url: url,
      method: "get",
      context: this,
    }).done(function(data){
      var record = new Record(data);
      record.save();
    });
  }
};