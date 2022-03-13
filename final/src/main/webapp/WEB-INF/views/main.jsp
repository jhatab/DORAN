<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<body>
	<div class="subnav">
		<div class="tab">
			<ul class="tabnav">
				<li><a href="#tab01">추천순</a></li>
				<li><a href="#tab02">최신순</a></li>
			</ul>
			<div class="tabcontent">
				<div id="tab01">
					<div class="slider">
						<div class="group_img">
							<img src="images/ex1.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex2.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex3.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex4.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex5.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex6.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
					</div>
				</div>
				<div id="tab02">
					<div class="slider">
						<div class="group_img">
							<img src="images/ex7.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex8.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex9.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex1.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex2.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
						<div class="group_img">
							<img src="images/ex3.jpg" alt="">
							<div class="group_name">
								<span>Lorem Insum</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content_wrap">
	<div id="contents">
            <ul class="tabs">
                <li class="active" data-panel="panel1">운동</li>
                <li data-panel="panel2">여행</li>
                <li data-panel="panel3">요리</li>
                <li data-panel="panel4">뷰티 메이크업</li>
                <li data-panel="panel5">투자</li>
                <li data-panel="panel6">아웃도어/여행</li>
                <li data-panel="panel7">외국어</li>
                <li data-panel="panel8">음악</li>
                <li data-panel="panel9">게임</li>
            </ul>
            <div id="panel1" class="panel active"><div class="content_box">
                    <div class="content_list"><div class="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div class="like_view"><img src="images/like.png" /><span>36</span></div>
                        <div class="content_img"><img src="images/sports1.jpg" /></div>
                        <div class="comment_view"><span>2022-02-16&nbsp;</span><span>&nbsp;Comment 26</span></div>
                        </div>
                    <div class="content_list"><div class="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div class="like_view"><img src="images/like.png" /><span>27</span></div>
                        <div class="content_img"><img src="images/sports2.jpg" /></div>
                        <div class="comment_view"><span>2022-02-15&nbsp;</span><span>&nbsp;Comment 23</span></div>
                        </div>
                    <div class="content_list"><div class="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div class="like_view"><img src="images/like.png" /><span>17</span></div>
                        <div class="content_img"><img src="images/sports3.jpg" /></div>
                        <div class="comment_view"><span>2022-02-16&nbsp;</span><span>&nbsp;Comment 11</span></div>
                        </div>
                    <div class="content_list"><div class="text_box"><h1>Lorem Insum</h1><p>Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset Lorem Ipsum is simply dummy text of the printing and typesetting
                        industry. Lorem Ipsum has been the industry’s standard dummy
                        text ever since the 1500s, when an unknown printer took a galley
                        of type and scrambled it to make a type specimen book.
                        It has survived not only five centuries, but also the leap into
                        electronic typesetting, remaining essentially unchanged. It was
                        popularised in the 1960s with the release of Letraset  </p></div>
                        <div class="like_view"><img src="images/like.png" /><span>15</span></div>
                        <div class="content_img"><img src="images/sports4.jpg" /></div>
                        <div class="comment_view"><span>2022-02-17&nbsp;</span><span>&nbsp;Comment 27</span></div>
                        </div> </div></div>
            <div id="panel2" class="panel">컨텐츠 02</div>
            <div id="panel3" class="panel">컨텐츠 03</div>
            <div id="panel4" class="panel">컨텐츠 04</div>
            <div id="panel5" class="panel">컨텐츠 05</div>
            <div id="panel6" class="panel">컨텐츠 06</div>
            <div id="panel7" class="panel">컨텐츠 07</div>
            <div id="panel8" class="panel">컨텐츠 08</div>
            <div id="panel9" class="panel">컨텐츠 09</div>
        </div>
        </div>

	<script>
$(function(){
$('.tabcontent > div').hide();
$('.tabnav a').click(function () {
$('.tabcontent > div').hide().filter(this.hash).fadeIn();
$('.tabnav a').removeClass('active');
$(this).addClass('active');
return false;
}).filter(':eq(0)').click();
  });
  
    $( document ).ready( function() {
        $( '.slider' ).slick( {
        infinite:false,
          slidesToShow: 4,
          slidesToScroll: 1,
        } );
      } );
      
  $(document).ready(function() {
 
                $(".tabs li").on("click", function(e) {
 
                    var $contents = $(this).closest("#contents");
 
                    $contents.find(".tabs li.active").removeClass("active");
 
                    $(this).addClass("active");
 
                    $contents.find(".panel.active").hide();
                    $contents.find(".panel.active").removeClass("active");
 
                    var panelToShow = $(this).data("panel");
 
                    $("#" + panelToShow).show();
                    $("#" + panelToShow).addClass("active");
                });
            });
</script>




</body>
</html>