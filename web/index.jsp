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
          debug:false, // 定义debug模式，这样做不会提交
          // jquery validate可以采用name来确定验证的dom对象（jquery选择器:标签、class、id）
          rules:{
            // 配置具体的验证规则
            email:{
              // 如果有参数则"冒号"后面写参数,如果没有则为true
              required:true,
              email:true,
            },
            age:{
              required:true,
              number:true,
              min:18,
            },
          }

        })
      })
    </script>
  </head>
  <body>
    <%-- 1. 272行：有验证的基本配置 --%>
    <%-- 2. 362行：有验证失败的错误消息，间接知道验证方法 --%>
    <%-- 3. 默认错误消息在被验证dom对象的后面 --%>
    <form id="form" action="#" method="get">
      <div>
        <label>email：</label>
        <input name="email">
      </div>
      <div>
        <label>age：</label>
        <input name="age">
      </div>
      <input type="submit" value="提交">
    </form>
  </body>
</html>
