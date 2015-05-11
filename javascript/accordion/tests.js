$(document).ready(function(){
  module("Accordion tests");

  test("expanded section test", function(assert) {
    var activeElement = document.getElementsByClassName('active');

    assert.equal(activeElement.length, 1, "There is one expanded section on page load.");
  });

  test("accordion test", function(assert) {
    var mathSection = $(".accordion-wrapper div.active");
    var englishSection = $(".accordion-wrapper div:eq(2) a");
    
    englishSection.triggerHandler( $.Event('click') );

    notOk(mathSection.parent().hasClass('active'), "Expanded section will collapse when another section is clicked.");
    ok(englishSection.parent().hasClass('active'), "The clicked section will expand when it is clicked.");
  });

  test("collapsible sections test", function(assert) {
    var activeSectionName = $('.active a');
    
    activeSectionName.triggerHandler( $.Event('click') );

    var activeElement = document.getElementsByClassName('active');

    assert.equal(activeElement.length, 0, "All sections are collapsed when the expanded section is clicked.");
  });

});
