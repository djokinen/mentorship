﻿<%@ Control ClientIDMode="Static" Language="C#" AutoEventWireup="true" CodeFile="Detail.ascx.cs" Inherits="UserControl_Membership_Detail" %>

<%@ Register Src="~/UserControl/MentorIndustry/List.ascx" TagName="List" TagPrefix="mentorIndustry" %>

<%-- http://24ways.org/2009/have-a-field-day-with-html5-forms/ --%>

<section class="form">

	<div>
		<span class="error"><asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal></span>
	</div>

	<fieldset>
		<%--<legend>Required Info</legend>--%>
		<ol>

			<li>
				<label>User Name (<em>email address</em>)</label>
				<span id="spanUserName"><asp:Literal ID="literalUserName" runat="server"></asp:Literal></span>
			</li>

			<li>
				<label for="spanRoleType">Role Type</label>
				<span id="spanRoleType" class="capitalize"><asp:Literal ID="literalRoleType" runat="server"></asp:Literal></span>
			</li>

			<li>
				<label for="FullName">Name</label>
				<asp:RequiredFieldValidator Display="Dynamic" CssClass="error" ID="FullNameRequired" runat="server" ControlToValidate="FullName" ErrorMessage="Full Name is required." ToolTip="Full Name is required." ValidationGroup="required-info">*</asp:RequiredFieldValidator>
				<asp:TextBox ID="FullName" runat="server" placeholder="Full Name"></asp:TextBox>
				<asp:Literal ID="literalFullName" runat="server"></asp:Literal>
			</li>

			<!-- mentee -->
			<asp:Panel ID="panelMentee" runat="server">
				<li>
					<label for="MenteePhone">Phone</label>
					<asp:TextBox ID="MenteePhone" runat="server" placeholder="Phone Number"></asp:TextBox>
					<asp:Literal ID="literalMenteePhone" runat="server"></asp:Literal>
				</li>

				<li>
					<label for="MenteeCommunity">Community</label>
					<asp:TextBox ID="MenteeCommunity" runat="server" placeholder="Community"></asp:TextBox>
					<asp:Literal ID="literalMenteeCommunity" runat="server"></asp:Literal>
				</li>

				<li>
					<label for="MenteeDob">D.O.B.</label>
					<asp:TextBox ID="MenteeDob" runat="server" placeholder="Date of Birth"></asp:TextBox>
					<asp:Literal ID="literalMenteeDob" runat="server"></asp:Literal>
					<ajaxToolkit:CalendarExtender ID="calendarExtender" runat="server" TargetControlID="MenteeDob" Format="MMM dd, yyyy"></ajaxToolkit:CalendarExtender>
				</li>

				<li>
					<label for="MenteeOccupation">Occupation</label>
					<asp:TextBox ID="MenteeOccupation" runat="server" placeholder="Occupation"></asp:TextBox>
					<asp:Literal ID="literalMenteeOccupation" runat="server"></asp:Literal>
				</li>
			</asp:Panel>

			<!-- mentor -->
			<asp:Panel ID="panelMentor" runat="server">
				<li>
					<label for="MentorPhone">Phone</label>
					<asp:TextBox ID="MentorPhone" runat="server" placeholder="Phone Number"></asp:TextBox>
					<asp:Literal ID="literalMentorPhone" runat="server"></asp:Literal>
				</li>

				<li>
					<label for="MentorCompanyName">Company Name</label>
					<asp:TextBox ID="MentorCompanyName" runat="server" placeholder="Company Name"></asp:TextBox>
					<asp:Literal ID="literalMentorCompanyName" runat="server"></asp:Literal>
				</li>

				<li>
					<label for="MentorIndustry">Industry</label>
					<asp:TextBox ID="MentorIndustry" runat="server" placeholder="Industry"></asp:TextBox>
					<asp:Literal ID="literalMentorIndustry" runat="server"></asp:Literal>
				</li>

				<li>
					<label for="MentorBio">Bio</label>
					<asp:TextBox TextMode="MultiLine" Rows="3" ID="MentorBio" runat="server" placeholder="Bio"></asp:TextBox>
					<asp:Literal ID="literalMentorBio" runat="server"></asp:Literal>
				</li>

				<li>
					<mentorIndustry:List ID="mentorIndustryList" runat="server" />
				</li>
			</asp:Panel>

			<li>
				<div class="commands">
					<asp:Button ID="buttonUpdate" runat="server" CommandArgument="update" Text="update" ValidationGroup="required-info" />
					<asp:Label ID="labelStatus" runat="server" EnableViewState="false" CssClass="status"></asp:Label>
				</div>
			</li>
		</ol>
	</fieldset>

</section>