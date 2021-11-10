package com.pick.my.supporting.store;

import java.util.List;

import com.pick.my.common.PaymentHistory;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;

public interface SupportingStore {
	public List<Supporting> selectAllSupporting(int supCategory);
	public List<Supporting> selectAllPreSupporting(int supCategory);
//	public List<Supporting> findKeywordPreSupporting(HashMap<string groupName, string keyword>);
//	public List<Supporting> findKeywordSupporting(HashMap<string groupName, string keyword>);
	public Supporting selectPreSupportingOne(int supNo);
	public Supporting selectSupportingOne(int supNo);
	public int insertSupporting(Supporting supporting);
	public int updateSupporting(Supporting supporting);
	public int deleteSupporting(int supNo);
	///////댓글 관련
	public List<SupReply> selectSupReply(int supNo);
	public int insertSupReply(SupReply supReply);
	public int updaterSupReply(SupReply supReply);
	public int deleteSupReply(int supReAllNo);
	public int insertSupReplyChild(SupReply supReply);
	public int updateSupReplyChild(SupReply supReply);
	public int deleteSupReplyChild(int supReAllNo);
	public int insertSupReply(SupReplyReport reportSupReply);
	public int selectReportSupReply(int supReAllNo, int supNo);
	////////////////////////참여, 결제관련내용////////////////
	/**
	 * 인원체크, 20명이상이면 카테고리변경(모집중 >> 진행중)
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public String selectPartiwon(int supNo, int supPartiwon);
	public int updateCategory(int supNo, int supCategory); 
	
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
	public String selectparticipation(int supNo, int supPartiwon); 
	/**
	 * 참여-1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int deleteParticipation(int supNo, int supPartiwon); 
	/**
	 * 참여인원+1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int updatePartiwonAdd(int supNo, int supPartiwon); 
	/**
	 * 참여인원-1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int updatePartiwonDel(int supNo, int supPartiwon);
	public int insertPaymentHistory(PaymentHistory paymentHistory);
	public int updateSumMoney(int supNo, int sumMoney); 
	/**
	 * 서포팅 돈이 다 찼나 확인
	 * @param supNo
	 * @param sumMoney
	 * @param goalMoney
	 * @param EndDate
	 * @return
	 */
	public String selectGoalMoney(int supNo, int sumMoney, int goalMoney, int EndDate); 
	/**
	 * 등급변경 (2 성공 / 3 실패 /1 진행중)
	 * @param supNo
	 * @param supGrade
	 * @return
	 */
	public int updateCode(int supNo, int supGrade); 
}
