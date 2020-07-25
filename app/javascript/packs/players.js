$(function() {
  $('button[id^="player-edit-"]').click(function() {
    const id = $(this).attr('id').replace('player-edit-', '');
    $(`tr.player-edit-${ id }-tr`).toggle();
  });
});
