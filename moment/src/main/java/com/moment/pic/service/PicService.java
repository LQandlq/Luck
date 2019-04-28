package com.moment.pic.service;


import java.util.List;
import java.util.Map;

import com.moment.datatables.domain.DataTablesRequest;
import com.moment.datatables.domain.DataTablesResponse;
import com.moment.pic.domain.CollectVO;
import com.moment.pic.domain.GenreVO;
import com.moment.pic.domain.PicEX;
import com.moment.pic.domain.PicVO;
import com.moment.pic.domain.picuserlike;
import com.moment.user.domain.UserVO;
import com.qiniu.http.Response;

public interface PicService {
	public int addPic(PicVO pic,UserVO user) throws Throwable;
	
	public int deletePic(Integer id) throws Throwable;
	
	public PicEX getPicById(Integer id) throws Throwable;
	
	public int updatePicVO(PicVO pic) throws Throwable;
	public DataTablesResponse<PicVO> list(DataTablesRequest request) throws Throwable;
	public  Response doUpload(byte[] b,PicVO pic) throws Throwable ;
	public int deletePicFromQiniu(Integer id) throws Throwable;
	public int getPicnumByDate(Integer id) throws Throwable ;
	public void updateUserGrade(UserVO user) throws Throwable ;
	public List<PicEX> getPicList(String style) throws Throwable ;
	public List<PicVO> getUserPicList(Integer id) throws Throwable ;
	public List<PicEX> getPicListByCondition(String key,int limit,int offset) throws Throwable ;
	public List<GenreVO> selectgenre() throws Throwable;
    public List<PicEX> selectmypic(Integer id) throws Throwable;
    public int insertlikepic(PicVO record) throws Throwable;
    public  int deletelikepic(PicVO record) throws Throwable;
    public List<PicEX> selectlist(int id) throws Throwable;
    
    public int insertcollectpic(PicVO record) throws Throwable;
    public  CollectVO selectcollectpicuser(CollectVO c) throws Throwable;
    public  int deletecollectpic(PicVO record) throws Throwable;
    public   List<PicEX> selectcollectpic(int id) throws Throwable;
    public  List<PicEX> selecttypelist(PicVO example) throws Throwable;
    public List<PicEX> selecthotpic(PicVO c)  throws Throwable;
    public picuserlike selectlikepic(picuserlike p) throws Throwable;
    //周榜查询
    public  List<PicEX> select_top(PicVO c) throws Throwable;
    //用户关注列表查询
   public List<PicEX> userfollow(int id) throws Throwable;
   
   //用户的其他4幅作品
   public  List<PicEX> selectother4(PicVO c) throws Throwable;
   
   public int deletegenre(int id) throws Throwable;
   
   public int insertgenre(String name) throws Throwable;
   
 //删除作品的所有举报信息
   public int deletepicreport(int id);
   //删除作品的所有评论
   public int deletepiccomment(int id);

	List<PicEX> selectPicFromoUser(Map map);
	
}
