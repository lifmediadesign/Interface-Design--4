<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="HandIn3.LogOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="LabelMessage" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;
<asp:Button ID="ButtonLogOut" runat="server" OnClick="ButtonLogOut_Click" Text="Log Out" />
</asp:Content>
