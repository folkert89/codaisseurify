function createSong(title) {
  var songTitle = { name: title };
  var artistId = $("#artist_id").val();
  console.log(artistId);

  $.ajax({
  type: "POST",
  url: "/api/artists/"+ artistId +"/songs.json",
  data: JSON.stringify({
      song: songTitle
  }),
  contentType: "application/json",
  dataType: "json"
  })
  .done(function(rails_song){
    console.log(rails_song);
    var songId = rails_song.id;

    var listItem = $("<li></li>");
    listItem.addClass("song");
    listItem.attr("id", songId);
    console.log(title);
    listItem.html(title);

    $("#songList").append( listItem );
  })
  .fail(function(error){
    console.log(error);
    // console.log(error.responseJSON.errors[0]);
    // error_message = error.repsonseText;
    // showError(error_message);
  });
}

// function showError(message) {
//   var errorHelpBlock = $('<span class="help-block"></span>')
//     .attr('id', 'error_message')
//     .text(message);
//
//   $("#formgroup-title")
//     .addClass("has-error")
//     .append(errorHelpBlock);
// }
//
// function resetErrors() {
//   $("#error_message").remove();
//   $("#formgroup-title").removeClass("has-error");
// }

function submitSong(event) {
  event.preventDefault();
  // resetErrors();
  var title = $("#song_name").val();
  console.log(title);
  createSong(title);
  $("#song_name").val(null);
}


$(document).ready(function() {
  // rails automatically created form ids for #song_name and #new_song
  $("form#new_song").bind('submit', submitSong);
});
