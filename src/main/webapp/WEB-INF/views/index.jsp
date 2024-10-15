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
        background-color: #c4dfff;
        border-radius: 7px;
    }
    .box input, .box button {padding: 15px;font-size: 1.2em;border: none;}
    .box input {margin-bottom: 25px;}
    .box button {background-color: #ffe4c4;color: #547fb2;border-radius: 4px;}
</style>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <div class="box">
        <input type="email" placeholder="Email" />
        <input type="password" placeholder="Password" />
        <button>Sign in</button>
    </div>
</body>
</html>
