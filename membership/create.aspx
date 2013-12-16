<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="membership_create" %>

<%@ Register Src="~/UserControl/Membership/Create.ascx" TagName="Create" TagPrefix="membership" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">
	<membership:Create ID="membershipCreate" runat="server" />
</asp:Content>