$(document).ready(function() {
  var page = 'menu';
  var subPage = null;
  var d = new Date();
  var month = d.getMonth()+1;
  var day = d.getDate();
  // LUA event listener
  window.addEventListener('message', function( event ) {
    if ( event.data.action == 'open' ) { 
      var data = event.data.array;
      var dates = event.data.nowdate;  
      $('#date').text(dates);
      Object.keys( data ).forEach(function(key) {
        if (data[key].classified == 1) {
          $('#welcome tbody').append('<tr title="classified" class="markup" offense="'+data[key].offense+'">'+                       
            '<td>'+data[key].date+'</td>'+
            '<td>'+data[key].offense+'</td>'+
            '<td>'+data[key].firstname+' '+data[key].lastname+'</td>'+
            '<td>'+data[key].charge+'</td>'+
            '<td>'+data[key].jail+'</td>'+
          '</tr>');
        } else {
          $('#welcome tbody').append('<tr offense="'+data[key].offense+'">'+
            '<td>'+data[key].date+'</td>'+
            '<td>'+data[key].offense+'</td>'+
            '<td>'+data[key].firstname+' '+data[key].lastname+'</td>'+
            '<td>'+data[key].charge+'</td>'+
            '<td>'+data[key].jail+'</td>'+
          '</tr>');
        }
      });
      $('#criminal-record-wrapper').show();
    }
  });
	


  // Menu - add
  $('#menu-add').click(function() {
    page = 'add';
    subPage = null;
    $('#welcome').hide();
    $('#add').show();
  });
    
  $('#menu-register').click(function() {
    page = 'register';
    subPage = null;
    $('#welcome').hide();
    $('#register').show();
  });

  // Menu - search
  $('#menu-search').click(function() {
    page = 'search';
    $('#welcome').hide();
    $('#search').show();
  });

  // Back to home page
  $('.back, .logo').click(function() {
    $('#search').hide();
    if ( subPage == null ) {
      $('#search-result tbody').html('');
      $('#welcome tbody').html('');
      $('#records tbody').html('');

      $.post('http://SS-Archives/fetch', JSON.stringify({
        type: 'start'
      }), function( cb ) {
        Object.keys( cb ).forEach(function(key) { 
          if (cb[key].classified == 1) {
            $('#welcome tbody').append('<tr title="classified" class="markup" offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          } else {
            $('#welcome tbody').append('<tr offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          }
        });
      });

      $('#'+page).hide();
      page = 'menu';
      $('#menu').show();
      $('#welcome').show();
      $('#search-result tbody').html('');
    } else {
      $('#'+subPage).hide();
      subPage = null;
      $('#search').show();
      $('#search-result tbody').html('');
    }
  });

  function getUser(dob, fname, lname) {
    $('#records tbody').html('');

    $.post('http://SS-Archives/fetch', JSON.stringify({
      type: 'user',
      dob: dob,
      firstname: fname,
	  lastname: lname,
    }), function( cb ) {
      if ( cb != 'error') {
        var recordid = cb['userinfo'][0].recordid;
        var dob = cb['userinfo'][0].dob;
        var sex = cb['userinfo'][0].sex;
		var identity = cb["ident"];
        $('.r-recordid').text(recordid);
        $('.r-name').text(cb['userinfo'][0].lastname +', '+ cb['userinfo'][0].firstname);
        $('.r-dob-day').text(dob);
        $('.r-aliases').text(cb['userinfo'][0].aliases);
        $('.r-sex').text(sex);
        $('.r-height').text(cb['userinfo'][0].height);
        $('.r-weight').text(cb['userinfo'][0].weight);
        $('.r-eyecolor').text(cb['userinfo'][0].eyecolor);
        $('.r-haircolor').text(cb['userinfo'][0].haircolor);         
        $('.r-sexx').text(cb['allFine']+"$");   
        for (var i = 0; i < recordid.length; i++) {
          $('#r-recordid .square:eq('+i+')').text(recordid.charAt(i));
        }  
	if ( identity == true ) { 
          $('.avatar').attr('src', 'nui://SS-IdentityCard/html/assets/images/'+recordid+'.png');
    } else {
         if ( sex == 'M' ) {
          $('.avatar').attr('src', 'assets/images/male.png');
        } else {
          $('.avatar').attr('src', 'assets/images/male.png');
        }
    }    

        Object.keys( cb['records'] ).forEach(function(key) {
          if (cb['records'][key].classified == 1) {
            $('#records tbody').append('<tr title="classified" class="markup" offense="'+cb['records'][key].offense+'">'+
              '<td>'+cb['records'][key].date+'</td>'+
              '<td>'+cb['records'][key].offense+'</td>'+
              '<td>'+cb['records'][key].firstname+' '+cb['records'][key].lastname+'</td>'+
              '<td>'+cb['records'][key].charge+'</td>'+
              '<td>'+cb['records'][key].jail+'</td>'+
            '</tr>');
          } else {
            $('#records tbody').append('<tr offense="'+cb['records'][key].offense+'">'+
              '<td>'+cb['records'][key].date+'</td>'+
              '<td>'+cb['records'][key].offense+'</td>'+
              '<td>'+cb['records'][key].firstname+' '+cb['records'][key].lastname+'</td>'+
              '<td>'+cb['records'][key].charge+'</td>'+
              '<td>'+cb['records'][key].jail+'</td>'+
            '</tr>');
          }
        });

        $('#menu').hide();
        $('#'+page).hide();
        page = 'criminal-record';
        $('#criminal-record').show();
      } else {
        console.log('error');
      }
    });
  }

  // Records table click
  $("body").on("click", "tbody tr", function() {
    if( !$(this).hasClass('markup') ) {
      if( !$(this).hasClass('user-search') ) {
        $.post('http://SS-Archives/fetch', JSON.stringify({
          type: 'record',
          offense: $(this).attr('offense'),
        }), function( cb ) {
            
      $('#search-result tbody').html('');
      $('#welcome tbody').html('');
      $('#records tbody').html('');
      $('.r-description').text("") 
            
            
          if ( cb != 'error' ) {
            var offense = cb['records'][0].offense;
            var term = cb['records'][0].jail;
			var recordid = cb['userinfo'][0].recordid;
              
            $('.r-date').text(cb['records'][0].date);
            $('.r-charge').text(cb['records'][0].charge);              
          	$('.r-bounty').html('<i>AMOUNT</i>' + cb['records'][0].bounty+"$");              
            $('.r-name').text(cb['userinfo'][0].lastname +', '+ cb['userinfo'][0].firstname);
            $('.r-dob').text(cb['records'][0].dob);
            $('.r-description').val(cb['records'][0].description);
            $('.r-description').text(cb['records'][0].description);              
            $('.r-offense').text(offense)
            $('#the-signature').text(cb['records'][0].warden);
            $('.r-year').html('<i>Minutes</i>' + term);
            $('.r-month').html('<i>M</i>' + parseInt(term[1]));
            $('.r-day').html('<i>D</i>' + parseInt(term[2]));
            $('.r-fine').html('<i>AMOUNT</i>' + parseInt(cb['records'][0].fine+'$'));
            for (var i = 0; i < offense.length; i++) {
              $('#r-offense .square:eq('+i+')').text(offense.charAt(i));
            }
              
	if ( cb['ident'] == true ) {   
              $('.avatar').attr('src', 'nui://SS-IdentityCard/html/assets/images/'+recordid+'.png');
    } else {
        	if ( cb['userinfo'][0].sex == 'M' ) {
              $('.avatar').attr('src', 'assets/images/male.png');
            } else {
              $('.avatar').attr('src', 'assets/images/female.png');
            } 
    }        
            $('#menu').hide();
            $('#'+page).hide();
            page = 'record-info';
            $('#record-info').show();
          } else {
            console.log('error');
          }
        });
      } else {
        getUser($(this).attr('dob'), $(this).attr('fname'), $(this).attr('lname'));
      }
    }
  });

  // Dateofbirth click
  $('.dob').click(function() {  
    getUser($(this).text());
  });

  // Submit search - Search the database
  $('#submit-search').click(function() {
    subPage = 'search-result';
    $('#search').hide();
    $('#search-result').show();
    $('#search-result p').text('Searching..');

    var offense = $('#offense-search').val();

    if ( offense.length > 0 ) {
      $.post('http://SS-Archives/fetch', JSON.stringify({
        type: 'record',
        offense: offense,
      }), function( cb ) {
      $('#search-result tbody').html('');
      $('#welcome tbody').html('');
      $('#records tbody').html(''); 
        if ( cb != 'error' ) {
          var offense = cb['records'][0].offense;
          var term = cb['records'][0].jail;
          $('.r-date').text(cb['records'][0].date);
          $('.r-charge').text(cb['records'][0].charge);
          $('.r-bounty').text(cb['records'][0].bounty+"$");          
          $('.r-name').text(cb['userinfo'][0].lastname +', '+ cb['userinfo'][0].firstname);
          $('.r-dob').text(cb['records'][0].dob);
          $('.r-offense').text(offense);
          $('#the-signature').text(cb['records'][0].warden);
          $('.r-year').html('<i>Minutes</i>' + term);
          $('.r-month').html('<i>M</i>' + parseInt(term[1]));
          $('.r-day').html('<i>D</i>' + parseInt(term[2]));
		  $('.r-fine').html('<i>AMOUNT</i>' + parseInt(cb['records'][0].fine+'$'));
          for (var i = 0; i < offense.length; i++) {
            $('#r-offense .square:eq('+i+')').text(offense.charAt(i));
          }

	if ( cb['ident'] == true ) {   
              $('.avatar').attr('src', 'nui://SS-IdentityCard/html/assets/images/'+recordid+'.png');
    } else {
        	if ( cb['userinfo'][0].sex == 'M' ) {
              $('.avatar').attr('src', 'assets/images/male.png');
            } else {
              $('.avatar').attr('src', 'assets/images/female.png');
            } 
        
    }

          $('#menu').hide();
          $('#'+page).hide();
          page = 'record-info';
          $('#record-info').show();
        } else {
          $('#search-result p').text('No results found');
        }
      });
    } else {
      $.post('http://SS-Archives/search', JSON.stringify( {
        firstname: $('#firstname-search').val().toUpperCase(),
        lastname: $('#lastname-search').val().toUpperCase(),
        dob: $('#dob-search').val(),
        offense: offense
      }), function( cb ) {
        if ( cb != 'error' ) {
          $('#search-result p').text('');
          Object.keys(cb).forEach(function(key) {
            $('#search-result tbody').append('<tr class="user-search" dob="'+cb[key].dob+'" fname="'+cb[key].firstname+'" lname="'+cb[key].lastname+'">'+
              '<td>'+cb[key].firstname+'</td>'+
              '<td>'+cb[key].lastname+'</td>'+
              '<td>'+cb[key].dob+'</td>'+
            '</tr>');
          });
          $('#'+page).hide();
          $('#search-result').show();
        } else {
          $('#search-result p').text('No results found');
        }
      });
    }
  });

  // Submit add - Add to database
  $('#submit-add').click(function() {
    var firstname = $('#firstname-add').val();
    var lastname  = $('#lastname-add').val();
    var dob       = $('#dob-add').val();
    var charge    = $('#charge-add').val();
    var description = $('#description-add').val();
    var term = $('#term-add').val();
    var date = $('#date-add').val();
    var bounty = $('#bounty-add').val();      

    if ( firstname.length > 0 && lastname.length > 0 && dob.length > 0 && charge.length > 0 && description.length > 0 && term.length > 0 && date.length > 0 ) {
      $.post('http://SS-Archives/add', JSON.stringify({
        firstname: firstname.toUpperCase(),
        lastname: lastname.toUpperCase(),
        dob: dob,
        charge: charge,
        description: description,
        term: term,
        date: date,
        bounty: bounty          
      }), function( cb ) {
        if ( cb != 'error' ) {
          var offense = cb['records'][0].offense;
          var term = cb['records'][0].jail;
          var recordid = cb['recordid'];
          $('.r-date').text(cb['records'][0].date);
          $('.r-bounty').text(cb['records'][0].bounty+"$");  
          $('.r-charge').text(cb['records'][0].charge);            
          $('.r-name').text(cb['userinfo'][0].lastname +', '+ cb['userinfo'][0].firstname);
          $('.r-dob').text(cb['records'][0].dob);
          $('.r-description').text(cb['records'][0].description);
          $('.r-offense').text(offense)
          $('#the-signature').text(cb['records'][0].warden);
          $('.r-year').html('<i>Minutes</i>' + term);
          $('.r-month').html('<i>M</i>' + parseInt(term[1]));
          $('.r-day').html('<i>D</i>' + parseInt(term[2]));
		  $('.r-fine').html('<i>AMOUNT</i>' + parseInt(cb['records'][0].fine+'$'));
          for (var i = 0; i < offense.length; i++) {
            $('#r-offense .square:eq('+i+')').text(offense.charAt(i));
          }

	if ( cb['ident'] == true ) {   
              $('.avatar').attr('src', 'nui://SS-IdentityCard/html/assets/images/'+recordid+'.png');
    } else {
        	if ( cb['userinfo'][0].sex == 'M' ) {
              $('.avatar').attr('src', 'assets/images/male.png');
            } else {
              $('.avatar').attr('src', 'assets/images/female.png');
            } 
    }

          $('#menu').hide();
          $('#'+page).hide();
          page = 'record-info';
          $('#record-info').show();
        } else {
          $('#add .error').slideDown( "slow", function() {
            setTimeout(function(){
              $('#add .error').slideUp('slow');
            }, 4000);
          });
        }
      });
    }
  });
  // REGISTER SEND
  $('#submit-register').click(function() {
    var id = $('#id-register').val();  
    var days = $('#dayborn-register').val();
    var month  = $('#monthborn-register').val();
    var age       = $('#age-register').val();
    var kg    = $('#kg-register').val();
    var eyes = $('#eyes-register').val();
    var hair = $('#hair-register').val();
    var cm = $('#height-register').val();

    if ( id.length > 0 && days.length > 0 && month.length > 0 && age.length > 0 && kg.length > 0 && eyes.length > 0 && hair.length > 0 && cm.length > 0) {
      $.post('http://SS-Archives/register', JSON.stringify({
        id: id,
        days: days,
        month: month,
        age: age,
        kg: kg,
        eyes: eyes,
        hair: hair,
        cm: cm  
      }), function( cb ) {
        if ( cb != 'error' ) {

          $('#register').hide();
          $('#'+page).hide();
          page = 'record-info';
          $('#welcome').show();
        } else {
          $('#register .error').slideDown( "slow", function() {
            setTimeout(function(){
              $('#register .error').slideUp('slow');
            }, 4000);
          });
        }
      });
    }
  });  

  // Submit update - Updates the description of a record
  $('#submit-update').click(function() {
    $.post('http://SS-Archives/update', JSON.stringify({
      offense: $('#signature .r-offense').text(),
      description: $('.r-description').val()
    }), function( cb ) {
      $('#search').hide();
      $('#search-result').hide();       
	  $('#search-result tbody').html('');
      $('#welcome tbody').html('');
      $('#records tbody').html('');
      $('.r-description').text("") 
      $('#search-result tbody').html('');  
        
      $.post('http://SS-Archives/fetch', JSON.stringify({
        type: 'start'
      }), function( cb ) {
        Object.keys( cb ).forEach(function(key) {
          if (cb[key].classified == 1) {
            $('#welcome tbody').append('<tr title="classified" class="markup" offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          } else {
            $('#welcome tbody').append('<tr offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          }
        });
      });
      $('#'+page).hide();
      page = 'menu';
      $('#menu').show();
      $('#welcome').show();
    });
  });

  // Submit classified - Makes a record classified
  $('#submit-classified').click(function() {
    $.post('http://SS-Archives/archive', JSON.stringify({
      offense: $('#signature .r-offense').text(),
      classified: 1
    }), function( cb ) {
      $('#welcome tbody').html('');

      $.post('http://SS-Archives/fetch', JSON.stringify({
        type: 'start'
      }), function( cb ) {
        Object.keys( cb ).forEach(function(key) {
          if (cb[key].classified == 1) {
            $('#welcome tbody').append('<tr title="classified" class="markup" offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          } else {
            $('#welcome tbody').append('<tr offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          }
        });
      });

      $('#'+page).hide();
      page = 'menu';
      $('#menu').show();
      $('#welcome').show();
    });
  });

  // Submit delete - Deletes a record, removes user as well if it's the only record
  $('#submit-delete').click(function() {
    $.post('http://SS-Archives/remove', JSON.stringify({
      offense: $('#signature .r-offense').text()
    }), function( cb ) {
      $('#search-result tbody').html('');
      $('#welcome tbody').html('');
      $('#records tbody').html('');

      $.post('http://SS-Archives/fetch', JSON.stringify({
        type: 'start'
      }), function( cb ) {

        Object.keys( cb ).forEach(function(key) {
          if (cb[key].classified == 1) {
            $('#welcome tbody').append('<tr title="classified" class="markup" offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          } else {
            $('#welcome tbody').append('<tr offense="'+cb[key].offense+'">'+
              '<td>'+cb[key].date+'</td>'+
              '<td>'+cb[key].offense+'</td>'+
              '<td>'+cb[key].firstname+' '+cb[key].lastname+'</td>'+
              '<td>'+cb[key].charge+'</td>'+
              '<td>'+cb[key].jail+'</td>'+
            '</tr>');
          }
        });
      });

      $('#'+page).hide();
      page = 'menu';
      $('#menu').show();
      $('#welcome').show();
    });
  });

  // Reset webpage
  function reset() {
    $('#search-result tbody').html('');
    $('#welcome tbody').html('');
    $('#records tbody').html('');
    $('#'+page).hide();
    page = 'menu';
    $('#search').hide();
    $('#search-result').hide();
    $('#menu').show();
    $('#welcome').show();
    $('#criminal-record-wrapper').hide();
  }

  // Close NUI - Escape key event
  $(document).keyup(function(e) {
    if (e.keyCode == 27) {
      reset();
      $.post('http://SS-Archives/escape', JSON.stringify({}));
    }
  });

  // Disable form submit
$("form").submit(function() {
		return false;
	});
});
