<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    :root {--padding: 60px;}
    .box {
        box-sizing: border-box;
        margin: 0;
        padding: 0;

        position: relative;
        margin: 50px auto;
        width: 400px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding: var(--padding);
        background-color: #DDE6ED;
        border-radius: 7px;
    }
    .box input, .box button {padding: 15px;font-size: 1.2em;border: none;}
    .box input {margin-bottom: 25px;}
    .box button {background-color: #526D82;color: #9DB2BF;border-radius: 4px;}
</style>
<html>
<head>
    <title>Welcome</title>
</head>
<body style="background-color: #27374D">
    <div class="box">
        <input type="email" id="email" placeholder="Email" />
        <input type="password" id="password" placeholder="Password" />
        <button id="loginBtn">Sign in</button>
    </div>
</body>
</html>


<%--
    script는 html이 완전 로드되고 나서 실행되어야함.
    위에 선언되면 반응없음.
--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $("#loginBtn").on('click', function (){

        var email = $("#email").val();
        var password = $("#password").val();

        $.ajax({
            type: 'POST',
            url: '/api/login',
            data: JSON.stringify({ "email": email, "password": password }),
            contentType: 'application/json', // JSON 형태로 전송
            dataType: 'json',
            success: function (data, textStatus, XMLHttpRequest) {
                console.log("Response Data:", data); // JSON 데이터 확인
                console.log("User Email:", data.userEmail); // 추가된 데이터 확인
                location.href = "/main"; // 이동할 페이지 URL
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(data.message); // 로그인 실패 시 메시지 출력
            }
        });
    });
</script>