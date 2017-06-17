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

// Configure the datepicker
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
  // grab the hidden field for :_destroy
  var elem          = find_ancestor_with_class(link, 'fields');
  var destroy_field = elem.querySelector('.hidden-destroy');

  // set destroy to true for the backend
  if( destroy_field ) {
    destroy_field.value = "1";
  }

  // hide the element until the user saves the changes
  elem.style.display = 'none';
}

function add_fields(link) {
  console.log('add fields');

  // get the last row already
  var parentElem          = find_ancestor_with_class(link, 'fields-container');
  var rows                = parentElem.querySelectorAll('.fields');
  var numRows             = rows.length;
  var lastRow             = rows[numRows - 1];

  // create a new row
  var newRow              = lastRow.cloneNode(true);
  var fields              = newRow.getElementsByTagName('input');

  // update the field names to use a unique index
  for (var i = 0; i < fields.length; i++) {
    var field         = fields[i];
    var nameTokens    = field.name.split('][');

    if (nameTokens.length > 1) {
      var tokenIndex            = nameTokens.length - 2;
      nameTokens[tokenIndex]    = Date.now();
      field.name                = nameTokens.join('][');
      field.value               = null;
    }
  }

  // ensure the new row will display. needed to protect case the last row being
  // copied was soft deleted and has display = 'hidden';
  newRow.style.display = '';

  // place new row behind the last row
  parentElem.insertBefore(newRow, lastRow.nextSibling);
}
