package inquiry.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("inqDao")
public class InquiryDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "inquiry.mapper";

	public void insertInquiry(Inquiry inq) {
		sqlSessionTemplate.insert(namespace+".InsertInquiry", inq);
	}

	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".TotalCount", map);
		return count;
	}

	public List<Inquiry> getInquiryList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<Inquiry> lists = sqlSessionTemplate.selectList(namespace+".GetInquiryList", map, rowbounds);
		return lists;
	}

	public Inquiry getInqByNum(int num) {
		Inquiry inq = sqlSessionTemplate.selectOne(namespace+".GetInqByNum", num);
		return inq;
	}

	public void updateViewCnt(int num) {
		sqlSessionTemplate.update(namespace+".UpdateViewCnt", num);
	}

	public void deleteInq(int num) {
		sqlSessionTemplate.delete(namespace+".DeleteInq", num);
	}

	public int getRefCount(int ref) {
		int count = sqlSessionTemplate.selectOne(namespace+".GetRefCount", ref);
		return count;
	}

	public void updateInq(Inquiry inq) {
		sqlSessionTemplate.update(namespace+".UpdateInq", inq);
	}

	public void insertReply(Inquiry inq) {
		sqlSessionTemplate.update(namespace+".UpdateRestep", inq);
		inq.setRestep(inq.getRestep()+1);
		sqlSessionTemplate.insert(namespace+".InsertReply", inq);
	}

}
