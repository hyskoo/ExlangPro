package kr.ac.exlang.model;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	String filename;
	long filesize;
	
	MultipartFile uploadFile;

	String uuid = UUID.randomUUID().toString().replace("-","");
	
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
		filename = uuid.toString() + "_" + uploadFile.getOriginalFilename();
		filesize = uploadFile.getSize();
		
	}
	public boolean transferTo(String path) {
		if(uploadFile != null) {
			try {
				
				uploadFile.transferTo(new File(path + filename));

//				파일업로드 폴더 추가생성해야됨

		
				return true;
				
			} catch (IllegalStateException e) {
				//파일이 실행중인경우에 생기는 오류
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	

//여기서 path는 컨트롤러에서 지정해준 d://upload이다.

}
