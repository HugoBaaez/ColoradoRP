$(document).ready(function(){
  window.addEventListener('message', function( event ) {
if (event.data.action == 'open') {
      var type      = event.data.type;
	  var firstname  	= event.data.array['firstname'];
	  var lastname  	= event.data.array['lastname'];    
      var dob  	= event.data.array['dob'];
      var city  	= event.data.array['city'];
      var eyes  	= event.data.array['eyes']; 
      var hair  	= event.data.array['hair']; 
      var weight	= event.data.array["weight"];
      var height	= event.data.array["height"]; 
      var sex	= event.data.array["sex"];      
      var job  	= event.data.array['job']; 
      var date  	= event.data.array['regdate']; 
      var nrid  	= event.data.array['idnr'];  
      var sign  	= event.data.array['sign'];   

     if (type == "read") {
        $('#potrait').css('z-index', '4');  
        $('#potrait2').css('z-index', '3');         
        $('#reg-paper').show(); 
        $('#potrait').show();   
        $('#potrait2').show();           
        $('#first-name').text(firstname);         
        $('#last-name').text(lastname);
        $('#dob').text(dob);   
        $('#city').text(city); 
        $('#eyes').text(eyes); 
        $('#hair').text(hair);
        $('#weight').text(weight); 
        $('#height').text(height);  
        $('#sex').text(sex);           
        $('#job').text(job); 
        $('#date').text(date);   
        $('#nrid').text(nrid);  
        $('#sign').text(sign); 
        $('#sign2').text(firstname + lastname); 
         
        $('#potrait2').css('background-image', 'url(assets/images/'+nrid+'.png)');
        $('#potrait2').css('background-repeat', 'no-repeat');
        $('#potrait2').css('background-size', '100% 100%');  
      } 
    
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