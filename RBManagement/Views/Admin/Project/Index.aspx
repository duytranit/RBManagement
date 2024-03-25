<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RBManagement.Views.Admin.Project.Index" %>
<%@ Register TagPrefix="Partial" TagName="RGProject" Src="~/Views/Admin/Project/Partials/RGProject.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FolderContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <Partial:RGProject ID="RGProject" runat="server" />
</asp:Content>
