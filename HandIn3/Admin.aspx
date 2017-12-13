<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="HandIn3.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        
        <div class="row">
            <div class="col-2"></div>
            <div class="col-lg-8 mb-4" id="contactForm">
                <h1 class="mt-4 mb-3">Please
            <small>Login</small>
        </h1>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Email: </label>
                            <asp:TextBox ID="TextBoxEmail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Password: </label>
                            <asp:TextBox ID="TextBoxPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button ID="ButtonLogin" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
            </div>
            <div class="col-2"></div>
        </div>
    </div>
</asp:Content>
