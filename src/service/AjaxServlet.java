package service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by admin on 18/4/23.
 */
public class AjaxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(">>>>>>>>doGet");
        // this ： 当前类AjaxServlet
        // super ： 父类HttpServlet
//        super.doGet(req, resp);
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        // 通过email获取请求的参数
        String email = req.getParameter("email");
        System.out.println("email:"+email);
        PrintWriter writer = resp.getWriter();
        if(email.equals("10000@qq.com")){
            // 当前email地址已经被注册，发送false代表验证失败
            writer.write("false");
        }else {
            writer.write("true");
        }
        writer.close();
    }
}
