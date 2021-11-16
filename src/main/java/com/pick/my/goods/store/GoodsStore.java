package com.pick.my.goods.store;

import java.util.List;

import com.pick.my.common.PageInfo;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.GoodsFile;
import com.pick.my.goods.domain.GoodsPayment;
import com.pick.my.goods.domain.Review;
import com.pick.my.goods.domain.Search;

public interface GoodsStore {

	public int selectListCount();
	public List<Goods> selectAll(PageInfo pi);
	public int insertGoods(Goods goods);
	public int insertSubFile(GoodsFile File);
	public Goods printOne(int goodsNo);
	public int deleteGoods(int goodsNo);
	public int modifyGoods(Goods goods);
	public List<Goods> selectSearchAll(Search search);
	public int insertReview(Review review);
	public List<Review> selectReview(int goodsNo);
	public int deleteReview(int revNo);
	public int updateReview(Review review);
	public int registerReply(Review review);
	public List<Review> selectReply(int goodsNo);
	public int deleteReply(int revNo);
	public int updateReply(Review review);
	public List<GoodsFile> showFileList(int goodsNo);
	public int updateFileList(GoodsFile subImg);
	public int insertPayInfo(GoodsPayment pay);
}
