function createSong(title) {
  var songId = "song-" + nextTodoId();
  var songTitle = { title: title };
  var artistId = $("#artist_id").val();
  console.log(artistId);

  var listItem = $("<li></li>");
  listItem.addClass("song");
  listItem.attr("id", songId)
  console.log(title);
  listItem.html(title);

  $("#songList").append( listItem );
}

function nextTodoId() {
  return $(".song").length + 1;
}

function submitSong(event) {
  event.preventDefault();
  var title = $("#song_name").val();
  console.log(title);
  createSong(title);
  $("#new_song").val(null);
}


$(document).ready(function() {
  // rails automatically created form ids for #song_name and #new_song
  $("form#new_song").bind('submit', submitSong);
});
