<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Notice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet"/>
<style type="text/css">
	#main_container button{
		width: 100%;
		padding: 10px 20px;
		width: 150px;
	}
	
	#main_container button:hover{
		background-color: black;
		color: white;
		font-weight: bold;
	}
	#main_container .main_button{
		display: flex;
		justify-content: flex-end;
		width: 100%;
		margin: 20px 0;
	}
	.modal {
      display: none; /* 처음에 보이지 않음 */
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    }

    .modal-content {
      background-color: white;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 70%;
      height: 70%;
      text-align: center;
    }

    /* 닫기 버튼 */
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
    #noticeSubject{
    	color: blue;
    	text-decoration: underline;
    }
    #noticeSubject:hover, #noticeSubject:focus{
    	cursor: pointer;
    }
    #modaltable {
    	width: 100%;
    }
    #modaltable td{
    	border: 1px solid black;
    }
    .modalvars{
    	width: 20%;
    	border: none;
    }
    #modalnoticecontent{
    	height: 50%;
    }
</style>
</head>
<body>
	<div id="header">
		<img id="logo" alt="logo" src="../resources/images/logo.png" onclick='location.href ="/admin_index"'>
		<h2>admin index</h2>
	 </div>
	 
	<div id="container">
		<div id="button_container">
			<button onclick='location.href ="/admin_members"'>회원정보관리</button>
			<button style="color: red" onclick='location.href ="/admin_notice"'>공지사항관리</button>
			<button onclick='location.href ="/admin_faq"'>FAQ관리</button>
			<button onclick='location.href ="/admin_qa"'>Q&A관리</button>
			<button onclick='location.href ="/admin_main"'>게시판관리</button>
		</div>
	
		<div id="main_container">
			<div class="main_button"><button onclick='location.href ="/admin_notice_create"'>작성하기</button></div>
			<table id="table">
				<thead>
					<tr>
						<th>등록번호</th> <th>공지사항 명</th> <th>등록일</th> <th>게시글 Lv.</th> <th>게시글보이기</th> 
					</tr>
				</thead>
				<tbody id="data">
					<tr>
						<td>1</td> <td><p id="noticeSubject" onclick="openModal()">공지사항1</p></td> <td>20241016</td> <td>1</td> <td id=visible>ON</td>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr><td colspan="5">"자료가 존재하지 않습니다"</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}">
								<tr>
									<td>${k.noticeIdx}</td>
									<td><p id="userId" onclick="openModal(
										'${k.noticeSubject}', '${k.noticeReg}', 
										'${k.noticeLevel}', '${k.noticeStatus}' 
										'${k.noticeContent}')">${k.noticeSubject}</p></td>
									<td>${k.noticeReg}</td>
									<td>${k.noticeLevel}</td>
									<td>${k.noticeStatus}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="main_button"><button>업데이트</button></div>
		</div>
	</div>
	
	<div id="popupModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form action="" id="modalform">
			<table id="modaltable">
				<tr><td class="modalvars">제목</td><td><input type="text" id="modalnoticeSubject"></td></tr>
				<tr><td class="modalvars">등록일자</td><td><input type="text" id="modalnoticeReg"></td></tr>
				<tr><td class="modalvars">게시글 Level</td><td><input type="text" id="modalnoticeLevel"></td></tr>
				<tr><td class="modalvars">게시글 보이기</td><td><input type="text" id="modalnoticeStatus"></td></tr>
				<tr><td id="modalnoticecontent" colspan="2"><textarea rows="10" cols="60" id="modalnoticeContent"></textarea></td></tr>
			</table>
			<input type="submit" value="수정">
			<input type="reset" value="취소">
			</form>
		</div>
	</div>
	<script type="text/javascript">
		
		function openModal(noticeSubject, noticeReg, noticeLevel, noticeStatus, noticeContent){
			document.querySelector("#popupModal").style.display = "block";
			$("#modalnoticeSubject").attr('value', noticeSubject);
			$("#modalnoticeReg").attr('value', noticeReg);
			$("#modalnoticeLevel").attr('value', noticeLevel);
			$("#modalnoticeStatus").attr('value', noticeStatus);
			$("#modalnoticeContent").attr('value', noticeContent);
		}
		
		function closeModal() {
			document.querySelector("#popupModal").style.display = "none";
			document.querySelector("#modalform").reset();
		}
		
		// X 버튼 이벤트
		document.querySelector(".close").addEventListener('click', () => {
			closeModal();
		});
		
		// 모달 창 바깥쪽 클릭 시 이벤트
		window.onclick = (e) => {
			const modal = document.querySelector("#popupModal");
			if(e.target === modal){
				closeModal();
			}
		}
	</script>
</body>
</html>