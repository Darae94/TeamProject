package cate.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myCateDao")
public class CateDao {
	
	String namespace = "cate.model.Cate";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void InsertCate(Cate cate) {
		sqlSessionTemplate.insert(namespace+".InsertCate",cate);
		
	}

	public List<Cate> SelectCate(Map<String,String> map,Paging pageInfo) {
		List<Cate> list = new ArrayList<Cate>();
		RowBounds row = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".SelectCate",map,row);
		return list;
	}

	public Cate DetailCate(int num) {
		Cate cate = null;
		cate = sqlSessionTemplate.selectOne(namespace+".DetailCate",num);
		return cate;
	}

	public void UpdateCate(Cate cate) {
		sqlSessionTemplate.update(namespace+".UpdateCate",cate);
		
	}

	public void DeleteCate(int num) {
		sqlSessionTemplate.delete(namespace+".DeleteCate",num);
		
	}

	public int getCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".getCount",map);
		return count;
	}
	
	public List<Cate> ListCate() {
		List<Cate> list = new ArrayList<Cate>();
		list = sqlSessionTemplate.selectList(namespace+".SelectCate");
		return list;
	}
	
	
	
	
}
