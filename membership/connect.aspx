<%@ Page ClientIDMode="Static" Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="connect.aspx.cs" Inherits="membership_connect" %>

<%--
	<%@ Register Src="~/UserControl/MentorIndustry/List.ascx" TagName="List" TagPrefix="mentorIndustry" %>
	<%@ Register Src="~/UserControl/MenteeMentor/List.ascx" TagName="List" TagPrefix="menteeMentor" %>
--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">

<section class="form">

	<h1>Connection Requests</h1>
	<div>
		<span class="error"><asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal></span>
	</div>

	<fieldset>
		<ol>
			<asp:Repeater ID="repeater" runat="server">
				<ItemTemplate>
					<li>
						<div>
							<label>Mentee/Mentor</label>
							<span><%# Eval("UserIdMentee") %></span>
							<span><%# Eval("UserIdMentor") %></span>
						</div>
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ol>
	</fieldset>
</section>

</asp:Content>

