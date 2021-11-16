package com.pick.my.goods.service;

import java.util.List;

import com.pick.my.common.PageInfo;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.GoodsFile;
import com.pick.my.goods.domain.GoodsPayment;
import com.pick.my.goods.domain.Review;
import com.pick.my.goods.domain.Search;

public interface GoodsService {

	public int getListCount();
	
	public List<Goods> printAll(PageInfo pi);
	
	public int insertSubFile(GoodsFile File);
	
	public int registerGoods(Goods goods);
	
	public Goods printOne(int goodsNo);
	
	public int removeGoods(int goodsNo);
	
	public int updateGoods(Goods goods);
	
	public List<Goods> printSearchAll(Search search);
	
	public int registerReview(Review review);
	
	public List<Review> showReviewList(int goodsNo);
	
	public int removeReview(int revNo);
	
	public int modifyReview(Review review);
	
	public int insertReply(Review review);
	
	public List<Review> showReplyList(int goodsNo);
	
	public int removeReply(int revNo);
	
	public int modifyReply(Review review);
	
	public List<GoodsFile> showFileList(int goodsNo);
	
	public int updateFileList(GoodsFile subImg);
	
	public int registerPayInfo(GoodsPayment pay);
	
}