package com.example.teamproject.Service;

import java.util.ArrayList;
import java.util.Map;

import com.example.teamproject.Vo.EventBoardImgVo;
import com.example.teamproject.Vo.EventBoardVo;



public interface EventBoardService {

	Map<String, Object> selectEventBoardList(String searchCategory, String sportsCategory, String searchWord, int page);

	void eventBoardInsert(EventBoardVo eventBoardVo, ArrayList<EventBoardImgVo> imgList);

	Map<String, Object> selectEventView(int eb_num);

	void eventBoardDelete(int eb_num);

	Map<String, Object> selectEventBoardModifyView(int eb_num);

	void eventBoardModify(EventBoardVo eventBoardVo, ArrayList<EventBoardImgVo> imgList);

}
