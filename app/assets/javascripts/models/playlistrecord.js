var PlaylistRecord = function(data){
  this.data = data;
};

PlaylistRecord.prototype = {
  save: function(){
    var playlist_id = $(".playlist-name").attr("id");
    var record_id = this.data.id;

    $.ajax({
      type: "post",
      data: {playlist_record: {
        record_id: record_id,
        playlist_id: playlist_id
      }},
      dataType: 'json',
      url: window.location.origin + '/playlists/' + playlist_id + '/add.json'
    }).done(function(response){
      console.log("relationship successfully added to relationship database");
      console.log(response);
    }).fail(function( jqXHR, textStatus ) {
      console.log( "Request failed: " + textStatus);
    });
  }
};