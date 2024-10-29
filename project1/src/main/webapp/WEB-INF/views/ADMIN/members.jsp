<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Members</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet"/>
<style type="text/css">
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
    #userId{
    	color: blue;
    	text-decoration: underline;
    }
    #userId:hover, #userId:focus{
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
    #qnavars{
    	height: 100px;
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
			<button style="color: red" onclick='location.href ="/admin_members"'>회원정보관리</button>
			<button onclick='location.href ="/admin_notice"'>공지사항관리</button>
			<button onclick='location.href ="/admin_faq"'>FAQ관리</button>
			<button onclick='location.href ="/admin_qa"'>Q&A관리</button>
			<button onclick='location.href ="/admin_main"'>게시판관리</button>
		</div>
	
		<div id="main_container">
			<div class="search_button"></div>
			<table id="table">
				<thead>
					<tr>
						<th>이름</th> <th>아이디</th> <th>회원등급</th> 
						<th>관심지1</th> <th>관심지2</th> <th>관심지3</th> <th>가입일</th> 
					</tr>
				</thead>
				<tbody id="data">
					<c:choose>
						<c:when test="${empty list}">
							<tr><td colspan="7">"자료가 존재하지 않습니다"</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}">
								<tr>
									<td>${k.userName}</td>
									<td><p id="userId" onclick="openModal('${k.userId}', '${k.userName}', '${k.userMail}', '${k.userAddr}', 
		                                  '${k.userFavor01}', '${k.userFavor02}', '${k.userFavor03}', 
		                                  '${k.userReg}', '일반')">${k.userId}</p></td>
									<td>일반</td>
									<td>${k.userFavor01}</td>
									<td>${k.userFavor02}</td>
									<td>${k.userFavor03}</td>
									<td>${k.userReg}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="popupModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form action="" id="modalform">
				<table id="modaltable">
					<tr><td class="modalvars">이름</td><td colspan="3"><input type="text" id="modaluserName"> </td></tr>
					<tr><td class="modalvars">아이디</td><td colspan="3"><input type="text" id="modaluserId"> </td></tr>
					<tr><td class="modalvars">이메일</td><td colspan="3"><input type="text" id="modaluserMail"></td></tr>
					<tr><td class="modalvars">주소</td><td colspan="3"><input type="text" id="modaluserAddr"></td></tr>
					<tr><td class="modalvars">관심지</td>
						<td><input type="text" id="modaluserFavor01"></td>
						<td><input type="text" id="modaluserFavor02"></td>
						<td><input type="text" id="modaluserFavor03"></td></tr>
					<tr><td class="modalvars">가입일자</td><td colspan="3"><input type="text" id="modaluserReg"></td></tr>
					<tr><td class="modalvars">회원등급</td><td colspan="3"><input type="text" id="modaluserLevel"></td></tr>
					<tr><td class="modalvars" >신고누적</td><td colspan="3">신고회수</td></tr>
					<tr><td class="modalvars" id="qnavars">Q&A 현황</td><td colspan="3">QNA내용</td></tr>
				</table>
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function openModal(userId, userName, userMail, userAddr, 
                userFavor01, userFavor02, userFavor03, userReg, userLevel){
			document.querySelector("#popupModal").style.display = "block";
			$("#modaluserId").attr('value', userId);
			$("#modaluserName").attr('value', userName);
			$("#modaluserMail").attr('value', userMail);
			$("#modaluserAddr").attr('value', userAddr);
			$("#modaluserFavor01").attr('value', userFavor01);
			$("#modaluserFavor02").attr('value', userFavor02);
			$("#modaluserFavor03").attr('value', userFavor03);
			$("#modaluserReg").attr('value', userReg);
			$("#modaluserLevel").attr('value', userLevel);
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