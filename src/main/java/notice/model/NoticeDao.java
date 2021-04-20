package notice.model;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("noticeDao")
public class NoticeDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "notice.mapper";
	
	public void insertNotice(Notice notice) {
		sqlSessionTemplate.insert(namespace+".InsertNotice", notice);
	}

	public int getTotalCount() {
		int count = sqlSessionTemplate.selectOne(namespace+".GetToTalCount");
		return count;
	}

	public List<Notice> getNoticeList(Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<Notice> lists = sqlSessionTemplate.selectList(namespace+".GetNoticeList", null, rowBounds);
		return lists;
	}
	
	public List<Notice> getImpNotice() {
		List<Notice> lists = sqlSessionTemplate.selectList(namespace+".GetImpNotice");
		return lists;
	}

	public Notice getNoticeByNo(int no) {
		Notice notice = sqlSessionTemplate.selectOne(namespace+".GetNoticeByNo", no);
		return notice;
	}

	public void updateViewCnt(int no) {
		sqlSessionTemplate.update(namespace+".UpdateViewCnt", no);
	}

	public void deleteNotice(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteNotice", no);
	}

	public void updateNotice(Notice notice) {
		sqlSessionTemplate.update(namespace+".UpdateNotice", notice);
	}


}