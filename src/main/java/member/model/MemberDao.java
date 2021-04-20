package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myMemberDao")
public class MemberDao {
	
	private static MemberDao instance = null;
	private String namespace = "member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insertMember(Member member) {
		int cnt = sqlSessionTemplate.insert(namespace+".InsertMember",member);
		return cnt;
	}

	public Member getData(String id) {
		Member member = sqlSessionTemplate.selectOne(namespace+".GetData",id);
		return member;
	}

	public List<Member> getDataList(Paging pageInfo, Map<String, String> map) {
		List<Member> lists = new ArrayList<Member>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetDataList",map,rowBounds);
		return lists;
	}

	public int updateData(Member member) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateMember",member);
		return cnt;
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}
	
	public Member findId(Member member) {
		Member findId = sqlSessionTemplate.selectOne(namespace+".FindId", member);
		return findId;
	}

	public Member findPw(Member member) {
		Member findPw = sqlSessionTemplate.selectOne(namespace+".FindPw", member);
		return findPw;
	}

	public int deleteData(String id) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteData", id);
		return cnt;
	}

	public List<Integer> yourStyle(String id) {
		RowBounds rowbounds = new RowBounds(0,3);
		List<Integer> styleNum = sqlSessionTemplate.selectList(namespace+".YourStyle", id, rowbounds);
		return styleNum;
	}
	
	public List<Integer> yourCat(String id) {
		List<Integer> catNum = sqlSessionTemplate.selectList(namespace+".YourCat", id);
		
		return catNum;
	}
	
	public boolean searchId(String userid) {
		boolean flag = false;
		System.out.println("sql start");
		String user =sqlSessionTemplate.selectOne(namespace+".SearchId",userid);
		System.out.println("sql complete");
		if(user!=null) {
			flag=true;
			System.out.println("flag true");
		}
		System.out.println("flag false");
		return flag;
		
	}
	
	public static MemberDao getInstance() throws Exception{
		if(instance ==null) {
			instance= new MemberDao();
		}
		System.out.println("instance:"+instance);
		return instance;
		
	}
}
