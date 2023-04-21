<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>채팅 클라이언트</title>
<style>
body {
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
	font-family: Arial, sans-serif;
}

h1 {
	font-size: 3rem;
	font-weight: bold;
	text-align: center;
	margin: 2rem 0;
}

.chat-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 2rem;
	background-color: #ffffff;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	border-radius: 0.5rem;
	margin: 2rem auto;
	max-width: 600px;
	min-height: 400px;
}

.chatbox {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: flex-start;
	height: 80%;
	overflow-y: auto;
	padding: 1rem;
	margin-bottom: 2rem;
	border: 1px solid #ccc;
	border-radius: 0.25rem;
	width: 100%;
	background-color: #f7f7f7;
}

.chatbox p {
	margin: 0.5rem;
	padding: 0.5rem;
	border: 1px solid #aaa;
	border-radius: 0.25rem;
	background-color: #fff;
	max-width: 70%;
	word-wrap: break-word;
}

.chat-input {
	display: flex;
	align-items: center;
	margin-top: auto;
	width: 100%;
	max-width: 600px;
	height: 3rem;
	border: none;
	border-top: 1px solid #ccc;
	padding: 0 1rem;
	background-color: #f7f7f7;
}

.chat-input input[type="text"] {
	flex: 1;
	height: 100%;
	margin-right: 1rem;
	border: none;
	border-radius: 0.25rem;
	padding: 0.5rem;
	font-size: 1rem;
	background-color: #fff;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
}

.chat-input button {
	border: none;
	border-radius: 0.25rem;
	background-color: #3c3c3c;
	color: #fff;
	font-size: 1rem;
	padding: 0.5rem 1rem;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.12), 0 1px 1px rgba(0, 0, 0, 0.24);
	cursor: pointer;
}

@media screen and (max-width: 600px) {
  .chat-container {
    border: 1px solid #ccc;
    height: 300px;
    width: 100%;
    overflow-y: scroll;
  }

  #message {
    width: 70%;
    margin-right: 10px;
    margin-bottom: 10px;
  }

  #send-button {
    width: 20%;
    margin-bottom: 10px;
  }

  .input-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
  }
</style>

</head>
<body>
	<h1>치킨챗</h1>
	<div id="chatbox"></div>
	<input type="text" id="message" placeholder="메시지를 입력하세요" />
	<button onclick="sendMessage()">보내기</button>

	<script>
		// WebSocket 연결 생성
		const ws = new WebSocket("ws://localhost:8080/chat");

		// 새로운 메시지가 도착할 때마다 화면에 출력
		ws.onmessage = function(event) {
			const message = event.data;
			const chatbox = document.getElementById("chatbox");
			const p = document.createElement("p");
			p.innerText = message;
			chatbox.appendChild(p);
		}

		// 입력한 메시지를 서버로 전송
		function sendMessage() {
			const message = document.getElementById("message").value;
			ws.send(message);
		}
	</script>
</body>
</html>