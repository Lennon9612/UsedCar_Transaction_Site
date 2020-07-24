<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Sign up Member</title>
</head>
<body>

<script type="text/javascript">
	function checkForm() {
		if (!document.member.memberId.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.member.memberPassword.value) {
			alert("비밀번호를 입력하세요.");
			return false;	
		}

		if (document.member.memberPassword.value != document.member.memberPasswordConfirmation.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>

	<div class="container marketing" id="marketing">
		<div class="row">
			<h2 class="text-center">회원가입</h2>
			
			<div class="col-xs-3 col-md-3"></div>
			
			<div class ="col-sm-6"></div>
		</div>
	</div>
	
	<div class="form-group">
		<form name="form-horizontal" action="memberProcess.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-10">
					<input type="text" name= "memberId" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-10">
					<input type="password" name= "memberPassword" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-10">
					<input type="password" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-10">
					<input type="text" name = "memberName" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2">휴대전화</label>
				<div class="col-sm-10">
					<input type="text" name = "memberPhone" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-14 ">
					<input type="submit" class="btn btn-success" value="회원가입">
					<input type="reset" class="btn btn-danger " value="취소" onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>
