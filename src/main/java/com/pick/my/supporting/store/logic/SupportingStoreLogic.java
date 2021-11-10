package com.pick.my.supporting.store.logic;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.my.common.PaymentHistory;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;
import com.pick.my.supporting.store.SupportingStore;

@Repository
public class SupportingStoreLogic implements SupportingStore{

	@Override
	public List<Supporting> selectAllSupporting(int supCategory) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Supporting> selectAllPreSupporting(int supCategory) {
		// TODO Auto-generated method stub
		return null;
	}

//	public List<Supporting> findKeywordPreSupporting(HashMap<string groupName, string keyword>);
//	public List<Supporting> findKeywordSupporting(HashMap<string groupName, string keyword>);
	
	@Override
	public Supporting selectPreSupportingOne(int supNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Supporting selectSupportingOne(int supNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertSupporting(Supporting supporting) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSupporting(Supporting supporting) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSupporting(int supNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SupReply> selectSupReply(int supNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertSupReply(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updaterSupReply(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSupReply(int supReAllNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSupReplyChild(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSupReplyChild(SupReply supReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSupReplyChild(int supReAllNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSupReply(SupReplyReport reportSupReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectReportSupReply(int supReAllNo, int supNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectPartiwon(int supNo, int supPartiwon) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCategory(int supNo, int supCategory) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertParticipation(SupParticipation supParticipation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectparticipation(int supNo, int supPartiwon) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteParticipation(int supNo, int supPartiwon) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePartiwonAdd(int supNo, int supPartiwon) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePartiwonDel(int supNo, int supPartiwon) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPaymentHistory(PaymentHistory paymentHistory) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSumMoney(int supNo, int sumMoney) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String selectGoalMoney(int supNo, int sumMoney, int goalMoney, int EndDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCode(int supNo, int supGrade) {
		// TODO Auto-generated method stub
		return 0;
	}
}
