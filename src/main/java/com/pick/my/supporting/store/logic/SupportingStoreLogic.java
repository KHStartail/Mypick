package com.pick.my.supporting.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.my.common.PageInfo;
import com.pick.my.common.PaymentHistory;
import com.pick.my.member.domain.Member;
import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;
import com.pick.my.supporting.store.SupportingStore;

@Repository
public class SupportingStoreLogic implements SupportingStore{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectPreSupListCount() {
		int count = sqlSession.selectOne("SupportingMapper.selectPreSupListCount");
		return count;
	}

	@Override
	public int selectSupListCount() {
		int count = sqlSession.selectOne("SupportingMapper.selectSupListCount");
		return count;
	}
	@Override
	public List<Supporting> selectAllPreSupporting(PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds  = new RowBounds(offset, pi.getBoardLimit());
		List<Supporting> pList = sqlSession.selectList("SupportingMapper.selectAllPreSupporting");
		return pList;
	}
	@Override
	public List<Supporting> selectAllSupporting(PageInfo pi) {
		List<Supporting> sList = sqlSession.selectList("SupportingMapper.selectAllSupporting");
		return sList;
	}
	@Override
	public List<Supporting> selectSearchPreSupporting(HashMap<String, String> searchMap){
		List<Supporting> psList = sqlSession.selectList("SupportingMapper.searchPreSupporting", searchMap);
		return psList;	
	}
	@Override
	public List<Supporting> selectSearchSupporting(HashMap<String, String> searchMap){
		List<Supporting> ssList = sqlSession.selectList("SupportingMapper.searchSupporting", searchMap);
		return ssList;	
	}

	
	@Override
	public Supporting selectPreSupportingOne(int supNo) {
		Supporting supporting = sqlSession.selectOne("SupportingMapper.selectOneSupporting", supNo);
		return supporting;
	}

	
	@Override
	public Supporting selectSupportingOne(int supNo) {
		Supporting supporting  = sqlSession.selectOne("SupportingMapper.selectOnePreSupporting", supNo);
		return supporting;
	}

	
	@Override
	public List<SupFile> selectFileList(int supNo) {
		List<SupFile> fList = sqlSession.selectList("SupportingMapper.selectFileList", supNo);
		return fList;
	}
	
	@Override
	public int insertSupporting(Supporting supporting) {
		int result = sqlSession.insert("SupportingMapper.insertSupporting", supporting);
		return result;
	}

	
	@Override
	public int insertFile(SupFile file) {
		int result = sqlSession.insert("SupportingMapper.insertFile", file);
		return result;
	}

	@Override
	public int updateSupporting(Supporting supporting) {
		int result = sqlSession.update("SupportingMapper.updateSupporting", supporting);
		return result;
	}

	@Override
	public int updateFile(SupFile file) {
		int result = sqlSession.update("SupportingMapper.updateFile", file);
		return result;
	}

	@Override
	public int deleteSupporting(int supNo) {
		int result = sqlSession.delete("SupportingMapper.deleteSupporting", supNo);
		return result;
	}
	
	@Override
	public int deleteFile(int supNo) {
		int result = sqlSession.delete("SupportingMapper.deleteFile",supNo);
		return result;
	}
	@Override
	public List<SupReply> selectSupReply(int supNo) {
		List<SupReply> rList = sqlSession.selectList("SupportingMapper.replyAll", supNo);
		return rList;
	}

	@Override
	public int insertSupReply(SupReply supReply) {
		int result = sqlSession.insert("SupportingMapper.insertReply", supReply);
		return result;
	}

	@Override
	public int updateSupReply(SupReply supReply) {
		int result = sqlSession.update("SupportingMapper.updateReply", supReply);
		return result;
	}

	@Override
	public int deleteSupReply(SupReply supReply) {
		int result = sqlSession.delete("SupportingMapper.deleteReply", supReply);
		return result;
	}

	@Override
	public int insertSupReplyChild(SupReply supReply) {
		int result = sqlSession.insert("SupportingMapper.insertReplyChild", supReply);
		return result;
	}

	@Override
	public int updateSupReplyChild(SupReply supReply) {
		int result = sqlSession.update("SupportingMapper.updateReplyChild", supReply);
		return result;
	}

	@Override
	public int deleteSupReplyChild(SupReply supReply) {
		int result = sqlSession.delete("SupportingMapper.deleteReplyChild", supReply);
		return result;
	}

	@Override
	public int insertsReplyReport(SupReplyReport reportSupReply) {
		int result = sqlSession.delete("SupportingMapper.insertReportSupRe", reportSupReply);
		return result;
	}

	@Override
	public int selectReportSupReply(int reportNo) {
		 int result = sqlSession.selectOne("SupportingMapper.selectReportSupRe", reportNo);
		 return result;
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
		int result = sqlSession.insert("SupportingMapper.insertHistory", paymentHistory);
		return result;
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
	@Override
	public Member selectUserOne(int userNo) {
		Member mOne = sqlSession.selectOne("memberMapper.selectUserOne", userNo);
		return mOne;
	}

}
