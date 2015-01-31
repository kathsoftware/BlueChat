<%@ page import="com.kathsoftware.ChatMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Blue Chat</title>
		
		<script type='text/javascript' src='js/jquery-2.1.3.js'></script>

<script type='text/javascript'>

var sendToUser = "";
setInterval(function () {getUsers()}, 5000);
setInterval(function () {getMessages()}, 10000);

function getUsers()
{
    $.ajax({
      url: 'ChatMessage/getUserList/',
      data: 'username=' + "jkath", 
      dataType: 'json', // Choosing a JSON datatype
      success: function(data)
      {
	    var $select = $('#userselectlist');                        
		$select.find('option').remove();
		
        for (var x = 0; x < data.length; x++) {
	    	$select.append("<option value='username'>" + data[x].username + '</option>');
        }      	
        
        if(sendToUser != ""){
        	$("#userselectlist option").filter(function() {
    			return $(this).text() == sendToUser; 
			}).prop('selected', true);
        }
        
      }
    });
    
}

function getMessages()
{
    $.ajax({ 
      url: 'ChatMessage/getMessages/',
      data: 'username=' + sendToUser, 
      dataType: 'json',
      success: function(data) 
      {
      
      	var $messages = $('#messageslistarea');
      
	    $messages.val("");
		
		for (i = 0; i < data.length; i++) {

            var dt = data[i].dateTimeSent;
            var fromUser = data[i].fromUser;
            var toUser = data[i].toUser;
            var msg = data[i].message;

            $messages.val( $messages.val() + "\n" + dt + "    From: " + fromUser + "    To: " + toUser );
            
            $messages.val( $messages.val() + "\n" + msg + "\n");
            
            $messages.scrollTop($('#messageslistarea')[0].scrollHeight);

        }
        
      }
    });
    
    $("#responsemessage").text("");
    
}

function postMessage()
{
	$("#responsemessage").text("");

	$("#userselectlist option:selected").text();

	var $messageTA = $('#sendmessage');
	
	$.ajax({ // ajax call starts
      url: 'ChatMessage/sendMessage/',
      data: 'message=' + $messageTA.val() + "&" + "user=" + sendToUser, 
      success: function(data)
      {
		$("#responsemessage").text(data);
		$messageTA.val("");
		getMessages();
      }
    });
}

$(document).ready(function(){
	
	$("#sendtomessagelabel").text("Recipient: None Selected Yet");
	$("#messagesfromuser").text("Recipient Not Selected Yet");
	
	
	
	$("#sendmessagebtn").prop("disabled", true);
	
	$("#userselectlist").on('change', function (e) {
	    var optionSelected = $(this).find("option:selected");
     	sendToUser = optionSelected.text();
		$("#sendtomessagelabel").text("Recipient: " + sendToUser);     	
		$("#sendmessagebtn").prop("disabled", false);
		$("#messagesfromuser").text(sendToUser);     
		getMessages();	
	});
	
	$( "#sendmessagebtn" ).click(function() {
	  postMessage();
	});
	
	getUsers();
	getMessages();
	
	$("#messageslistarea").prop("disabled", true);
});

</script>	

		<style type="text/css">
			body {color: white; background-image: url(assets/bluebgtile.jpg);}
		</style>
		

	</head>
	<body>

		<div id="messagelist" style="margin-left: 20px;">
			Conversations With: <span id="messagesfromuser"></span>
			<textarea id="messageslistarea" style="height: 400px; width: 850px"></textarea>
		</div>	
	
		<div id="userlist" style="float: left;  margin-left: 20px;">
			<br>Users<br>
			<select id="userselectlist" size="5" style="min-width:100px;">
			</select>
		</div>	
		
		<div id="sendmessagearea" style="float: left; margin-left: 20px;">
			<br>
			<span id="sendtomessagelabel"></span>
			<br>
			<textarea id="sendmessage" style="height: 100px; width: 730px;"></textarea>
			<br>
			<button id="sendmessagebtn">Send Message</button>
			<br><br>
			<span id="responsemessage"></span>
		</div>	

		
	</body>
</html>
