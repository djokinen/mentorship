<%@ Control Language="C#" AutoEventWireup="true" CodeFile="List.ascx.cs" Inherits="UserControl_MenteeMentor_List" %>

<%--<script src="/js/dwj-menteementor.js"></script>--%>
<script src="/js/jquery.mixitup.min.js"></script>
<script>
	$(function () {
		// init filtering
		$('#mixitup-container').mixitup();

		$(".mentor-list.left a").click(function () {
			$(".mentor-list ul li").removeClass("active");
			$(this).parent("li").addClass("active");

			var mentorAsJson = $(this).data("user"); //alert("Bio: " + mentorAsJson['Bio']);

			$("#mentor-detail input").val(mentorAsJson['UserId']);
			$("#mentor-detail h3").html(mentorAsJson['Name']);
			$("#mentor-detail .subtitle em").html(mentorAsJson['Company']);
			$("#mentor-detail div strong").html(mentorAsJson['Industries']);
			$("#mentor-detail p").html(mentorAsJson['Bio']);
			$("#mentor-detail a.btn").html("Connect with " + mentorAsJson['Name']);
		});

		$("#testBtn").click(function () {
			_connectWithMentor("C74F1DDF-9AC6-49D1-94BE-5D8C7DA36ED4", 1);
		});

	});

	// var mentee_mentor = function ConnectWithMentor(userIdMentor, connectionStatus) {
	function _connectWithMentor(userIdMentor, connectionStatus) {
		WebService.ConnectWithMentor(userIdMentor, connectionStatus, _connectWithMentorCallback);
	};

	function _connectWithMentorCallback(retval) {
		alert("return value: " + retval);
	}
</script>

<style type="text/css">
	.btn rejected {
		background-color: #f00;
	}
	.btn accepted {
		background-color: #0f0;
	}
</style>

<a class="btn" id="testBtn" href="javascript://;">Test</a>

<h1>Connect with a Mentor</h1>
<asp:Repeater ID="repeaterFilter" runat="server">
	<ItemTemplate>
		<a href="javascript://;" class="btn filter" data-filter="<%# Eval("ID") %>"><%# Eval("Name") %></a>
	</ItemTemplate>
</asp:Repeater>

<h2>Available Mentors</h2>

<fieldset id="mixitup-container">
	<div class="mentor-list left">
		<ul><asp:Literal ID="literalMentorList" runat="server"></asp:Literal></ul>
	</div>

	<div class="mentor-list right">
		<div id="mentor-detail">
			<asp:Literal ID="literalMentorDetail" runat="server"></asp:Literal>
		</div>
	</div>

</fieldset>