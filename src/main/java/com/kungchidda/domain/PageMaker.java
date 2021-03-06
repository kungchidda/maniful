package com.kungchidda.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

public @Data class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	// 한번에 보여지는 페이지
	private int displayPageNum = 10;

	private Criteria cri;

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		calcData();
	}

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		// startPage가 1이라면 prev 비활성
		prev = startPage == 1 ? false : true;

		// endPage*perPageNum이 totalCount 보다 작은지 확인
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	public String makeQuery(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
				.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
				.build();
		
		return uriComponents.toUriString();
	}

}
