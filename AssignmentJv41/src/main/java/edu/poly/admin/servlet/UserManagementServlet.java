package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.UserDao;
import edu.poly.model.User;

/**
 * Servlet implementation class UserManagementServlet
 */
@WebServlet({"/Admin/UsersManagement","/Admin/UsersManagement/create","/Admin/UsersManagement/update","/Admin/UsersManagement/delete","/Admin/UsersManagement/reset","/Admin/UsersManagement/edit"})
public class UserManagementServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if(url.contains("edit")) {
			edit(request,response);
			return;
		}
		if(url.contains("delete")) {
			delete(request,response);
			return;
		}
		if(url.contains("reset")) {
			reset(request,response);
			return;
		}
		
		User user = new User();
		
		findAll(request,response);
		request.setAttribute("user", user);
		
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
		
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getRequestURL().toString();
		if(url.contains("create")) {
			create(request,response);
			return;
		}
		if(url.contains("delete")) {
			delete(request,response);
			return;
		}
		if(url.contains("update")) {
			update(request,response);
			return;
		}
		if(url.contains("reset")) {
			reset(request,response);
			return;
		}
	}
	private void findAll(HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		try {
			
			
			UserDao dao = new UserDao();
			List<User> list = dao.findAll();
			request.setAttribute("users", list);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " +e.getMessage());
		}
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("username");
		if(id == null) {
			request.setAttribute("error", "Username is required");
			PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
			return;
		}
		try {
			UserDao dao = new UserDao();
			User user = dao.findById(id);
			request.setAttribute("user", user);
			findAll(request,response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " +e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
		
	}
	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		
		request.setAttribute("user", user);
		findAll(request,response);
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
	try {
		BeanUtils.populate(user, request.getParameterMap());
		
		UserDao dao = new UserDao();
		User oldUser= dao.findById(user.getUsername());
		
		dao.update(user);
		request.setAttribute("user", user);
		request.setAttribute("message", "user is updated");
		findAll(request,response);
	}catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "Error: " +e.getMessage());
	}
	PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
}
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("username");
		if(id == null) {
			request.setAttribute("error", "username is required");
			PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
			return;
		}
		try {
			UserDao dao = new UserDao();
			User user = dao.findById(id);
			if(user == null) {
				request.setAttribute("error", "usename is not found");
				PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
				return;
			}
			dao.delete(id);
			request.setAttribute("message", "username deleted");
			request.setAttribute("user", new User());
			findAll(request,response);
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " +e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
	}
	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		
		try {
		BeanUtils.populate(user, request.getParameterMap());	
		
		UserDao dao = new UserDao();
		dao.insert(user);
		request.setAttribute("user", user);
		request.setAttribute("message", "username inserted");
		}catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("error", "Error: "+e.getMessage());
	}
		findAll(request,response);
		PageInfo.prepareAndForward(request, response, PageType.USER_MANAGEMENT_PAGE);
}
}
