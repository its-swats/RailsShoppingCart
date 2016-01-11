$(document).ready(function(){
  $('.storefront_box').on('submit',function(event){
    event.preventDefault();
    var totalQuantity = $(this).children('p').children('input').val()
    var productId = $(this).attr('id')
    $('#myModal' + productId).foundation('reveal', 'close');
    var request = $.ajax({
      url: '/line_items',
      method: 'POST',
      data: {product_id: productId, total_quantity: totalQuantity}
    })

    request.done(function(response){
      $('.cart_count').text(response);
      // $('.top-bar').remove();
      // $("body").prepend(response);
    });
  });

});
