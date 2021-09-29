package com.example.teamproject.Mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.teamproject.Vo.EventBoardImgVo;
import com.example.teamproject.Vo.EventBoardVo;



@Mapper
public interface EventBoardMapper {

	int selectEventBoardCount(String searchCategory, String sportsCategory, String searchWord);

	ArrayList<EventBoardVo> selectEventBoardList(String searchCategory, String sportsCategory, String searchWord,
			int startRow, int endRow);

	void eventBoardInsert(EventBoardVo eventBoardVo);

	void eventBoardImgInsert(int eb_num, String fileName);

	void updateEventBoardHit(int eb_num);

	EventBoardVo selectEventBoardView(int eb_num);

	ArrayList<EventBoardImgVo> selectEventBoardImg(int eb_num);

	EventBoardVo selectNextView(int eb_num);

	EventBoardVo selectPreView(int eb_num);

	void eventBoardDelete(int eb_num);

	void eventBoardDeleteImg(int eb_num);

	void eventBoardModify(EventBoardVo eventBoardVo);

	void eventBoardImgModify(String fileName, int img_no);

}
