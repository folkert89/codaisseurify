
function currentArtist() {
  return $("#artist_id").val();
}

function createSong(title) {
  var songTitle = { name: title };

  $.ajax({
  type: "POST",
  url: "/api/artists/"+ currentArtist() +"/songs.json",
  data: JSON.stringify({
      song: songTitle
  }),
  contentType: "application/json",
  dataType: "json"
  })
  .done(function(JSON_string){
    console.log(JSON_string);
    var songId = JSON_string.song.id;
    console.log(songId)

    var listItem = $("<li></li>");
    listItem.addClass("song");
    listItem.attr("id", songId);
    console.log(title);
    listItem.html(title);

    var deleteButton = $("<a></a>")
    deleteButton.attr("id", songId);
    deleteButton.addClass("btn btn-primary delSong");
    deleteButton.bind("click", deleteSong);
    deleteButton.html("Delete song");
    deleteButton.attr("href", "#")
    listItem.append(deleteButton);

    $("#song_list").append( listItem );
  })
  .fail(function(error){
    console.log(error);
    // console.log(error.responseJSON.errors[0]);
    // error_message = error.repsonseText;
    // showError(error_message);
  });
}
function deleteSong(event) {
  event.preventDefault();
  console.log(event)
  console.log(event.currentTarget.id)
  var current_song_id = event.currentTarget.id;

  $.ajax({
    type: "DELETE",
    url: "/api/artists/"+ currentArtist() +"/songs/"+current_song_id+".json",
    contentType: "application/json",
    dataType: "json"
    })
    .done(function(JSON) {
    $('li[id="'+current_song_id+'"]').remove();
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

function deleteAllSongs() {

  $(".delSong")
    .map(function() {
      this.click();
    });
}


$(document).ready(function() {
  // rails automatically created form ids for #song_name and #new_song
  $("form#new_song").bind('submit', submitSong);
  $(".delSong").bind("click", deleteSong);
  $("#delAllSongs").bind("click", deleteAllSongs);
});
