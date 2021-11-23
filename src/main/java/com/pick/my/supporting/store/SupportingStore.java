package com.pick.my.supporting.store;

import java.util.List;

import com.pick.my.common.PageInfo;
import com.pick.my.common.PaymentHistory;
import com.pick.my.member.domain.Member;
import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;

public interface SupportingStore {
	public int selectPreSupListCount();
	public int selectSupListCount();
	public List<Supporting> selectAllSupporting(PageInfo pi);
	public List<Supporting> selectAllPreSupporting(PageInfo pi);
	public List<Supporting> selectSearchPreSupporting(String keyword);
	public List<Supporting> selectSearchSupporting(String keyword);
	public Supporting selectPreSupportingOne(int supNo);
	public Supporting selectSupportingOne(int supNo);
	public int insertSupporting(Supporting supporting);
	public int updateSupporting(Supporting supporting);
	public int deleteSupporting(int supNo);
	///////댓글 관련
	public List<SupReply> selectSupReply(int supNo);
	public int insertSupReply(SupReply supReply);
	public int updateSupReply(SupReply supReply);
	public int deleteSupReply(SupReply supReply); 
	public int insertSupReplyChild(SupReply supReply);
	public int updateSupReplyChild(SupReply supReply);
	public int deleteSupReplyChild(SupReply supReply);
	public int insertsReplyReport(SupReplyReport reportSupReply);
	public int selectReportSupReply(int reportNo);
	////////////////////////참여, 결제관련내용////////////////
	/**
	 * 서포팅 카테고리 변경
	 * @param supNo
	 * @return
	 */
	public int updateCategory(int supNo); 
	
	/**
	 * 참여내역테이블 추가
	 * @param supParticipation
	 * @return
	 */
	public int insertParticipation(SupParticipation supParticipation); 
	/**
	 * user 참여 했는지 테이블 확인하기
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public SupParticipation selectParticipation(SupParticipation sp); 
	/**
	 * 참여-1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int deleteParticipation(SupParticipation sp);
	/**
	 * 참여인원+1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int updatePartiwonAdd(int supNo);
	/**
	 * 참여인원-1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int updatePartiwonDel(int supNo);
	
	/**
	 * 결제내역에 추가하기
	 * @param paymentHistory
	 * @return
	 */
	public int insertPaymentHistory(PaymentHistory paymentHistory);
	/**
	 * 서포팅 돈 합산하기
	 * @param supporting
	 * @return
	 */
	public int updateSumMoney(Supporting supporting); 
	/**
	 * 등급변경 (2 성공 / 3 실패 /1 진행중)
	 * @param supNo
	 * @param supGrade
	 * @return
	 */
	public int updateCode(int supNo, int supGrade);
	
	/**
	 * 파일DB저장 밑에 4개
	 * @param file
	 * @return
	 */
	public List<SupFile> selectFileList(int supNo);
	public int insertFile(SupFile file); 
	public int updateFile(SupFile file); 
	public int deleteFile(int supNo);
	/**
	 * 유저정보가져오기
	 * @param userNo
	 * @return
	 */
	public Member selectUserOne(int userNo);
	/**
	 * 마이페이지 결제 출력
	 * @param userNickName
	 * @return
	 */
	public PaymentHistory selectPayHistory(String userNickName);
	/**
	 * 마이페이지 본인이 쓴 서포팅 게시물
	 * @param userNo
	 * @return
	 */
	public Supporting selectPostSupporting(int userNo);
}
