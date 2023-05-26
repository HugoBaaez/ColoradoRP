$(document).ready(function(){
  window.addEventListener('message', function( event ) {
if (event.data.action == 'open') {
      var type      = event.data.type;
      var link		= event.data.link;
     if (type == "read") {  
        $('#reg-paper').show();
        $('#poster').css('background-image', 'url('+link+')');
        $('#poster').css('background-repeat', 'no-repeat');
        $('#poster').css('background-size', '100% 100%'); 
        $('#poster').show();
      } 
    
} else if (event.data.action == 'close') {
      $('#reg-paper').hide();
    }
  });
});