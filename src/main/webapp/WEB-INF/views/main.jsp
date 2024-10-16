<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    table { border: 1px #a39485 solid; font-size: .9em; box-shadow: 0 2px 5px rgba(0,0,0,.25); width: 100%; border-collapse: collapse; border-radius: 5px; overflow: hidden; }
    th { text-align: left; }
    thead { font-weight: bold; color: #fff; background: #73685d; }
    td, th { padding: 1em .5em; vertical-align: middle; }
    td { border-bottom: 1px solid rgba(0,0,0,.1); background: #fff; }
    a { color: #73685d; }
    @media all and (max-width: 768px) {
        table, thead, tbody, th, td, tr { display: block; }
        th { text-align: right; }
        table { position: relative; padding-bottom: 0; border: none; box-shadow: 0 0 10px rgba(0,0,0,.2); }
        thead { float: left; white-space: nowrap; }
        tbody { overflow-x: auto; overflow-y: hidden; position: relative; white-space: nowrap; }
        tr { display: inline-block; vertical-align: top; }
        th { border-bottom: 1px solid #a39485; }
        td { border-bottom: 1px solid #e5e5e5; }
    }
</style>
<head>
    <title>[Redis]Session List</title>
</head>
<body style="padding:1.5em; background: #f5f5f5">
<h1>Redis Session List</h1>
<table>
    <thead>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Date of Birth</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>James</td>
        <td>Matman</td>
        <td>(713) 123-8965</td>
        <td><a href="mailto:jmatman@stewart.com">jmatman@stewart.com</a></td>
        <td>01/13/1979</td>
    </tr>
    <tr>
        <td>Johnny</td>
        <td>Smith</td>
        <td>(713) 584-9614</td>
        <td><a href="mailto:jsmith@stewart.com">jsmith@stewart.com</a></td>
        <td>06/09/1971</td>
    </tr>
    <tr>
        <td>Susan</td>
        <td>Johnson</td>
        <td>(713) 847-1124</td>
        <td><a href="mailto:sjohnson@stewart.com">sjohnson@stewart.com</a></td>
        <td>08/25/1965</td>
    </tr>
    </tbody>
</table>
</body>
</html>