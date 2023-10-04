package itis.mk.Servlet;

import itis.mk.model.User;
import itis.mk.Servlet.impl.UserRepositoryImpl;
import itis.mk.Servlet.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/hw3";
    private static final String DB_USER = "maryam";
    private static final String DB_PASSWORD = "2003";

    private Connection connection;
    private UserRepository userRepository;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            userRepository = new UserRepositoryImpl(connection);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.html").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        List<User> userList = userRepository.getUserByEmail(email);

        if (!userList.isEmpty() && userList.get(0).getPassword().equals(password)) {
            request.getSession().setAttribute("loggedInUser", userList.get(0));
            response.sendRedirect("/index.jsp");
        } else {
            response.sendRedirect("/login?error=true");
        }
    }


    @Override
    public void destroy() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
