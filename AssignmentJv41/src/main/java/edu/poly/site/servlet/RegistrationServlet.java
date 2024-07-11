package edu.poly.site.servlet;

import java.io.IOException;
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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/Registration")
public class RegistrationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_REGISTRATION_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		User user = new User();
//		try {
//			
//			BeanUtils.populate(user, request.getParameterMap());
//			
//			UserDao dao = new UserDao();
//			dao.insert(user);
//			request.getRequestDispatcher("/Login").forward(request, response);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("Error", e.getMessage());
//		}
//		request.setAttribute("user", user);
//		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_REGISTRATION_PAGE);
		User user = new User();
		try {
			// Tạo một đối tượng User
			
			
			// Sao chép các tham số từ request vào đối tượng User
			BeanUtils.populate(user, request.getParameterMap());
			
			// Tạo một đối tượng UserDao để thực hiện việc thêm mới người dùng
			UserDao dao = new UserDao();
			dao.insert(user);
			
			// Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
			response.sendRedirect(request.getContextPath() + "/Login");
			
		} catch (Exception e) {
			// Nếu có lỗi xảy ra, in stack trace và gửi thông báo lỗi về phía người dùng
			e.printStackTrace();
			request.setAttribute("Error", e.getMessage());
			
			// Chuyển tiếp lại trang đăng ký với thông tin người dùng đã nhập
			request.setAttribute("user", user);
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_REGISTRATION_PAGE);
		}
	}

}
