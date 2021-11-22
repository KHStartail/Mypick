package com.pick.my.goods.service.logic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.common.PageInfo;
import com.pick.my.goods.domain.Cart;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.GoodsFile;
import com.pick.my.goods.domain.GoodsPageInfo;
import com.pick.my.goods.domain.GoodsPayment;
import com.pick.my.goods.domain.Review;
import com.pick.my.goods.domain.Search;
import com.pick.my.goods.service.GoodsService;
import com.pick.my.goods.store.GoodsStore;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsStore store;
	
	@Override
	public int getListCount() {
		int totalCount = store.selectListCount();
		
		return totalCount;
	}

	@Override
	public List<Goods> printAll(GoodsPageInfo pi) {
		List<Goods> gList = store.selectAll(pi);
		
		return gList;
	}

	@Override
	public int registerGoods(Goods goods) {
		int result = store.insertGoods(goods);
		
		return result;
	}

	@Override
	public Goods printOne(int goodsNo) {
		Goods goods = store.printOne(goodsNo);
		
		return goods;
	}

	@Override
	public int removeGoods(int goodsNo) {
		int result = store.deleteGoods(goodsNo);
		
		return result;
	}

	@Override
	public int updateGoods(Goods goods) {
		int result = store.modifyGoods(goods);
		
		return result;
	}

	@Override
	public List<Goods> printSearchAll(Search search) {
		List<Goods> searchList = store.selectSearchAll(search);
		
		return searchList;
	}

	@Override
	public int registerReview(Review review) {
		int result = store.insertReview(review);
		
		return result;
	}

	@Override
	public List<Review> showReviewList(int goodsNo) {
		List<Review> rList = store.selectReview(goodsNo);
		
		return rList;
	}

	@Override
	public int removeReview(int revNo) {
		int result = store.deleteReview(revNo);
		
		return result;
	}

	@Override
	public int modifyReview(Review review) {
		int result = store.updateReview(review);
		
		return result;
	}

	@Override
	public int insertReply(Review review) {
		int result = store.registerReply(review);
		
		return result;
	}

	@Override
	public List<Review> showReplyList(int goodsNo) {
		List<Review> reList = store.selectReply(goodsNo);
		
		return reList;
	}

	@Override
	public int removeReply(int revNo) {
		int result = store.deleteReply(revNo);
		
		return result;
	}

	@Override
	public int modifyReply(Review review) {
		int result = store.updateReply(review);
		
		return result;
	}

	@Override
	public int insertSubFile(GoodsFile File) {
		int result = store.insertSubFile(File);
		
		return result;
	}

	@Override
	public List<GoodsFile> showFileList(int goodsNo) {
		List<GoodsFile> fList = store.showFileList(goodsNo);
		
		return fList;
	}

	@Override
	public int updateFileList(GoodsFile subImg) {
		int fileResult = store.updateFileList(subImg);
		
		return fileResult;
	}

	@Override
	public int registerPayInfo(GoodsPayment pay) {
		int result = store.insertPayInfo(pay);
		
		return result;
	}

	@Override
	public int insertCart(Cart cart) {
		int result = store.insertCart(cart);
		
		return result;
	}

	@Override
	public List<Goods> printSlideGoods(String groupName) {
		List<Goods> gList = store.selectSlideGoods(groupName);
		
		return gList;
	}

	@Override
	public int getMypageGoodsCount(String userId) {
		int totalCount = store.selectMypageGoodsCount(userId);
		
		return totalCount;
	}

	@Override
	public List<GoodsPayment> printGoodsHistory(Map<String, Object> map) {
		List<GoodsPayment> pList = store.selectGoodsHistory(map);
		
		return pList;
	}

	@Override
	public List<Cart> printCartList(String userId) {
		List<Cart> cList = store.selectCartList(userId);
		
		return cList;
	}

	@Override
	public int getListCount(Search search) {
		int totalCount = store.getListCount(search);
		
		return totalCount;
	}

	@Override
	public int deleteCart(String cartNo) {
		int result = store.deleteCart(cartNo);
		
		return result;
	}

	@Override
	public List<Cart> printCartPayment(String cartNo) {
		List<Cart> cList = store.selectCartPayment(cartNo);
		
		return cList;
	}

	@Override
	public int registerCartPayInfo(GoodsPayment pay) {
		int result = store.insertCartPayInfo(pay);
		
		return result;
	}

	@Override
	public int deleteSuccessCart(int cartNo) {
		int result = store.deleteSuccessCart(cartNo);
		
		return result;
	}



}
