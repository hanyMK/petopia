<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>chatBot</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#title{
	 	text-align: center;
	}
	
	#inputBox{
		margin-top:300px; 
	}
	
	#dog{
	 	height: 100%;
	 	width: 190px;
	}
	
   
	 .user{
        text-align: right;
        padding: 5px;
        background-color: lightgray;
        border-radius: 4px;
        font-size: 14px;
        margin-bottom: 10px;
    }
    
    .bot{
        text-align: left;
        padding: 5px;
        background-color: lightblue;
        border-radius: 4px;
        font-size: 14px;
        margin-bottom: 10px;
    }
	
	 .typing-indicator {
        text-align: left;
        padding: 5px;
        background-color: lightgray;
        border-radius: 4px;
        font-size: 14px;
        display: inline-block;
        width: 50px;
        margin-bottom: 10px;
        animation: typing 1s infinite;
    }
    
    @keyframes typing {
        0% {
            opacity: 0.3;
        }
        50% {
            opacity: 0.6;
        }
        100% {
            opacity: 1;
        }
    }
	
</style>
<script>
 
    $(document).ready(function() {
        var chatContainer = $("#chatContainer");
        var messageInput = $("#messageInput");

        $("button").click(function(e) {
            e.preventDefault();
            var message = messageInput.val();
            if (message.trim() !== "") {
                sendMessage(message);
                messageInput.val("");
            }
        });

        function sendMessage(message) {
        chatContainer.append("<div class=\"typing-indicator\"><p>...</p></div>");  // 대기 표시기 추가
            $.ajax({
                type: "POST",
                url: "sendMessage.ct",
                data: { message: message },
                success: function(response) {
                	chatContainer.find(".typing-indicator").remove();
                    chatContainer.append("<div class=\"user\"><p>" + message + "</p></div>");
                    chatContainer.append("<div class=\"bot\"><p>" + response + "</p></div>"); 
                },
                error: function(xhr, status, error) {
                    console.log("에러야");
                }
            });
        }
    });
  </script>
</head>

<body>
		
	<div id="chatDog" align="left" >
        <img id="dog" src="resources/images/chatDog.png" alt="챗봇 캐릭터" onclick="window.location.reload()">
	</div>
	
	<div id="chatBot">
		
	    <div id="chatContainer"></div>
		<div id="inputBox" align="right">
	    <input type="text" id="messageInput" />
	    <button type="submit">전송</button> 
		</div>
	</div>

		
	 	

</body>
</html>


