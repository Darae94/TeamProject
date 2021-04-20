package qna.model;
 
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("qnaDao")
public class QnaDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "qna.mapper";

	public void insertQna(Qna qna) {
		sqlSessionTemplate.insert(namespace+".InsertQna", qna);
	}

	public int getTotalCount() {
		int count = sqlSessionTemplate.selectOne(namespace+".GetTotalCount");
		return count;
	}

	public List<Qna> getQnaList(Paging pageInfo, String category) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<Qna> lists = sqlSessionTemplate.selectList(namespace+".GetQnaList", category, rowbounds);
		return lists;
	}

	public void deleteQna(int no) {
		sqlSessionTemplate.delete(namespace+".DeleteQna", no);
	}

	public Qna getQnaByNo(int no) {
		Qna qna = sqlSessionTemplate.selectOne(namespace+".GetQnaByNo", no);
		return qna;
	}

	public void updateQna(Qna qna) {
		sqlSessionTemplate.update(namespace+".UpdateQna", qna);
	}

}