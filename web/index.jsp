<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 18/4/23
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>jquery validate</title>
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script>
      /* 所有的jquery插件都遵循了一定的流程，把dom对象转化为jqueryd对象，然后再做对应的操作 */
      $(function(){
        $('#form').validate({
          debug:true // 定义debug模式，这样做不会提交
        })
      })
    </script>
  </head>
  <body>
    <form id="form" action="#" method="get">
      <input type="submit" name="提交">
    </form>
  </body>
</html>
