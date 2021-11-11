package com.pick.my.supporting.service.logic;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.common.PaymentHistory;
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
	public List<Supporting> printAllPreSupporting() {
		List<Supporting> pList = store.selectAllPreSupporting();
		return pList;
	}
	
	@Override
	public List<Supporting> printAllSupporting() {
		List<Supporting> sList= store.selectAllSupporting();
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Supporting supportingOne(int supNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerSupporting(Supporting supporting) {
		int result = store.insertSupporting(supporting);
		return result;
	}

	@Override
	public int modifySupporting(Supporting supporting) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeSupporting(int supNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFile(SupFile file) {
		int result = store.insertFile(file);
		return result;
	}
	
	@Override
	public int updateFile(SupFile file) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int deleteFile(int supNo, int fileNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SupReply> printSupReply(int supNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerSupReply(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyrSupReply(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeSupReply(int supReAllNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerSupReplyChild(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyrSupReplyChild(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeSupReplyChild(int supReAllNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reportSupReply(SupReplyReport reportSupReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reportSupReplyCheck(int supReAllNo, int supNo) {
		// TODO Auto-generated method stub
		return 0;
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
		// TODO Auto-generated method stub
		return 0;
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

}
