package com.pick.my.supporting.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.pick.my.common.PageInfo;
import com.pick.my.common.PaymentHistory;
import com.pick.my.member.domain.Member;
import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;
public interface SupportingService {
	public int getPreSupListCount();
	public int getSupListCount();
	public List<Supporting> printAllSupporting(PageInfo pi);
	public List<Supporting> printAllPreSupporting(PageInfo pi);
	public List<Supporting> findKeywordPreSupporting(String keyword);
	public List<Supporting> findKeywordSupporting(String keyword);
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
	public int reportSupReplyCheck(int reportNo);
	//////////////결제및참여관련////////
	
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
	/**
	 * 참여-1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int cancelParticipation(SupParticipation supParticipation); 
	/**
	 * 참여인원+1
	 * @param supNo
	 * @param supPartiwon
	 * @return
	 */
	public int addPartiwon(int supNo); 
	/**
	 * 참여인원-1
	 * @param supNo
	 * @return
	 */
	public int deletePartiwon(int supNo);
	
	/**
	 * 인원체크, 20명이상이면 카테고리변경(모집중 >> 진행중)
	 * @param supNo
	 * @return
	 */
	
	public int addPaymentHistory(PaymentHistory paymentHistory);
	/**
	 * 합산 올리기
	 * @param supporting
	 * @return
	 */
	public int addSumMoney(Supporting supporting); 
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
	public Member printOneUser(int userNo);
	/**
	 * 댓글 작성자 찾기
	 * @param supReply
	 * @return
	 */
//	public int printWriter(SupReply supReply);
	/**
	 *user 참여했는지 테이블에서 확인하기
	 * @param supNo
	 * @param userNo
	 * @return
	 */
	public SupParticipation checkParticipation(SupParticipation sp);
	public List<PaymentHistory> printMyPayHistory(String userNickName);
	public List<Supporting> printMySupporting(int userNo);
}
