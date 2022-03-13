<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="chatbot">
	<img src="/images/chatbot.png">
</div>

<div class="chatting" style="display:none;">
	<iframe id="frame" src="${contextPath}/chat/room?uid=${member.uid}" marginwidth="0"  marginheight="0" frameborder="0" scrolling="no"></iframe>
</div>

<!-- script -->
<script>
	$(".chatbot img").on("click", function() {
		$(".chatting").css("display", "block");
	});
	
	function chatCloseFunc() {
		$(".chatting").css("display", "none");
	}
</script>
