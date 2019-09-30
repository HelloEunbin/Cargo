package cargo.market.DTO;

import cargo.market.DAO.MarketDAO;

public class Paging {
	
	MarketDAO mdao = new MarketDAO();

	// 현재페이지, 현재블럭 모두 0부터 !!
	
	public int nowPage; 			// 현재페이지
	private int nowGroup; // 현재 그룹
	
	public int recPerPage;		// 한 페이지당 보여질 글의 개수
	public int pagePerGroup;		// 페이지그룹당 묶여질 페이지 개수
	
	private int totalRecord ;		// 게시판에 저장된 전체 글의 개수 - DB에서 검색해서 가져와야 함.

	private int totalPage; // 전체페이지 수
	private int totalGroup; // 총 그룹
	
	// 현재 그룹 끝, 시작 번호
	private int lastPageNum;
	private int startPageNum;
	
	private int lastRecNum; // 현재페이지의 마지막 글 번호
	private int startRecNum; // 현재페이지의 첫 번째 글 번호
	
	boolean prevGroup;
	boolean nextGroup;
	
	
	public void setRecPerPage(int recPerPage) {
		this.recPerPage = recPerPage;
	}
	public void setPagePerGroup(int pagePerGroup) {
		this.pagePerGroup = pagePerGroup;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public void setNowGroup() {
		this.nowGroup = this.nowPage / this.pagePerGroup +1;
	}
	public void setLastPageNum() {
		this.lastPageNum = nowGroup * pagePerGroup;
	}
	public void setStartPageNum() {
		this.startPageNum = lastPageNum - (pagePerGroup - 1);
	}
	
	public void setTotalRecord(int nowPage, String keyWord, String category) {
		this.totalRecord = mdao.getTotal(keyWord, category);
		makePaging(nowPage);
	}

	public void setTotalPage() {
		this.totalPage = totalRecord / recPerPage + (totalRecord%recPerPage >0 ? 1 : 0);
	}
	public void setTotalGroup(){
		this.totalGroup = totalPage / pagePerGroup + (totalPage%pagePerGroup > 0 ? 1 : 0);
	}
	
	public void setPrevGroup() {
		this.prevGroup = nowGroup == 1 ? true : false;
	}
	public void setNextGroup() {
		this.nextGroup = nowGroup == totalGroup ? true : false;
	}
	
	public void setLastRecNum() {
		this.lastRecNum = nowPage*recPerPage;
	}
	public void setStartRecNum() {
		this.startRecNum = lastRecNum - recPerPage + 1;
	}
	
	private void makePaging(int nowPage){
		
		if(this.totalRecord==0) {
			prevGroup = true;
			nextGroup = true;
			return;
		}
		
		setNowPage(nowPage);
		setTotalPage();
		setTotalGroup();
		
		setNowGroup();
		setLastPageNum();
		setStartPageNum();
		
		
		setPrevGroup();
		setNextGroup();
		setLastRecNum();
		setStartRecNum();
		
		
		if(nowPage < 0) setNowPage(1);
		if(nowPage > totalPage) setNowPage(totalPage);
		if(lastPageNum > totalPage)	lastPageNum = totalPage;
		if(lastRecNum>totalRecord)	lastRecNum = totalRecord;
		
		System.out.println("nowPage "+nowPage);
		System.out.println("nowGroup "+nowGroup);
		System.out.println("totalPage "+ totalPage);
		System.out.println("lastPage "+ lastPageNum);
		System.out.println("startRecNum" + startRecNum);
		System.out.println("lastRecNum" + lastRecNum);
		System.out.println("recperpage" + recPerPage);
		
		System.out.println(nowGroup);
		System.out.println(totalGroup);
		System.out.println(totalPage%pagePerGroup);
		
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public int getNowGroup() {
		return nowGroup;
	}
	public int getRecPerPage() {
		return recPerPage;
	}
	public int getPagePerGroup() {
		return pagePerGroup;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getTotalGroup() {
		return totalGroup;
	}
	public int getLastPageNum() {
		return lastPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public boolean getPrevGroup() {
		return prevGroup;
	}
	public boolean getNextGroup() {
		return nextGroup;
	}
	public int getLastRecNum() {
		return lastRecNum;
	}
	public int getStartRecNum() {
		return startRecNum;
	}
	
}