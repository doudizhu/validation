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
      $.validator.addMethod('fileExt',function (value,element,params) {
        // console.info('value:'+value+',element:'+element+',params:'+params);
        // return false
        var reg = new RegExp('\.('+params+')$','i');
        return reg.test(value);
      },
      // '文件类型出错！'
        $.validator.format('文件类型必须为{0}') // 失去焦点后才开始校验
      )

      $.validator.addMethod('mobileExt',function (value,element,params) {
          var reg = new RegExp(params+'$');
          return reg.test(value);
      },
        '请正确填写您的手机号码'
      )

      /* 所有的jquery插件都遵循了一定的流程，把dom对象转化为jqueryd对象，然后再做对应的操作 */
      $(function(){
        $('#form').validate({
          debug:false, // 定义debug模式，这样做不会提交
          // jquery validate可以采用name来确定验证的dom对象（jquery选择器:标签、class、id）
          onkeyup:false,// 是否检测按钮抬起事件（目前值为true时会报错，所以如果检测直接不写此属性）
          // 用来存储错误消息的标签
          errorElement:'span',
          errorPlacement:function (span,element) {
            // 应该把原来的span删除掉
            $(element).siblings('span').remove();
            // 再追加的时候应该吧ok样式删除掉
            $(element).parent().append(span);
          },
          // 方式一：如果是字符串，则样式会赋值到errorElement指定的标签中
//          success:'ok',
          // 方式二：如果是一个回调函数,则将标签作为唯一的参数
          success:function (span) {
              $(span).attr('class','ok')
          },
          rules:{
            // 配置具体的验证规则
            email:{
              // 如果有参数则"冒号"后面写参数,如果没有则为true,多个参数调用数组
//              required:true,
              email:true,
              // 仅仅只需要配置验证的url地址即可
              remote:{
                url:'servlet/AjaxServlet',
                // post请求再ie中不会有缓存问题（即相同参数请求，不会被重复发出）
                type:'post',
              }
            },
            age:{
              required:true,
              number:true,
              min:18,
            },
            password:{
              required:true,
              rangelength:[6,12],
            },
            confirm:{
              equalTo:'#password',
            },
            address:{
              required:true,
            },
            like:{
              required:true,
            },
            image:{
              required:true,
              // 配置调用自定义的调用方法
//              fileExt:['jpg','gif','png'],
              fileExt:'jpe?g|gif|png', // 也可 fileExt:'jpeg|jpg|gif|png'
            },
            mobile:{
              mobileExt:'^1\\d{10}', // *** 此处\d前需加"\"进行转义，或用[0-9]代替
            }
          },
          // 本地化错误消息
          messages:{
            email:{
              email:'邮箱格式不正确',
              remote:'该用户已经被占用',
            },
            age:{
              required:'年龄不能为空',
              number:'年龄必须为数字',
              min:'年龄必须在18岁以上',
            },
            password:{
              required:'密码必填',
              rangelength:$.validator.format('密码的长度必须为{0}-{1}之间'),
            },
            confirm:{
              equalTo:'密码不一致',
            },
            address:{
              required:'请选择地址',
            },
            like:{
              required:'必须选择一个爱好',
            },
            image:{
              required:'请选择要上传的文件',
            },
          },
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
        <input name="email" value="">
      </div>
      <div>
        <label>age：</label>
        <input name="age" size="2">
      </div>
      <div>
        <label>password：</label>
        <input name="password" type="password" id="password">
      </div>
      <div>
        <label>confirm：</label>
        <input name="confirm" type="password">
      </div>
      <div>
        <label>address：</label>
        <select name="address">
          <option value=""><-- 请选择 --></option>
          <option value="1">北京</option>
          <option value="2">上海</option>
          <option value="3">广州</option>
        </select>
      </div>
      <div>
        <label>like：</label>
        看书：<input type="checkbox" name="like" value="看书">
        上网：<input type="checkbox" name="like" value="上网">
        旅游：<input type="checkbox" name="like" value="旅游">
      </div>
      <div>
        <label>image：</label>
        <input name="image" type="file">
      </div>
      <div>
        <label>mobile：</label>
        <input name="mobile">
      </div>
      <input type="submit" value="提交">
    </form>
  </body>
</html>
