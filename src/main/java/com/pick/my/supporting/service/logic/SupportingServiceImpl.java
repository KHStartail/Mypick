package com.pick.my.supporting.service.logic;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.common.PageInfo;
import com.pick.my.common.PaymentHistory;
import com.pick.my.member.domain.Member;
import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;
import com.pick.my.supporting.service.SupportingService;
import com.pick.my.supporting.store.SupportingStore;

@Service
public class SupportingServiceImpl implements SupportingService{
	@Autowired
	private SupportingStore store;

	@Override
	public int getPreSupListCount() {
		int totalCount = store.selectPreSupListCount();
		return totalCount;
	}
	
	@Override
	public int getSupListCount() {
		int totalCount = store.selectSupListCount();
		return totalCount;
	}
	@Override
	public List<Supporting> printAllPreSupporting(PageInfo pi) {
		List<Supporting> pList = store.selectAllPreSupporting(pi);
		return pList;
	}
	
	@Override
	public List<Supporting> printAllSupporting(PageInfo pi) {
		List<Supporting> sList= store.selectAllSupporting(pi);
		return sList;
	}	
	//모집중검색
	@Override
	public List<Supporting> findKeywordPreSupporting(String keyword){
		List<Supporting> psList = store.selectSearchPreSupporting(keyword);
		return psList;
	}
	//진행중검색
	@Override
	public List<Supporting> findKeywordSupporting(String keyword){
		List<Supporting> ssList = store.selectSearchSupporting(keyword);
		return ssList;
	}

	@Override
	public Supporting preSupportingOne(int supNo) {
		Supporting supporting = store.selectPreSupportingOne(supNo);
		return supporting;
	}

	@Override
	public Supporting supportingOne(int supNo) {
		Supporting supporting = store.selectSupportingOne(supNo);
		return supporting;
	}

	@Override
	public int registerSupporting(Supporting supporting) {
		int result = store.insertSupporting(supporting);
		return result;
	}

	@Override
	public List<SupFile> printFileList(int supNo) {
		List<SupFile> fList= store.selectFileList(supNo);
		return fList;
	}
	@Override
	public int insertFile(SupFile file) {
		int result = store.insertFile(file);
		return result;
	}

	@Override
	public int modifySupporting(Supporting supporting) {
		int result = store.updateSupporting(supporting);
		return result;
	}

	@Override
	public int updateFile(SupFile file) {
		int result = store.updateFile(file);
		return result;
	}

	@Override
	public int removeSupporting(int supNo) {
		int result = store.deleteSupporting(supNo);
		return result;
	}
	
	@Override
	public int deleteFile(int supNo) {
		int result = store.deleteFile(supNo);
		return result;
	}

	@Override
	public List<SupReply> printSupReply(int supNo) {
		List<SupReply> rList = store.selectSupReply(supNo);
		return rList;
	}

	@Override
	public int registerSupReply(SupReply supReply) {
		int result = store.insertSupReply(supReply);
		return result;
	}

	@Override
	public int modifyrSupReply(SupReply supReply) {
		int result = store.updateSupReply(supReply);
		return result;
	}

	@Override
	public int removeSupReply(SupReply supReply) {
		int result = store.deleteSupReply(supReply);
		return result;
	}

	@Override
	public int registerSupReplyChild(SupReply supReply) {
		int result = store.insertSupReplyChild(supReply);
		return result;
	}

	@Override
	public int modifyrSupReplyChild(SupReply supReply) {
		int result = store.updateSupReplyChild(supReply);
		return result;
	}

	@Override
	public int removeSupReplyChild(SupReply supReply) {
		int result = store.deleteSupReplyChild(supReply);
		return result;
	}

	@Override
	public int reportSupReply(SupReplyReport reportSupReply) {
		int result = store.insertsReplyReport(reportSupReply);
		return result;
	}

	@Override
	public int reportSupReplyCheck(int reportNo) {
		int result = store.selectReportSupReply(reportNo);
		return result;
	}

	
	public int addParticipation(SupParticipation supParticipation) {
		int result = store.insertParticipation(supParticipation);
		return result;
	}
	@Override
	public SupParticipation checkParticipation(SupParticipation sp) {
		SupParticipation supParticipation= store.selectParticipation(sp);
		return supParticipation;
	}
	@Override
	public int cancelParticipation(SupParticipation sp) {
		//x테이블 해당 유저 참여-1
		int result = store.deleteParticipation(sp);
		return result;
	}

	@Override
	public int addPartiwon(int supNo) {
		//참여인원+1
		int result = store.updatePartiwonAdd(supNo);
		result += store.updateCategory(supNo);
		return result;
	}

	@Override
	public int deletePartiwon(int supNo){
		//참여인원-1
		int result = store.updatePartiwonDel(supNo);
		return result;
	}

	@Override
	public int addPaymentHistory(PaymentHistory paymentHistory) {
		int result  = store.insertPaymentHistory(paymentHistory);
		return result;
	}

	@Override
	public int addSumMoney(Supporting supporting) {
		int result = store.updateSumMoney(supporting);
		return result;
	}

	@Override
	public int updateCode(int supNo, int supGrade) {
		//성공.실패.진행중변경
		return 0;
	}

	@Override
	public Member printOneUser(int userNo) {
		Member mOne = store.selectUserOne(userNo);
		return mOne;
	}

	@Override
	public PaymentHistory printMyPayHistory(String userNickName) {
		PaymentHistory result = store.selectPayHistory(userNickName);
		return result;
	}

	@Override
	public Supporting printMySupporting(int userNo) {
		Supporting supporting = store.selectPostSupporting(userNo);
		return supporting;
	}
}
