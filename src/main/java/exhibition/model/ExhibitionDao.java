package exhibition.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myExhibitionDao")
public class ExhibitionDao {
	
	String namespace = "exhibition.model.Exhibition";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int InsertExhibit(Exhibition exhibition) {
		int count = sqlSessionTemplate.insert(namespace+".InsertExhibit",exhibition);
		return count;
	}

	public List<Exhibition> SelectExhibition(Map<String,String> map,Paging pageInfo) {
		List<Exhibition> list = new ArrayList<Exhibition>();
		RowBounds row = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		list = sqlSessionTemplate.selectList(namespace+".SelectExhibition",map,row);
		return list;
	}
	
	public Exhibition DetailExhibition(int num) {
		Exhibition exhibition = null;
		exhibition = sqlSessionTemplate.selectOne(namespace+".DetailExhibition",num);
		return exhibition;
	}

	public int UpdateExhibition(Exhibition exhibition) {
		int count = sqlSessionTemplate.update(namespace+".UpdateExhibition",exhibition);
		return count;
	}

	public int totalCount(Map<String, String> map) {
		int count = sqlSessionTemplate.selectOne(namespace+".totalCount",map);
		return count;
	}

	public void DeleteExhibition(int num) {
		sqlSessionTemplate.delete(namespace+".DeleteExhibition",num);
		
	}

	public List<Exhibition> ListExhibition() {
		List<Exhibition> list = new ArrayList<Exhibition>();
		list = sqlSessionTemplate.selectList(namespace+".ListExhibition");
		return list;
	}

	public List<Exhibition> SearchCategory(String category) {
		List<Exhibition> slist = new ArrayList<Exhibition>();
		slist = sqlSessionTemplate.selectList(namespace+".SearchCategory",category);
		return slist;
	}

	public List<Exhibition> SelectMonth(String result) {
		List<Exhibition> mlist = new ArrayList<Exhibition>();
		mlist = sqlSessionTemplate.selectList(namespace+".SelectMonth",result);
		return mlist;
	}

	public List<Exhibition> ListMonth(String day) {
		List<Exhibition> listm = new ArrayList<Exhibition>();
		listm = sqlSessionTemplate.selectList(namespace+".ListMonth",day);
		return listm;
	}


	


	
	
	
	
}
