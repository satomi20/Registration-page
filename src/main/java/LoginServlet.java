import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class LoginServlet extends HttpServlet {
    private final UserDao  userDao;
    private static final long serialVersionUID = 1L;
    private static final String regandedit= "/registration.jsp";
    private static final String userList = "/index.jsp";

    public LoginServlet() {
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setName(req.getParameter("name"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        String userid = req.getParameter("id");
        if(userid == null || userid.isEmpty())
        {
            userDao.saveUser(user);
        }
        else
        {
            user.setId(Integer.parseInt(userid));
            userDao.editUser(user);
        }
        RequestDispatcher view = req.getRequestDispatcher(userList);
        req.setAttribute("users", userDao.getUsers());
        view.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String forward="";
        String action = req.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int userId = Integer.parseInt(req.getParameter("id"));
            userDao.deleteUser(userId);
            forward = userList;
            req.setAttribute("users", userDao.getUsers());
        } else if (action.equalsIgnoreCase("edit")){
            forward = userList;
            int userId = Integer.parseInt(req.getParameter("id"));
            User user = userDao.getUserById(userId);
            req.setAttribute("users", user);
        } else if (action.equalsIgnoreCase("listUser")){
            forward = userList;
            req.setAttribute("users", userDao.getUsers());
        } else {
            forward = regandedit;
        }
        RequestDispatcher view = req.getRequestDispatcher(forward);
        view.forward(req, resp);
    }
}
