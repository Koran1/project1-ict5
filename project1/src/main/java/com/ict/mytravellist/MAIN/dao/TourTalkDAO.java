package com.ict.mytravellist.MAIN.dao;


import java.util.List;


import com.ict.mytravellist.vo.TourTalkVO;


public interface TourTalkDAO{
	
	// 리스트
    public List<TourTalkVO> getTourTalkList();
    
    // 삽입(쓰기)
    public int getTourTalkInsert(TourTalkVO tourtvo);
    
    // 상세보기
    public TourTalkVO getTourTalkDetail(String userIdx);
    
	/*
	 * // 원글 삭제 public int getTourTalkDelete(String b_idx);
	 * 
	 * // 원글 수정 public int getTourTalkUpdate(TourTalkVO tourtvo);
	 */
    
    // 조회수 업데이트
    public int getHitUpdate(String userIdx);
	/*
	 * // 페이징 처리 - 전체 게시물의 수 public int getTotalCount();
	 * 
	 * // 페이징 처리을 위한 리스트 public List<TourTalkVO> getTourTalkList(int offset, int limit);
	 * 
	 * // 댓글 가져오기 public List<CommVO> getCommentList(String b_idx); // 댓글 삽입 public
	 * int getCommentInsert(CommVO cvo); // 댓글 삭제 public int getCommentDelete(String
	 * c_idx);
	 */  
}
