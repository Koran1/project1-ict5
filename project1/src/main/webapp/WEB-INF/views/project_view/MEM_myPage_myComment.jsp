<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지_내댓글보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
	#container{display: flex;}
	#flex_left{width: 15%;  background-color: Whitesmoke;}
	#flex_write{width: 85%;}
	#logo{width: 200px; height: 70px;} 
	#name{font-size: 50px; font-weight: bold;}
	#article_container{display: flex; flex-direction: column;}
	article{font-size: 30px; padding: 20px; margin: 10px;}
	#title{font-size: 50px; margin-left: 20px;}
	table{border: 1px solid gray; border-collapse: collapse; width: 80%; height: 300px; margin-top: 20px; }
	th, td{border: 1px solid gray; text-align: center; padding: 10px; }
	button{width: 100px; height: 50px;}
	#del_all_btn{float: right; margin-right: 490px; margin-top: 20px;}
	a {text-decoration: none; color: black}
	#now {border: 1px solid black;font-weight: bold; padding: 3px 7px;}
	ul{list-style-type: none;}
	li{display: inline;}
	tfoot{margin: 50px;}
	.page_num{padding: 3px 7px;}
	.page_btn{padding: 3px 7px;}

</style>
</head>
<body>
	<div id="container">
		<section id="flex_left">
			<a href="/go_main"><img id="logo" alt="" src="resources/images/logo.png"></a>
			<p id="name">홍길동님</p>
			<div id="article_container">
			<article style="background-color: lightgray">
				<img alt="" src="resources/images/my_comment.png" style="float: left;">
				내 댓글 관리
			</article>
			<article>
				<a href="/go_update">
				<img alt="" src="resources/images/update.png" style="float: left;">
				회원정보 수정
				</a>
			</article>
			<article>
				<a href="/go_pw_change">
				<img alt="" src="resources/images/change_pw.png" style="float: left;">
				비밀번호 변경
				</a>
			</article>
			<article>
				<a href="/go_user_out">
				<img alt="" src="resources/images/member_out.png" style="float: left;">
				회원 탈퇴
				</a>
			</article>
			</div>
		</section>	
		
		<section id="flex_write">
			 <p id="title">내 댓글 보기/ 삭제하기</p>
			 <hr>
			 <form>
			 <table id="comment_table">
			 	<thead>
			 		<tr>           <!-- 데이터 받을 때 글 번호/관광지명/내용/작성일자 받기  -->
			 			<th>전체선택<input type="checkbox" id="all_chk"/></th><th>관광지명</th><th>내용</th><th>작성일자</th><th></th>
			 		</tr>
			 	</thead>
			 	<tbody id="tbody"></tbody>
			 	<tfoot id="tfoot"></tfoot>
			 </table>
			 <button  type="button" id="btn_del_chked" name="btn_del_chked">일괄삭제</button>
			 
			 </form>
		</section>				
	</div>
	<script type="text/javascript">
		 
		 $("#comment_table").on("click", ".page_num", function() { // 페이지 번호 클릭시 이동이벤트
			 let nowPage = $(this).text();
			getComment(nowPage);
		});
		 
		 $("#comment_table").on("click", ".page_btn", function() {  // 페이지 이전/다음으로 클릭 시 이동이벤트
			 	
				 let nowPage = $(this).attr("name");
			 	console.log("nowPage: ", nowPage);
				getComment(nowPage);
		   });
		    
		function getComment(nowPage) { // 내 댓글 리스트 가져오기
			$.ajax({
				url: "/get_comment_data", 
				method: "post", 
				data: "nowPage=" + nowPage, 
				dataType: "json", 
				success: function(data) {
						if (data.list == null || (data.list).length === 0) {
							$("#tbody").empty();
							tbody = "";
							tbody += "<tr><td colspan='5'>등록된 댓글이 없습니다.</td></tr>";
							$("#tbody").append(tbody);
						}else {
							makeTBody(data.list);						
						}
						makeTfoot(data.paging);
				}, // success 괄호 
				error: function() {
					alert("서버 에러 발생");
				}
				}); // ajax 괄호
		}
		    
		function makeTBody(data) {
				$("#tbody").empty();
					tbody = "";
					$(data).each(function(index, obj) {
						tbody += "<tr>";
						tbody += "<td width='4%'><input type='checkbox' class='checkboxes' name='" + obj.tourTalkIdx + "'></td>"; 
						tbody += "<td width='14'>" + obj.trrsrtNm + "</td>";
						tbody += "<td width='55%'>" + obj.tourTalkContent + "</td>";
						tbody += "<td width='14%'>" + obj.tourTalkReg + "</td>";
						tbody += "<td width='13%'><button type='button' class='btn_del_one' name='" + obj.tourTalkIdx + "'>삭제</button></td>";
						tbody += "</tr>";
					}); // each 괄호
					$("#tbody").append(tbody);
				}
				
		
		function makeTfoot(paging) {
			$("#tfoot").empty();
				tfoot = "";
				tfoot += "<tr>";
				tfoot += "<td colspan='5'><ul>";
				if (paging.startBlock > paging.blockPerPage) {
					let previous = paging.startBlock -1;
					tfoot += "<li class='page_btn' id='previous' name='" + previous + "'>이전으로</li>";
				}
				
				for (let i = paging.startBlock; i <= paging.endBlock; i++) {
					if (i == paging.nowPage) {
						tfoot += "<li id='now' class='page_num'>"+ i +"</li>";
					}else {
						tfoot += "<li class='page_num'>"+ i + "</li>";
					}
				}
				if (paging.totalPage > paging.endBlock) {
					let next = paging.endBlock + 1;
					tfoot += "<li class='page_btn' id='next' name='"+ next +"'>다음으로</li>";
				}
				tfoot += "</ul></td>";
				tfoot += "</tr>";
				$("#tfoot").append(tfoot);
		}
		getComment();

		$("#comment_table").on("click", ".btn_del_one", function() { // 삭제버튼 클릭 이벤트
		    if (confirm("정말 삭제할까요?")) {
		        let nowPage = $("#now").text();
		        $.ajax({
		            url: "/get_del_one", 
		            method: "post", 
		            data: "tourTalkIdx=" + $(this).attr("name"), 
		            dataType: "text", 
		            success: function(result) {
		                if (result == "0") {
		                    alert("삭제 실패");
		                } else if (result == "1") {
		                	let tbody = document.querySelector("#tbody");
		                	let rows = tbody.rows.length;
		                	if (rows === 1) {
			                	$("#tbody").empty();
			                    getComment(nowPage-1);
							}else { 
			                	$("#tbody").empty();
			                    getComment(nowPage);
						}
		                }
		            }, 
		            error: function() {
		                alert("실패");
		            }
		        });
		    }
		});
		
 		 $("#btn_del_chked").on("click", function() { // 일괄 삭제 버튼 클릭 이벤트
 			let nowPage = $("#now").text();
 			let chkBoxes = document.querySelectorAll(".checkboxes");
 	 		let anyChked = Array.from(chkBoxes).some(item => item.checked);
			let chkedBoxes =  Array.from(chkBoxes).filter(item => item.checked);
			let tourTalkIdxes = chkedBoxes.map(item => item.getAttribute("name"));
			if (anyChked) { // 체크된게 없으면 반응 안하게
				if (confirm("정말 삭제하시겠습니까? ")) {
		 			$.ajax({
						url: "/get_del_chked", 
						method: "post", 
						data: { chkedIdx :  tourTalkIdxes}, 
						dataType: "text", 
						success: function(data) {
							if (data == 0 ) {
								alert("삭제 실패");
							}else if (data > 0) {
								$("#tbody").empty();
								getComment(nowPage-1);
							}
						}, 
						error: function() {
							alert("에러 발생");
						}
						}); 
				}
			}
			
		});  
 		 
		// 전체선택 체크박스
		$("#comment_table").on("change", "#all_chk", function() { 
			let chkBoxes = document.querySelectorAll(".checkboxes");
			chkBoxes.forEach(item => item.checked = this.checked);		
		});
		
		
	
	</script>

</body>
</html>