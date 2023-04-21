<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.store.model.vo.Store, com.kh.common.model.vo.PageInfo"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Store> list = (ArrayList<Store>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
 %>
 
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />
    <title>Insert title here</title>

    <style data-tag="reset-style-sheet">
      html {
        line-height: 1.15;
      }
      body {
        margin: 0;
      }
      * {
        box-sizing: border-box;
        border-width: 0;
        border-style: solid;
      }
      p,
      li,
      ul,
      pre,
      div,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      figure,
      blockquote,
      figcaption {
        margin: 0;
        padding: 0;
      }
      button {
        background-color: transparent;
      }
      button,
      input,
      optgroup,
      select,
      textarea {
        font-family: inherit;
        font-size: 100%;
        line-height: 1.15;
        margin: 0;
      }
      button,
      select {
        text-transform: none;
      }
      button,
      [type="button"],
      [type="reset"],
      [type="submit"] {
        -webkit-appearance: button;
      }
      button::-moz-focus-inner,
      [type="button"]::-moz-focus-inner,
      [type="reset"]::-moz-focus-inner,
      [type="submit"]::-moz-focus-inner {
        border-style: none;
        padding: 0;
      }
      button:-moz-focus,
      [type="button"]:-moz-focus,
      [type="reset"]:-moz-focus,
      [type="submit"]:-moz-focus {
        outline: 1px dotted ButtonText;
      }
      a {
        color: inherit;
        text-decoration: inherit;
      }
      input {
        padding: 2px 4px;
      }
      img {
        display: block;
      }
      html {
        scroll-behavior: smooth;
      }
    </style>
    
    <style data-tag="default-style-sheet">
      html {
        font-family: Inter;
        font-size: 16px;
      }

      body {
        font-weight: 400;
        font-style: normal;
        text-decoration: none;
        text-transform: none;
        letter-spacing: normal;
        line-height: 1.15;
        color: var(--dl-color-gray-black);
        background-color: var(--dl-color-gray-white);
      }
    </style>
    
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap"
      data-tag="font"
    />
    <link rel="stylesheet" href="resources/css/style.css" />
  </head>
  
  <body>
      <%@ include file="../common/menubar.jsp"%>
  
    <div>
      <link href="resources/css/layout155.css" rel="stylesheet" />
      <div class="layout155-container">
        <div class="layout155-layout155">
          <div id="map" style="width:1100px;height:700px;"></div>
          <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2d566a338a02241ce115c4453b6b7ac5"></script>
          <script>
            var container = document.getElementById('map');
            var options = {
              center: new kakao.maps.LatLng(37.54699, 127.09598),
              level: 3
            };
        
            var map = new kakao.maps.Map(container, options);

            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
              
            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition, 
                image: markerImage // 마커이미지 설정 
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map); 
          </script>
        </div>
      </div>
    </div>
    
    
    <div>
      <link href="resources/css/category-filters5.css" rel="stylesheet" />
      
	  <form id="keywordList-form" action="<%= contextPath %>/list.st?currentPage=1" method="post" >
	  
      <div class="category-filters5-container">
        <div class="category-filters5-category-filters5">
          <div class="category-filters5-section-title">
            <span class="category-filters5-text HeadingH2">
              <span><h2>매장찾기</h2></span>
            </span>
          </div>
          <div class="category-filters5-content">
            <div class="category-filters5-row1">
              <div class="category-filters5-filter-two">
                <div class="category-filters5-select">
                  <span class="category-filters5-text28 TextRegularNormal">
                    <span>시/도</span>
                  </span>
                  <img
                    src="resources/css/public/playground_assets/iconchevrondowni146-9i5g.svg"
                    alt="IconChevronDownI146"
                    class="category-filters5-icon-chevron-down1"
                  />
                </div>
              </div>
              <div class="category-filters5-filter-three">
                <div class="category-filters5-select1">
                  <span class="category-filters5-text34 TextRegularNormal">
                    <span>구/군</span>
                  </span>
                  <img
                    src="resources/css/public/playground_assets/iconchevrondowni146-lz8g.svg"
                    alt="IconChevronDownI146"
                    class="category-filters5-icon-chevron-down2"
                  />
                </div>
              </div>
              <div class="category-filters5-filter-four">
                <div class="category-filters5-select2">
                  <span class="category-filters5-text40 TextRegularNormal">
                    <span>동</span>
                  </span>
                  <img
                    src="resources/css/public/playground_assets/iconchevrondowni146-ewkp.svg"
                    alt="IconChevronDownI146"
                    class="category-filters5-icon-chevron-down3"
                  />
                </div>
			</div>
				<select name="bname" class="category-filters5-select2">
					<option value="" selected>브랜드조회</option>
					<option value="전체">전체</option>
	 				<option value="BHC">BHC</option>
	 				<option value="바른치킨">바른치킨</option>
	 				<option value="푸라닭">푸라닭</option>
				</select>
			</div>
          </div>
          <br>
          <table style="margin : auto;">
          		<tr>
          			<td>
          				<input type="text" name="keyword" class="category-filters5-select2" placeholder="검색어를 입력하세요."> 
          			<td>
          				<button class="btn btn-outline-success" type="submit">검색</button>
          			</td>
          		</tr>
          </table>
	
				</div>
     		</div>
     	 </form> 
   	</div>
    	
    <div>
      <link href="resources/css/career17.css" rel="stylesheet" />

      <div class="career17-container">
        <div class="career17-career17">
          <div class="career17-section-title">
            <span class="career17-text TextRegularSemiBold"></span>
          </div>
          <div class="career17-content1">
          
          <% for(Store s : list) { %>
            <div class="career17-card">
              <div class="career17-job">
                <span class="career17-text03 HeadingH5">
                  <span><%= s.getStoreName() %></span>
                </span>
                
                <span class="career17-text05 TextRegularNormal">
                  <span><%= s.getStoreAddress() %></span>
                </span>
              </div>
              
              <div class="career17-info">
                <div class="career17-content2">
                  <img
                    src="resources/css/public/playground_assets/iconpini146-ify4.svg"
                    alt="IconPinI146"
                    class="career17-icon-pin"/>
                  <span class="career17-text07 TextMediumNormal">
                    <span></span> <!-- location 이미지만 넣을거임 -->
                  </span>
                </div>
                
                 <div class="career17-content3">
                  <img
                    src="resources/css/public/playground_assets/iconclocki146-fjhq.svg"
                    alt="IconClockI146"
                    class="career17-icon-clock"/>
                  <span class="career17-text09 TextMediumNormal">
                    <span><%= s.getStorePhone() %></span>
                  </span>
                </div>
             
                <div class="career17-content3">
                  <img
                    src="resources/css/public/playground_assets/iconclocki146-fjhq.svg"
                    alt="IconClockI146"
                    class="career17-icon-clock"/>
                  <span class="career17-text09 TextMediumNormal">
                    <span><%= s.getStoreTime() %></span>
                  </span>
                </div>
              </div>
            </div>
            <% } %>
            
          </div>
        </div>
      </div>
    </div>
    
        <br><br>
            
            <div align="center" class="paging-area">
            
            	<% if(currentPage != 1) { %>
            		 <button onclick="location.href = '<%= contextPath %>/list.st?currentPage=<%= currentPage - 1 %>';">
            		 	&lt;
            		 </button>
            	<% } %>
            	
            	<% for(int p = startPage; p <= endPage; p++) { %>
            		<% if(p != currentPage) {  %>
            			<button onclick="location.href = '<%= contextPath %>/list.st?currentPage=<%= p %>';">
           					<%= p %> 			
            			</button>
            		<% } else { %>
            			<button disabled><%= p %></button>
            		<% } %>
            	<% } %>
            
            	<% if(currentPage != maxPage) { %>
            		<button onclick="location.href = '<%= contextPath %>/list.st?currentPage=<%= currentPage + 1 %>';">
            			&gt;
            		</button>
            	<% } %>
            </div>
  	</body>
</html>