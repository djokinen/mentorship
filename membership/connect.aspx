<%@ Page ClientIDMode="Static" Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="connect.aspx.cs" Inherits="membership_connect" %>

<%--
	<%@ Register Src="~/UserControl/MentorIndustry/List.ascx" TagName="List" TagPrefix="mentorIndustry" %>
	<%@ Register Src="~/UserControl/MenteeMentor/List.ascx" TagName="List" TagPrefix="menteeMentor" %>
--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" runat="Server">

	<style>

		#mentee-mentor-list {
			background-color: #ccc;
		}
			#mentee-mentor-list p {
				margin-bottom:0px;
			}

			#mentee-mentor-list li {
				/*float:left;*/
				/*min-height:75px;*/
				border: solid 1px #f80;
			}

				#mentee-mentor-list li label {
					font-weight: bolder;
				}

				#mentee-mentor-list li .right {
					width: 150px;
				}

				#mentee-mentor-list li .left {
					/*width: 70%;*/
				}

				#mentee-mentor-list li .accept {
					color: #0f0;
				}

				#mentee-mentor-list li .reject {
					color: #f00;
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
					<li>
						<div class="right">
							<a class="btn accept" href="javascript://">accept</a>
							<a class="btn reject" href="javascript://">reject</a>
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

