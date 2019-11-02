package kr.ac.exlang.utill;

public class Pager {
	int page = 1;
	int perPage = 5;
	float total = 0;
	
	String SearchNl;
	String SearchPl;
	String SearchGender;
	String SearchHobby;
	String SearchUserName;
	int SearchAgeMin;
	int SearchAgeMax;
	
	
	public String getPaging(){
		String html;
		int maxPage = (int) Math.ceil(total/perPage);
		int startPage = ((page-1) / perPage) * perPage + 1;
		int endPage = startPage + (perPage - 1) > maxPage ? maxPage : startPage + (perPage - 1);
		
		String searchSQL = "";
		if(SearchAgeMin != 0 && SearchAgeMax != 0) {
			searchSQL = "SearchNl=" + SearchNl + "&SearchPl="+ SearchPl + "&SearchGender="+ SearchGender + "&SearchAgeMin="+ SearchAgeMin + "&SearchAgeMax="+ SearchAgeMax 
			 + "&SearchHobby="+ SearchHobby + "&SearchUserName=" + SearchUserName + "&";
		}
		
//		html형식으로 내용찍기
		html = "<div class="+"text-center"+">";	
		html += "<ul class="+"pager_ul"+">";
		html += "<li><a href='?"+ searchSQL + "page=1'> << </a></li>";
		html += "<li><a href='?"+ searchSQL + "page=" + (page <= 1 ? 1 : page - 1) + "'> < </a></li>";
		
		for(int i = startPage; i <= endPage; i++) {
			html += "<li class='"+ (i == page ? "page_on" : "") +"'><a href='?"+ searchSQL + "page=" + i + "'> " + i + "</a></li>";
		}

		html += "<li><a href='?"+ searchSQL + "page=" + (page + 1 > maxPage ? maxPage : page+1 ) + "'> > </a></li>";
		html += "<li><a href='?"+ searchSQL + "page=" + maxPage + "'> >> </a></li>";
		html += "</ul>";
		html += "</div>";
		
		return html;
	}
	

// 페이징 처리용 Get, Set
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page < 1) {
			page = 1;
		}
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}


	
// 검색용 Get, Set

	public String getSearchNl() {
		return SearchNl;
	}


	public void setSearchNl(String searchNl) {
		SearchNl = searchNl;
	}


	public String getSearchPl() {
		return SearchPl;
	}


	public void setSearchPl(String searchPl) {
		SearchPl = searchPl;
	}


	public String getSearchGender() {
		return SearchGender;
	}


	public void setSearchGender(String searchGender) {
		SearchGender = searchGender;
	}


	public String getSearchHobby() {
		return SearchHobby;
	}


	public void setSearchHobby(String searchHobby) {
		SearchHobby = searchHobby;
	}


	public String getSearchUserName() {
		return SearchUserName;
	}


	public void setSearchUserName(String searchUserName) {
		SearchUserName = searchUserName;
	}


	public int getSearchAgeMin() {
		return SearchAgeMin;
	}


	public void setSearchAgeMin(int searchAgeMin) {
		SearchAgeMin = searchAgeMin;
	}


	public int getSearchAgeMax() {
		return SearchAgeMax;
	}


	public void setSearchAgeMax(int searchAgeMax) {
		SearchAgeMax = searchAgeMax;
	}



}
