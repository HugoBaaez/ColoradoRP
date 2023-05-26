$(document).ready(function(){
  window.addEventListener('message', function( event ) {
if (event.data.action == 'open') {
      var type      = event.data.type;
	  var fdest  	= event.data.array['fdest'];
      var ldest  	= event.data.array['ldest'];
      var sender  	= event.data.array['sender'];
      var text  	= event.data.array['text']; 
    
     if (type == "read") {
        $('#MAIN').css('background', 'url(assets/images/papertelegram.png)');
        $('#MAIN').css('background-repeat', 'no-repeat');
        $('#MAIN').css('background-size', '100% 100%');  
        $('#last-name').show(); 
        $('#last-name2').show();  
        $('#first-name').text(sender);
        $('#dob').text(text);
        $('#last-name').text(fdest);
        $('#last-name2').text(ldest); 
         
        $('#send_button').hide();
        $('#telegram').hide();
        $('#textid').hide();
        $('#textid2').hide(); 
        $('#textid3').hide(); 
        $('#cancel_button').hide();
        $('#MAIN').show();   
      } else if ( type == "send") {
        $('#last-name').hide(); 
        $('#last-name2').hide();   
        $('#MAIN').css('background', 'url(assets/images/papertelegram.png)');
        $('#MAIN').css('background-repeat', 'no-repeat');
        $('#MAIN').css('background-size', '100% 100%');   
          
        $('#first-name').text(sender);
        $('#send_button').show();
        $('#telegram').show();
        $('#textid').show();
        $('#textid2').show();  
        $('#cancel_button').show(); 
        $('#MAIN').show();
      } else if ( type == "send2") {
        $('#last-name').hide(); 
        $('#last-name2').hide();   
        $('#MAIN').css('background', 'url(assets/images/anonytelegram.png)');
        $('#MAIN').css('background-repeat', 'no-repeat');
        $('#MAIN').css('background-size', '100% 100%');  
          
        $('#first-name').text(sender);
        $('#send_button').show();
        $('#telegram').show();
        $('#textid').show();
        $('#textid2').show();  
        $('#cancel_button').show(); 
        $('#MAIN').show();
      } else if ( type == "read2") {
        $('#last-name').show(); 
        $('#last-name2').show();  
        $('#first-name').text(sender);
        $('#dob').text(text);
        $('#last-name').text(fdest);
        $('#last-name2').text(ldest); 
        $('#MAIN').css('background', 'url(assets/images/anonytelegram.png)');
        $('#MAIN').css('background-repeat', 'no-repeat');
        $('#MAIN').css('background-size', '100% 100%');   
        $('#send_button').hide();
        $('#telegram').hide();
        $('#textid').hide();
        $('#textid2').hide(); 
        $('#cancel_button').hide();
        $('#MAIN').show();  
      } 
    
} else if (event.data.action == 'close') {
      $('#first-name').text('');
      $('#last-name').text('');
      $('#dob').text('');
      $('#MAIN').hide();
      init()
    }
  });
});

function init() {
document.getElementById("textid").value = "";
document.getElementById("textid2").value = "";
document.getElementById("textid3").value = "";
document.getElementById("telegram").value = "";
}
window.onload = init;

$(document).on('click', '#send_button', function() {
	  var text = $('#telegram').val();
      var firstname = $('#textid').val();    
      var lastname = $('#textid2').val(); 
      var money = $('#textid3').val(); 
      $.post('https://SS-Telegram/sendtelegram', JSON.stringify({ text:text, firstname:firstname, lastname:lastname, money:money}))
});

$(document).on('click', '#cancel_button', function() { 
$.post('https://SS-Telegram/closetelegram', JSON.stringify({ }))
});