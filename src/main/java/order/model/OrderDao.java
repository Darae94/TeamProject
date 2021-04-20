package order.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myOrderDao")
public class OrderDao {

	private String namespace = "order.model.Order.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Order> getAllData(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<Order> list = sqlSessionTemplate.selectList(namespace+"GetAllData", map, rowBounds);
		return list;
	}

	public void insertData(String mid) {
		sqlSessionTemplate.insert(namespace+"InsertData", mid);
	}

	public int getMaxOrderOnum() {
		int cnt = sqlSessionTemplate.selectOne(namespace+"GetMaxOrderOnum");
		return cnt;
	}

	public int totalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+"TotalCount", map);
		return cnt;
	}
	
}
