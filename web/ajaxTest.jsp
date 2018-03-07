<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="<%request.getContextPath();%>/css/common.css"/>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function loadXMLDoc() {
            var xmlhttp;
            var txt, x, i;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    xmlDoc = xmlhttp.responseXML;
                    txt = "";
                    x = xmlDoc.getElementsByTagName("title");
                    y = xmlDoc.getElementsByTagName("author");
                    for (i = 0; i < x.length; i++) {
                        txt = txt + "<strong>" + x[i].childNodes[0].nodeValue + "</strong>---";
                        txt = txt + y[i].childNodes[0].nodeValue + "<br />";
                    }
                    document.getElementById("myDiv").innerHTML = txt;
                }
            }
            xmlhttp.open("GET", "/ajaxTestXml.xml", true);
            xmlhttp.send();
        }
    </script>
</head>
<body>
<h2>My Book Collection:</h2>
<div id="myDiv"></div>
<button type="button" onclick="loadXMLDoc()">获得我的图书收藏列表</button>
<br>
<hr>
<table cellpadding="1" cellspacing="1" class="admin-list">
    <tr>
        <td>open(method,url,async)</td>
        <td>
            <p>规定请求的类型、URL 以及是否异步处理请求。</p>
            <ul>
                <li>0: <strong>method：</strong>请求的类型；GET 或 POST</li>
                <li>1: <strong>url：</strong>文件在服务器上的位置</li>
                <li>2: <strong>async：</strong>true（异步）或 false（同步）</li>
            </ul>

        </td>
    </tr>
    <tr class="admin-list-head">
        <td>send(string)</td>
        <td><p>将请求发送到服务器。</p>
            <ul><strong>string：</strong>仅用于 POST 请求</ul>
        </td>
    </tr>
    <tr>
        <td>setRequestHeader(header,value)</td>
        <td>
            <p>向请求添加 HTTP 头。</p>
            <ul>
                <li><strong>header: </strong>规定头的名称</li>
                <li><strong>value: </strong>规定头的值</li>
            </ul>
        </td>
    </tr>
    <tr class="admin-list-head">
        <td>responseText</td>
        <td>获得字符串形式的响应数据。</td>
    </tr>
    <tr>
        <td>responseXML</td>
        <td>获得 XML 形式的响应数据。</td>
    </tr>
    <tr class="admin-list-head">
        <td>onreadystatechange 事件</td>
        <td><P>当请求被发送到服务器时，我们需要执行一些基于响应的任务。</P>
            <ul>
                <li>每当 readyState 改变时，就会触发 onreadystatechange 事件。</li>
                <li>readyState 属性存有 XMLHttpRequest 的状态信息。</li>
                <li>下面是 XMLHttpRequest 对象的三个重要的属性：</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th style="width:25%;background: #5d5d5d">属性</th>
        <th style="background: #5d5d5d">描述</th>
    </tr>

    <tr>
        <td>onreadystatechange</td>
        <td>存储函数（或函数名），每当 readyState 属性改变时，就会调用该函数。</td>
    </tr>

    <tr class="admin-list-head">
        <td>readyState</td>
        <td>
            <p>存有 XMLHttpRequest 的状态。从 0 到 4 发生变化。</p>
            <ul>
                <li>0: 请求未初始化</li>
                <li>1: 服务器连接已建立</li>
                <li>2: 请求已接收</li>
                <li>3: 请求处理中</li>
                <li>4: 请求已完成，且响应已就绪</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td>status</td>
        <td><p>200: "OK"</p>
            <p>404: 未找到页面</p></td>
    </tr>
</table>
</body>
</html>
