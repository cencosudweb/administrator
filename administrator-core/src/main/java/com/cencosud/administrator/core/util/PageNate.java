/**
 * 
 */
package com.cencosud.administrator.core.util;

import java.text.DecimalFormat;

/**
 * @author jose
 *
 */
public class PageNate {
	
	private int start;
	private int limit;
	private long total;
	private int page;
	private double pages;
	private String url;

	/**
	 * 
	 */
	public PageNate(long total,int page,int limit,String url) {
		// TODO Auto-generated constructor stub
		
		//DecimalFormat formato = new DecimalFormat("#,###");
		this.total = total;
		this.limit = Math.max(limit,1);
		this.page = Math.max(page,1);
		this.url = url;
		
		//System.out.println("total="+this.total);
		//System.out.println("limit="+this.limit);
		
		this.start = (int) Math.max( ( (this.page-1) * this.limit ), 0);
		this.pages =  Math.ceil( (this.total/(double)this.limit));
		
		/*
		System.out.println("########CLASE PAGE#########");
		System.out.println("total="+this.total);
		System.out.println("limit="+Math.round(this.limit));
		System.out.println("page="+this.page);
		System.out.println("url="+url);
		System.out.println("ceil="+( (this.total / (double)this.limit) ));
		*/
		if( ( Math.round((double)this.limit) > this.total) || (this.page > Math.ceil( (this.total/(double)this.limit) )) ) {
			this.start = 0;
		}
		
		if(((double)this.limit-1)*this.start > this.total) {
			this.start -= this.start % (double)this.limit;
		}
		//System.out.println("########CLASE PAGE#########");
		//url = "";
		setURL(url, "");
	}

	public void setURL(String url, String vars) {
		// TODO Auto-generated method stub
		if(url != null){
			if (url.substring(0, url.indexOf("?") + 1) != null) 
				url=url.concat("?");
			
		} else {
			url= "allCalls?"; 
		}
		this.url= url.concat(vars);
	}

	/**
	 * @return the start
	 */
	public int getStart() {
		return start;
	}

	/**
	 * @param start the start to set
	 */
	public void setStart(int start) {
		this.start = start;
	}

	/**
	 * @return the limit
	 */
	public int getLimit() {
		return limit;
	}

	/**
	 * @param limit the limit to set
	 */
	public void setLimit(int limit) {
		this.limit = limit;
	}

	/**
	 * @return the total
	 */
	public long getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(long total) {
		this.total = total;
	}

	/**
	 * @return the page
	 */
	public int getPage() {
		return (int) Math.ceil((this.start+1)/(double)this.limit);
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}

	/**
	 * @return the pages
	 */
	public double getPages() {
		return pages;
	}

	/**
	 * @param pages the pages to set
	 */
	public void setPages(double pages) {
		this.pages = pages;
	}
	
	public String getNumPages() {
		DecimalFormat formato = new DecimalFormat("#,###");
		return formato.format(pages);
		//return pages;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getPageLinks() {
		String html = "";
		
		String file	= this.url;
		int displayed_span 	= 5;
		long total_pages 		= (long) Math.ceil( this.total / (double)this.limit );
		int this_page 			= (int) Math.ceil( (this.start+1) / (double)this.limit );
		
		System.out.println("start="+start);
		System.out.println("limit="+this.limit);
		System.out.println("ceil="+Math.ceil( (this.start+1) / this.limit ));
		
		
        //int last=this_page-1;
        //int next=this_page+1;
		
       	float start_loop 		= (float) Math.floor(this_page-displayed_span);
        int stop_loop          = (int) Math.ceil(this_page + displayed_span);
        
        
        int stopcredit    =(int) ((start_loop<1)?0-start_loop:0);
        int startcredit   =(int) ((stop_loop>total_pages)?stop_loop-total_pages:0);
       
        int start_loop1 =(int) ((start_loop-startcredit>0)?start_loop-startcredit:1);
        int stop_loop1  =(int) ((stop_loop+stopcredit>total_pages)?total_pages:stop_loop+stopcredit);

        if (this_page != 1){
        	int lastspan=this_page-1;
        	//<li><a href="#">Prev</a></li>
        	//html = html + "<a href=\"#\">Atras</a>";
        	html = html + "\n<a href=\""+file+"&p="+lastspan+"\" >Prev</a>";
        	//html = html + "\n<a href=\""+file+"&p="+lastspan+"\" >&laquo;</a>";
        }
        
        
       for (int i = start_loop1; i <= stop_loop1; i++) {
        	this.page = (int) ((i - 1) * this.limit);
        	if (i == this_page) {
        		//html = html + "\n<a href=\""+file+"&p=<b>["+i+"]</b>\">"+i+"</a>";
        		//html = html + "\n<b>["+i+"]</b>";
        		//html = html + "["+i+"]";
        		//html = html + "\n<a href=\""+file+"&p="+i+"\"  style=\"background-color:#f5f5f5; color:#545a80\">"+""+i+""+"</a>";
        		html = html + "\n<a href=\""+file+"&p="+i+"\"  style=\"background-color:#0088d5; color:#ffffff\">"+""+i+""+"</a>";
        	} else {
        		//html = html + "<a href=\"\">"+i+"</a>";
        		//html = html + "\n<a href=\""+file+"?&p="+i+"\">"+i+"</a>";
        		html = html + "\n<a href=\""+file+"&p="+i+"\">"+i+"</a>";
        	}
        }
        
        
        if(this_page!= total_pages){
            int nextspan=this_page+1;
            
            //html = html + "<a href=\"#\">Siguiente</a>";
           html =  html + "\n<a href=\""+file+"&p="+nextspan+"\" >Next</a>";
           //html =  html + "\n<a href=\""+file+"&p="+nextspan+"\" >&raquo;</a>";
			
			
        }
        
		return html;
	}

}
