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
import edu.poly.dao.VideoDao;
import edu.poly.model.Video;

/**
 * Servlet implementation class VideoDetailServlet
 */
@WebServlet("/VideoDetail")
public class VideoDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Lấy videoId từ request parameter
        String videoId = request.getParameter("videoId");
        
        if (videoId != null && !videoId.isEmpty()) {
            try {
                // Tạo một đối tượng VideoDao để truy vấn cơ sở dữ liệu
                VideoDao videoDao = new VideoDao();
                
                // Tìm kiếm thông tin của video dựa trên videoId
                Video video = videoDao.findById(videoId);
                
                if (video != null) {
                    // Đưa thông tin của video vào request attribute để truy cập từ trang JSP
                    request.setAttribute("video", video);
                    video.setViews(video.getViews()+1);
                    videoDao.update(video);
                    
                    
                    List<Video> list = videoDao.findAll();
                    request.setAttribute("videos", list);
                    // Chuyển hướng sang trang JSP để hiển thị chi tiết video
                   PageInfo.prepareAndForwardSite(request, response, PageType.SITE_VIDEO_DETAIL_PAGE);
                   
                } else {
                    // Nếu không tìm thấy video, chuyển hướng sang trang thông báo lỗi
                    request.setAttribute("error", "Video not found!");
                  
                }
            } catch (Exception e) {
                // Xử lý ngoại lệ
                e.printStackTrace();
                request.setAttribute("error", "An error occurred while processing your request.");
       
            }
        } else {
            // Nếu không có videoId được cung cấp, chuyển hướng sang trang thông báo lỗi
            request.setAttribute("error", "Video ID is missing!");
       
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


	}

}
