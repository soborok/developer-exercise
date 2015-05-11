$(document).ready(function() {
  var all = $(".accordion-header");

  $(".accordion-header a").on('click', function(event) {
    var parentDiv = $(this).parent();

    if (parentDiv.hasClass('active')) {
      parentDiv.removeClass('active');
    } else {
      all.removeClass('active');
      parentDiv.addClass('active');
    }
  });
  
});
