//= require_tree .
//= require_self


$(document).ready(function(){

  $.jribbble.getShotsByPlayerId('kimf', function (playerShots) {
    var html = [];
    $.each(playerShots.shots, function (i, shot) {
      html.push('<a href="' + shot.url + '">');
      html.push('<img src="' + shot.image_teaser_url + '" ');
      html.push('alt="' + shot.title + '"></a>');
    });

    $('.dribbble .images').append(html.join(''));
  }, {page: 1, per_page: 9});

});
