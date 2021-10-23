package services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Admin;
import repository.AdminDao;

@WebServlet("/Admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao;

	public void init() {
		adminDao = new AdminDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");  
	       PrintWriter out=response.getWriter();  
	         
	       String name=request.getParameter("name");  
	       String password=request.getParameter("password");  
	         
	       Admin bean=new Admin();  
	       bean.setName(name);  
	       bean.setPassword(password);  
	       request.setAttribute("bean",bean);  
	         
	       boolean status=bean.validate();  
	         
	       if(status){  
	           RequestDispatcher rd=request.getRequestDispatcher("/AdminDashboard.html");  
	           rd.forward(request, response);  
	       }  
	       else{  
	       
	           RequestDispatcher rd=request.getRequestDispatcher("/adminError.jsp");  
	           rd.forward(request, response);  
	       }
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		try {
			switch (action) {
			case "Adminnew":
				showNewForm(request, response);
				break;
			case "Admininsert":
				insertAdmin(request, response);
				break;
			case "Admindelete":
				deleteAdmin(request, response);
				break;
			case "Adminedit":
				showEditForm(request, response);
				break;
			case "Adminupdate":
				updateAdmin(request, response);
				break;
			case "Adminlist":
				listAdmin(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listAdmin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Admin> listAdmin = adminDao.getAllAdmin();
		request.setAttribute("listAdmin", listAdmin);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminDisplay.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminIndex.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Admin existingAdmin = adminDao.getAdmin(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminIndex.jsp");
		request.setAttribute("admin", existingAdmin);
		dispatcher.forward(request, response);

	}

	private void insertAdmin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin newAdmin = new Admin(name, password);
		adminDao.saveAdmin(newAdmin);
		response.sendRedirect("Admin?action=Adminlist");
	}

	private void updateAdmin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		Admin admin = new Admin(id, name, password);
		adminDao.updateAdmin(admin);
		response.sendRedirect("Admin?action=Adminlist");
	}

	private void deleteAdmin(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		adminDao.deleteAdmin(id);
		response.sendRedirect("Admin?action=Adminlist");
	}
}
