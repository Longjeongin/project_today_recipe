package com.myproject.my.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myproject.my.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	// 회원가입
	public int registMember(MemberVO vo);
	// 로그인
	public MemberVO loginMember(MemberVO vo);
	// 프로필사진 업로드
	public int profileUpload(MemberVO vo);
	// 아이디 체크
	public int idCheck(String memId);
	// 회원정보 수정
	public int changeProfile(MemberVO vo);
}
