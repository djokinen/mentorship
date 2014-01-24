<%@ Control ClientIDMode="Static" EnableViewState="false" Language="C#" AutoEventWireup="true" CodeFile="Connect.ascx.cs" Inherits="UserControl_MenteeMentor_Connect" %>

<script>
	var btn;
	$(function () {
		$("#mentee-mentor-list a.accept").click(function () {
			if (confirm("Connect with this mentee?")) {
				btn = $(this);
				var uid = btn.closest("li").data("userid");
				WebService.ConnectWithMentee(uid, 2, _connectWithMenteeCallback);
			}
		});

		$("#mentee-mentor-list a.reject").click(function () {
			if (confirm("End connection with this mentee?")) {
				btn = $(this);
				var uid = btn.closest("li").data("userid");
				WebService.ConnectWithMentee(uid, -1, _connectWithMenteeCallback);
			}
		});
	});

	/*	int retval = connection status id
	*	None = 0, Rejected = -1, Pending = 1, Accepted = 2	*/
	function _connectWithMenteeCallback(retval) {
		btn.toggleClass("accept reject");
		if (btn.hasClass('accept')) {
			btn.text('connect');
		} else {
			btn.text('disconnect');
		}
	}
	//	return;
	//	switch (retval) {
	//		case -1: // rejected
	//			alert('connection rejected:');
	//			break;
	//		case 0:
	//			alert('connection none:');
	//			break;
	//		case 1:
	//			alert('connection pending:');
	//			break;
	//		default:
	//			alert('connection accepted:');
	//	}
	//	alert("return value: " + retval + "\nuse return value to set li and div data attr");
	//}

</script>

<%--<section class="form">--%>
	<h2>Mentee Connections</h2>
	<ul id="mentee-mentor-list">
		<asp:Literal ID="literal" runat="server"></asp:Literal>
	</ul>
<%--</section>--%>