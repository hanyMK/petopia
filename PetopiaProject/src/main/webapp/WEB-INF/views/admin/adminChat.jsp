<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
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
                $.ajax({
                    type: "POST",
                    url: "sendMessage.ad",
                    data: { message: message },
                    success: function(response) {
                        chatContainer.append("<div><h3>사용자:</h3><p>" + message + "</p></div>");
                        chatContainer.append("<div><h3>챗봇:</h3><p>" + response + "</p></div>");
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            }
        });
    </script>
    
<body>
  <h1>챗봇</h1>
    <div id="chatContainer"></div>
    <input type="text" id="messageInput" />
    <button type="submit">전송</button>
</body>
</html>





