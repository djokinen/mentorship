<%@ Page ClientIDMode="Static" Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="connect.aspx.cs" Inherits="membership_connect" %>

<%--
	<%@ Register Src="~/UserControl/MentorIndustry/List.ascx" TagName="List" TagPrefix="mentorIndustry" %>
	<%@ Register Src="~/UserControl/MenteeMentor/List.ascx" TagName="List" TagPrefix="menteeMentor" %>
--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="Server">

	<script>
		$(function () {
			$("#mentee-mentor-list a.accept").click(function () {
				var uid = $(this).closest("li").data("userid");
				WebService.ConnectWithMentee(uid, 2, _connectWithMenteeCallback);
			});

			$("#mentee-mentor-list a.reject").click(function () {
				var uid = $(this).closest("li").data("userid");
				WebService.ConnectWithMentee(uid, -1, _connectWithMenteeCallback);
			});
		});

		/*	int retval = connection status id
		*	None = 0, Rejected = -1, Pending = 1, Accepted = 2	*/
		function _connectWithMenteeCallback(retval) {
			switch (retval) {
				case -1: // rejected
					alert('connection rejected');
					break;
				case 0:
					alert('connection none');
					break;
				case 1:
					alert('connection pending');
					break;
				default:
					alert('connection accepted');
			}
			alert("return value: " + retval + "\nuse return value to set li and div data attr");
		}

	</script>

	<style>
		#mentee-mentor-list {
			/*background-color: #ccc;*/
		}

			#mentee-mentor-list p {
				/*margin-bottom:0px;*/
			}

			#mentee-mentor-list li {
				/*float:left;*/
				/*min-height:75px;*/
				/*border: solid 1px #f80;*/
			}

				#mentee-mentor-list li label {
					font-weight: bolder;
				}

				#mentee-mentor-list li .right {
					/*width: 150px;*/
				}

				#mentee-mentor-list li .left {
					/*width: 70%;*/
				}

				#mentee-mentor-list .btn.reject {
					color: #fff;
					background-color: #D34836;
				}

				#mentee-mentor-list .btn.accept {
					color: #fff;
					background-color: #0F9D58;
				}
	</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

	<section class="form">

		<h1>Connection Requests</h1>
		<div>
			<span class="error">
				<asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal></span>
		</div>

		<ul id="mentee-mentor-list">
			<asp:Repeater ID="repeater" runat="server">
				<ItemTemplate>
					<li data-userid="<%# Eval("UserIdMentee") %>">
						<div class="right">
							<a class="btn accept" href="javascript://">accept <%# Eval("ConnectionStatus") %></a>
							<a class="btn reject" href="javascript://">reject <%# Eval("ConnectionStatus") %></a>
						</div>
						<%--<div class="left">--%>
						<div>
							<label><%# Eval("UserIdMentee") %></label>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed lacus vitae quam malesuada rhoncus id a diam.</p>
						</div>

					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>

	</section>

</asp:Content>

