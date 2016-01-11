// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require jquery_ujs
// = require foundation
// = require turbolinks
// = require_tree .

$(function() {
	$(document).foundation();
})

// This is now moved into assets/line_items.js
//vv this is document ready for lazy people
// $(function() {
//   // $(document).foundation();

//   // alert("iashdbasd")
//   $('.button_to').on('submit', function(event){
//       event.preventDefault();
//       // console.log('YEEEEEAAAAAAAAAA');


//       var request = $.ajax({
//         url: '/line_items',
//         method: 'POST',
//         dataType: 'html'
//       })

//       request.done(function(response){
//         console.log(response);
//         $('.top-bar').remove();
//         $("body").prepend(response);
//         alert("Item added to Cart!");

//       });
//     });
//   });
