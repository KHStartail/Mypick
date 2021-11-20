package com.pick.my.supporting.service.logic;

import java.util.HashMap;
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
	public List<Supporting> findKeywordPreSupporting(HashMap<String, String> searchMap){
		List<Supporting> psList = store.selectSearchPreSupporting(searchMap);
		return psList;
	}
	//진행중검색
	@Override
	public List<Supporting> findKeywordSupporting(HashMap<String, String> searchMap){
		List<Supporting> ssList = store.selectSearchSupporting(searchMap);
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

	@Override
	public String checkPartiwon(int supNo, int supPartiwon) {
		//20명 이상이어야 이동
		return null;
	}

	@Override
	public int updateCategory(int supNo, int supCategory) {
		 //모집중에서 진행중으로 이동
		return 0;
	}

	@Override
	public int addParticipation(SupParticipation supParticipation) {
		 // 참여+1
		return 0;
	}

	@Override
	public String checkparticipation(int supNo, int supPartiwon) {
		//user가 참여했는지 확인, 참여내역 테이블 추가
		return null;
	}

	@Override
	public int cancelParticipation(int supNo, int supPartiwon) {
		//참여 -1
		return 0;
	}

	@Override
	public int addPartiwon(int supNo, int supPartiwon) {
		//참여인원+1
		return 0;
	}

	@Override
	public int cancelPartiwon(int supNo, int supPartiwon) {
		//참여인원-1
		return 0;
	}

	@Override
	public int addPaymentHistory(PaymentHistory paymentHistory) {
		int result  = store.insertPaymentHistory(paymentHistory);
		return result;
	}

	@Override
	public int addSumMoney(int supNo, int sumMoney) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String checkGoalMoney(int supNo, int sumMoney, int goalMoney, int EndDate) {
		// TODO Auto-generated method stub
		return null;
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
//
//	@Override
///	public int printWriter(SupReply supReply) {
//		int result = store.selectReplyWriter(supReply);
//		return result;
//	}
}
