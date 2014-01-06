﻿<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="membership_create" %>

<%@ Register Src="~/UserControl/Membership/Create.ascx" TagName="Create" TagPrefix="membership" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">
	<h1>Register</h1>
	<membership:Create ID="membershipCreate" runat="server" />
</asp:Content>