// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function(){
  $('.datepicker').datepicker({
    todayHighlight: true,
    autoclose: true,
    format: 'yyyy-mm-dd'
  });
});

function find_ancestor_with_class(elem, classname) {
  while( !elem.classList.contains(classname) ){
    elem = elem.parentElement;
  };
  return elem;
}

function remove_fields(link) {
  var elem          = find_ancestor_with_class(link, 'fields');
  var inputs        = elem.getElementsByTagName('input');
  var destroy_field = elem.querySelector('.hidden-destroy');

  if( destroy_field ) {
    destroy_field.value = "1";
  }
  elem.style.display = 'none';
}
