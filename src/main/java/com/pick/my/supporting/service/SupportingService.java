package com.pick.my.supporting.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.pick.my.common.PaymentHistory;
import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;

public interface SupportingService {
	public List<Supporting> printAllSupporting();
	public List<Supporting> printAllPreSupporting();
	public List<Supporting> findKeywordPreSupporting(HashMap<String, String> searchMap);
	public List<Supporting> findKeywordSupporting(HashMap<String, String> searchMap);
	public Supporting preSupportingOne(int supNo);
	public Supporting supportingOne(int supNo);
	public int registerSupporting(Supporting supporting);
	public int modifySupporting(Supporting supporting);
	public int removeSupporting(int supNo);
	//////댓글/////
	public List<SupReply> printSupReply(int supNo);
	public int registerSupReply(SupReply supReply);
	public int modifyrSupReply(SupReply supReply);
	public int removeSupReply(SupReply supReply);
	public int registerSupReplyChild(SupReply supReply);
	public int modifyrSupReplyChild(SupReply supReply);
	public int removeSupReplyChild(SupReply supReply);
	public int reportSupReply(SupReplyReport reportSupReply);
	public int reportSupReplyCheck(int supReAllNo, int supNo);
	//////////////결제및참여관련////////
	/**
	 * 인원체크, 20명이상이면 카테고리변경(모집중 >> 진행중)
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public String checkPartiwon(int supNo, int supPartiwon);
	public int updateCategory(int supNo, int supCategory); 
	
	/**
	 * 참여내역테이블 추가
	 * @param supParticipation
	 * @return
	 */
	public int addParticipation(SupParticipation supParticipation); 
	/**
	 * user 참여 했는지 테이블 확인하기
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public String checkparticipation(int supNo, int supPartiwon); 
	/**
	 * 참여-1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int cancelParticipation(int supNo, int supPartiwon); 
	/**
	 * 참여인원+1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int addPartiwon(int supNo, int supPartiwon); 
	/**
	 * 참여인원-1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int cancelPartiwon(int supNo, int supPartiwon);
	public int addPaymentHistory(PaymentHistory paymentHistory);
	public int addSumMoney(int supNo, int sumMoney); 
	/**
	 * 서포팅 돈이 다 찼나 확인
	 * @param supNo
	 * @param sumMoney
	 * @param goalMoney
	 * @param EndDate
	 * @return
	 */
	public String checkGoalMoney(int supNo, int sumMoney, int goalMoney, int EndDate); 
	/**
	 * 등급변경 (2 성공 / 3 실패 /1 진행중)
	 * @param supNo
	 * @param supGrade
	 * @return
	 */
	public int updateCode(int supNo, int supGrade);
	/**
	 * DB에 파일 등록
	 * @param supFile
	 * @return
	 */
	public List<SupFile> printFileList(int supNo);
	public int insertFile(SupFile supFile); 
	public int updateFile(SupFile file); 
	public int deleteFile(int supNo);
}
