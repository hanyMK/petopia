<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="cocoaModal" role="dialog" aria-hidden="false" class="modal in modal_site_change_password" data-backdrop="true" data-keyboard="true" style="display: block; padding-left: 26px;">
			<div class="modal-dialog ui-draggable">
				<div class="modal-content"><!-- 비밀번호 찾기 -->
				<article class="modal_article pop p_lr_space pb16 bg-white no-padding" id="find_step_4">
					<div class="tit_wrap">
						<button class="close" data-dismiss="modal" aria-label="Close" data-toggle="tooltip" data-placement="bottom" data-original-title="닫기"><i class="btl bt-times"></i></button>
						<h2 class="find_tit _find_pw_title" ">비밀번호 변경</h2>
					</div>	
					<div class="force-padding _result_update_password_wrap">
						<form id="find_password_form">
							<div class="_token_obj" data-type="change_password">
								<input type="hidden" name="write_token" class="_tk_obj" value="rg0MBL8RMpVSzweDsj7MvBZ0QDr/vxtej8MmnQMv1bAJPPsZyo8gp3yjDelOe/TjXztXxOzFNVpJsSBmlMMkMCPl4GU5n239ckxIw9UkfljaH6SpxuyowqIVqJvtKSex">
								<input type="hidden" name="write_token_key" class="_tk_key_obj" value="5521">
							</div>
			
							<input type="hidden" name="c" value="16389279febd9891d0d90012d5a9821e">
							<input type="hidden" name="r" value="711">
							<input type="hidden" name="s" value="m2023051800cc3144dde8a">
							<input type="hidden" name="type" value="change_password">
							<div class="mb8">
								<div class="form-group input-group input-group-login">
									<input class="form-control" title="새 비밀번호" type="password" name="change_pass1" placeholder="새 비밀번호">
									<input class="form-control" title="새 비밀번호 확인" type="password" name="change_pass2" placeholder="새 비밀번호 확인">
								</div>
							</div>
						</form>
					<p class="txt_c mt16">
						<button class="btn btn-primary w100p h48" onclick="SITE_MEMBER.changePassword()">변경하기</button>
					</p>
					<p class="text-12 margin-bottom-xxl tip_bold"><span class="text-brand">TIP</span> 비밀번호에 영문 대소문자, 숫자, 특수문자를 조합하시면 안전도가 높아져 도용의 위험이 줄어듭니다.</p>
				</div>
			</article>
			<script>
				TOKEN.setListToken();
			</script>
			</div>
		</div>
	</div>



</body>
</html>