package edu.poly.site.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.FavoriteDao;
import edu.poly.model.Video;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet("/Favorite")
public class FavoriteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!SessionUtils.isLogin(request)) {
            response.sendRedirect("Login"); // Chuyển hướng người dùng đến trang đăng nhập nếu chưa đăng nhập
            return;
        }

        // Lấy userId từ session hoặc từ đối số request, tùy thuộc vào cách bạn cài đặt
        String userId = SessionUtils.getLoginedUsername(request); // Giả sử userId được lưu trong session

        FavoriteDao favoriteDao = new FavoriteDao();
        List<Video> favoriteVideos = favoriteDao.findFavoriteVideos(userId);

        request.setAttribute("Videos", favoriteVideos);
        PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FAVORITE_PAGE);
   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
