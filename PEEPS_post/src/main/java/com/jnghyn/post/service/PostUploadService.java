package com.jnghyn.post.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jnghyn.post.dao.FileDao;
import com.jnghyn.post.dao.PostDao;
import com.jnghyn.post.domain.Post;
import com.jnghyn.post.domain.PostFile;
import com.jnghyn.post.domain.PostWriteRequest;


@Service
public class PostUploadService {

	private PostDao dao;
	private FileDao fDao;

	@Autowired
	private SqlSessionTemplate template;

	// 게시글 저장
	public int uploadPost(PostWriteRequest writeRequest, HttpServletRequest request) {
		
		// 세션 멤버 idx 
		int memberIdx = writeRequest.getUserIdx();
		
		int postResult = 0;

		MultipartFile[] files = writeRequest.getPostformfile();
		
		// 웹 경로
		String uploadPath = "/resources/fileupload/postfile";
		// 실제 경로
		String saveDirPath = request.getSession().getServletContext().getRealPath(uploadPath);
		String fileName = "";
		String newFileName = "";
		File newFile = null;

		// 게시글 데이터 바인딩
		Post post = writeRequest.toPost();
		post.setMember_idx(memberIdx);

		try {
			// 데이터베이스 입력
			dao = template.getMapper(PostDao.class);

			// 게시글 DB insert
			postResult = dao.insertPost(post);

		} catch (Exception e) {
			System.out.println("게시글 저장 실패");
			e.printStackTrace();
		}

		// 이미지 파일 저장 시작
		if (postResult > 0 && files[0].getSize() > 0) {

			String thumbnailFname = files[0].getOriginalFilename();

			for (MultipartFile mf : files) {

				fileName = "postidx"+post.getP_idx();
				newFileName = System.currentTimeMillis() + fileName;

				// 첫번째 파일 이름을 게시글 썸네일 이름으로 설정
				if (mf.getOriginalFilename() == thumbnailFname) {
					post.setP_thumbnail(newFileName);
				}

				try {
					// 디렉토리에 저장
					mf.transferTo(newFile = new File(saveDirPath, newFileName));
					PostFile postFile = new PostFile();
					postFile.setF_name(newFileName);
					postFile.setPost_idx(post.getP_idx());
					// 21.03.02 파일 (실제)경로 설정
					postFile.setF_path(saveDirPath);

					// 파일 DB insert
					fDao = template.getMapper(FileDao.class);
					int postFileResult = fDao.insertFiles(postFile);
					
					
				} catch (Exception e) {
					e.printStackTrace();
					// 현재 저장된 파일 있을 경우 삭제
					if (newFile != null && newFile.exists()) {
						newFile.delete();
					}
				}
			} // foreach end
			
			// 게시글 썸네일 이름 update
			dao.updatePostThumbnail(post.getP_idx(), post.getP_thumbnail());
		} // 파일 저장 시작 if end

		

		return postResult;
	}

}
