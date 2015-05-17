var Record = function(data){
  this.data = data;
};

Record.prototype = {
  save: function(){
    $.ajax({
      type: "post",
      data: {record: {
        album_name: this.data.name,
        artist_name: this.data.artists[0].name,
        artist_id: this.data.artists[0].id,
        release_year: this.data.release_date,
        image_large: this.data.images[0].url,
        image_medium: this.data.images[1].url,
        image_small: this.data.images[2].url
      }},
      dataType: 'json',
      url: window.location.origin + '/records.json'
    }).done(function(response){
      console.log("Record successfully added to record database");
      var playlistRecord = new PlaylistRecord(response);

      playlistRecord.save();

      $(".playlist").append("<li>"+ response.album_name + "</li>");
    });
  }
};

    // playlist_id
    // record_id



















