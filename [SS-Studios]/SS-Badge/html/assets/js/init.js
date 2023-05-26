$(document).ready(function(){
  window.addEventListener('message', function( event ) {
if (event.data.action == 'open') {
      var type      = event.data.type;
	  var name  	= event.data.array['name'];
      var server  	= event.data.array['server'];
      var image  	= event.data.array['badge'];
      var uname  	= event.data.array['uname'];    
      var userver  	= event.data.array['userver'];  
	$('#server').text(server); 
    $('#nume').text(name); 
    
 		if (uname == false) {
		$('#nume').text("");            
        }
     	if (userver == false) {
		$('#server').text("");            
        } 

        $('#reg-paper').show(); 
    	$('#reg-paper').css('background', "url(assets/images/"+image+".png)");
        $('#reg-paper').css('background-size', '100% 100%');
       	new CircleType(document.getElementById('nume'))
        .dir(-1)
  		.radius(115);
              new CircleType(document.getElementById('server'))
  		.radius(115);    
    
} else if (event.data.action == 'close') {
      $('#first-name').text('');
      $('#last-name').text('');
      $('#dob').text('');
      $('#reg-plate').text('');
      $('#sex').text('');
      $('#reg-date').text('');
      $('#reg-payment').text('');
      $('#reg-paper').hide();
    }
  });
});