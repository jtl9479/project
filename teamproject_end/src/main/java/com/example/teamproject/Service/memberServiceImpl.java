package com.example.teamproject.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.teamproject.Mapper.memberMapper;
import com.example.teamproject.Vo.MemberVo;
import com.example.teamproject.Vo.QBoardVo;
import com.example.teamproject.Vo.ReservationVo;

@Service
public class memberServiceImpl implements memberService {

	@Autowired
	memberMapper memberMapper;
	
	//마이페이지 이동
	@Override
	public MemberVo memberMypage(String m_id) {

		MemberVo memberVo = new MemberVo();
		
		System.out.println("전"+m_id);
		
		memberVo = memberMapper.memberMypage(m_id);
		System.out.println("후");
		
		return memberVo;
	}

	//개인정보 수정 확인
	@Override
	public int member_Modify(MemberVo memberVo) {

		System.out.println("수정");
		System.out.println(memberVo.getM_email());
		
		int result = memberMapper.member_Modify(memberVo);
		
		return result;
	}

	//충전 페이지 이동
	@Override
	public MemberVo member_charge(String m_id) {
		
		MemberVo memberVo = new MemberVo();
		
		memberVo = memberMapper.member_charge(m_id);
		return memberVo;
	}

	//포인트 충전
	@Override
	public int member_pointcharge(String m_id, String m_point) {
		

		int result = memberMapper.member_pointcharge(m_id,m_point);
		
		return result;
	}

	//예약 정보 가지고오
	@Override
	public ArrayList<ReservationVo> selectReserList(int m_no) {
		ArrayList<ReservationVo> list = memberMapper.selectReserList(m_no);
		return list;
	}

	@Override
	public Map<String, Object> selectQBoardList(String member, String m_id) {
		Map<String, Object> map = new HashMap<String,Object>();
		ArrayList<QBoardVo> list = memberMapper.selectQBoardList(member,m_id);
		map.put("list", list);
		return map;
	}
	

	
}
