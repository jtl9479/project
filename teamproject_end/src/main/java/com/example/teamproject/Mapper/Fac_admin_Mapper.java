package com.example.teamproject.Mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.teamproject.Vo.Fac_admin_Vo;
import com.example.teamproject.Vo.FmanagerVo;
import com.example.teamproject.Vo.PaymentVo;
import com.example.teamproject.Vo.QBoardVo;
import com.example.teamproject.Vo.ReservationVo;
import com.example.teamproject.Vo.ReviewVo;



@Mapper
public interface Fac_admin_Mapper {

	//insertList
	int insertFile(Fac_admin_Vo fac_admin_Vo);

	//AllList
	List<Fac_admin_Vo> selectAllList(String fm_id);

	//selectOneList
	Fac_admin_Vo selectOneList(int finfo_no);

	//modify
	int updateOneList(Fac_admin_Vo fac_admin_Vo);

	//delete
	void deleteOneList(int finfo_no);

	//select Reserve List
	List<ReservationVo> selectReserveList(String fm_id);

	FmanagerVo fmanagerMypage(String fm_id);

	int fm_Modify(FmanagerVo fVo);

	ArrayList<ReviewVo> selectReviewList(String fm_id);

	int selectReserCount(String fm_id);

	int selectFinfoNo(String fm_id);

	int selectReviewNo(String fm_id);

	int selectPayNo(String fm_id);

	int selectRefundNo(String fm_id);

	ArrayList<PaymentVo> selectPayInfo(String fm_id);

	String getRefundDate(int reser_no);

	int selectTotalPrice(String fm_id);

	int selectTotalRefund(String fm_id);

	ArrayList<QBoardVo> selectQBoardList(String fm_id, String member);

	//finfo_num 찾기
	String checkfinfo_no(String fm_id);

	//예약 날짜 카운트
	int reservationcount1(String finfo_no);
	int reservationcount2(String finfo_no);
	int reservationcount3(String finfo_no);
	int reservationcount4(String finfo_no);
	int reservationcount5(String finfo_no);
	int reservationcount6(String finfo_no);


}
