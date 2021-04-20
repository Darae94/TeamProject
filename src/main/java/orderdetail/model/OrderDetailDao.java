package orderdetail.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import order.model.ShoppingInfo;

@Component("myOrderDetailDao")
public class OrderDetailDao {

	private String namespace = "orderdetail.model.OrderDetail.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getOqtySum(OrderDetail od) {
		//System.out.println("check: "+od.getPnum()+"/"+od.getOday()+"/"+od.getOtime());
		int cnt = sqlSessionTemplate.selectOne(namespace+"GetCount", od);
		int total = 0;
		if(cnt > 0) {
			total = sqlSessionTemplate.selectOne(namespace+"GetOqtySum", od);
		}
		return total;
	}
	
	public void insertData(OrderDetail odetail) {
		sqlSessionTemplate.insert(namespace+"InsertData", odetail);
	}
	
	public List<ShoppingInfo> getData(String onum) {
		List<ShoppingInfo> list = sqlSessionTemplate.selectList(namespace+"GetData", onum);
		return list;
	}

}
