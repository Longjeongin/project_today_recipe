package com.myproject.my.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myproject.my.member.dao.IMemberDAO;
import com.myproject.my.member.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	IMemberDAO dao;
	
	public void registMember(MemberVO vo) throws Exception {
		int result = dao.registMember(vo);
		
		if (result == 0) {
			throw new Exception();
		}
	}
	public MemberVO loginMember(MemberVO vo) throws Exception {
		MemberVO result = dao.loginMember(vo);
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
	public String profileUpload(MemberVO vo
							  , String uploadDir
							  , String webPath
							  , MultipartFile file) throws Exception {
		String origin = file.getOriginalFilename();
		String uniqe = UUID.randomUUID().toString() + "_" + origin;
		String dbPath = webPath + uniqe;
		Path filePath = Paths.get(uploadDir, uniqe);
		try {
			Files.copy(file.getInputStream(), filePath);
		} catch (IOException e) {
			throw new Exception("fail to save the file", e);
		}
		vo.setProfileImg(dbPath);
		int result = dao.profileUpload(vo);
		if(result == 0) {
			throw new Exception();
		}
			return dbPath;
		}
	public int idCheck(String memId) {
		int result = dao.idCheck(memId);
		return result;
	}
	public MemberVO changeProfile(MemberVO vo) {
		int result = dao.changeProfile(vo);
		if(result == 1) {
			return vo;
		}else {
			return null;
		}
	}
}










