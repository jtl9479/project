package com.example.teamproject.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.teamproject.Mapper.Fac_admin_Mapper;
import com.example.teamproject.Vo.Fac_admin_Vo;
import com.example.teamproject.Vo.FmanagerVo;
import com.example.teamproject.Vo.PaymentVo;
import com.example.teamproject.Vo.QBoardVo;
import com.example.teamproject.Vo.ReservationVo;
import com.example.teamproject.Vo.ReviewVo;



@Service
public class Fac_admin_ServiceImpl implements Fac_admin_Service {

	@Autowired
	Fac_admin_Mapper fac_admin_Mapper;
	
	@Override//insertList
	public int insertFile(Fac_admin_Vo fac_admin_Vo) {
		int result = fac_admin_Mapper.insertFile(fac_admin_Vo);
		System.out.println(fac_admin_Vo.getFm_id());
		return result;
	}

	@Override//allList
	public Map<String, Object> selectAllList(String fm_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Fac_admin_Vo> list	= fac_admin_Mapper.selectAllList(fm_id);
		map.put("list", list);
		return map;
	}

	@Override//selectOneList
	public Fac_admin_Vo selectOneList(int finfo_no) {
		Fac_admin_Vo fac_admin_Vo = fac_admin_Mapper.selectOneList(finfo_no);
		return fac_admin_Vo;
	}

	@Override//modify
	public int updateListModify(Fac_admin_Vo fac_admin_Vo) {
		int result = fac_admin_Mapper.updateOneList(fac_admin_Vo);
		return result;
	}

	@Override//delete
	public void deleteOneList(int finfo_no) {
		fac_admin_Mapper.deleteOneList(finfo_no);
		
	}

	@Override
	public Map<String, Object> selectReserveList(int page, String fm_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReservationVo> list = fac_admin_Mapper.selectReserveList(fm_id);
		
		map.put("list", list);
		
		return map;
	}

	@Override
	public FmanagerVo fmanagerMypage(String fm_id) {
		FmanagerVo fVo = fac_admin_Mapper.fmanagerMypage(fm_id);
		return fVo;
	}

	@Override
	public int fm_Modify(FmanagerVo fVo) {
		System.out.println("수정");

		int result = fac_admin_Mapper.fm_Modify(fVo);
		
		return result;
	}

	@Override
	public Map<String, Object> selectReviewList(String fm_id) {
		Map<String,Object> map = new HashMap<String,Object>();
		ArrayList<ReviewVo> list = fac_admin_Mapper.selectReviewList(fm_id);
		map.put("list", list);
		return map;
	}

	@Override
	public Map<String, Object> selectInfo(String fm_id) {
		Map<String,Object> map = new HashMap<String,Object>();
		int reserNo = fac_admin_Mapper.selectReserCount(fm_id);
		System.out.println("값");
		System.out.println(reserNo);
		int finfoNo = fac_admin_Mapper.selectFinfoNo(fm_id);
		int reviewNo = fac_admin_Mapper.selectReviewNo(fm_id);
		int payNo = fac_admin_Mapper.selectPayNo(fm_id);
		int refundNo = fac_admin_Mapper.selectRefundNo(fm_id);
		map.put("reserNo", reserNo);
		map.put("finfoNo", finfoNo);
		map.put("reviewNo", reviewNo);
		map.put("payNo", payNo);
		map.put("refundNo", refundNo);
		return map;
	}

	//시설 관리자 정산 페이지
	@Override
	public Map<String, Object> selectPayInfo(String fm_id) {
		Map<String,Object> map = new HashMap<String,Object>();
		ArrayList<PaymentVo> list = fac_admin_Mapper.selectPayInfo(fm_id);
		
		
		int dateresult1 =  fac_admin_Mapper.reservationcount1(fm_id);
		int dateresult2 =  fac_admin_Mapper.reservationcount2(fm_id);
		int dateresult3 =  fac_admin_Mapper.reservationcount3(fm_id);
		int dateresult4 =  fac_admin_Mapper.reservationcount4(fm_id);
		int dateresult5 =  fac_admin_Mapper.reservationcount5(fm_id);
		int dateresult6 =  fac_admin_Mapper.reservationcount6(fm_id);
		
		
		
		  for(int i=0; i<list.size(); i++) {
		  if(list.get(i).getPay_status().equals("1")) {
		  list.get(i).setRefund_date(fac_admin_Mapper.getRefundDate(list.get(i).
		  getReser_no())); } }
		 
		int totalPrice = fac_admin_Mapper.selectTotalPrice(fm_id);
		int totalRefund = fac_admin_Mapper.selectTotalRefund(fm_id);
		map.put("list", list);
		map.put("totalPrice", totalPrice);
		map.put("totalRefund", totalRefund);
		map.put("dateresult1", dateresult1);
		map.put("dateresult2", dateresult2);
		map.put("dateresult3", dateresult3);
		map.put("dateresult4", dateresult4);
		map.put("dateresult5", dateresult5);
		map.put("dateresult6", dateresult6);
		return map;
	}

	@Override
	public Map<String, Object> selectQBoardList(String fm_id, String member) {
		Map<String,Object> map = new HashMap<String, Object>();
		ArrayList<QBoardVo> list = fac_admin_Mapper.selectQBoardList(fm_id,member);
		map.put("list", list);
		return map;
	}

	

}
