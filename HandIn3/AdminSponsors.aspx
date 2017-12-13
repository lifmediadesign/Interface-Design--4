<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="AdminSponsors.aspx.cs" Inherits="HandIn3.AdminSponsors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    <div class="row">
        <div class="col-lg-3 mb-4">
            <br />
            <br />
                    <div class="list-group">
                        <a href="Dentist.aspx" class="list-group-item">My Schedule</a>
                        <a href="TreatmentsCREATEdr.aspx" class="list-group-item">Make new Treatment</a>
                        <a href="TreatmentsREADUPDATEdr.aspx" class="list-group-item">Edit Treatments</a>
                        <a href="TreatmentsDeletedr.aspx" class="list-group-item">Delete Treatment</a>
                        <a href="AdminSponsors.aspx" class="list-group-item">Edit Sponsors</a>
                    </div>
            </div>
        <div class="col-lg-9 mb-4">
        <br />
        <br />
            <asp:DropDownList ID="DropDownListSponsors" CssClass="btn btn-outline-info dropdown-toggle" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Label ID="LabelMessages" runat="server" Text=""></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxID" runat="server" BackColor="#CCCCCC" ReadOnly="True" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelID" runat="server" Text="SponsorID (read only)"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxName" runat="server" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxWebsite" runat="server" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelWebsite" runat="server" Text="Website"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxPicture" runat="server" Width="200px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelPicture" runat="server" Text="Picture"></asp:Label>
            <br />
            <br />
            <asp:Button ID="ButtonCreate" CssClass="btn btn-info" runat="server" Text="Create" OnClick="ButtonCreate_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonUpdate" CssClass="btn btn-info" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonDelete" CssClass="btn btn-info" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonCancel" CssClass="btn btn-info" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
            <br />
            <br />
        <div class="table-responsive">
            <asp:Repeater ID="RepeaterSponsor" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover">
                        <tr>
                            <td>ID</td>
                            <td>Name</td>
                            <td>Website</td>
                            <td>Link</td>
                            <td>Picture</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("SponsorID") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("Website") %></td>
                        <td><%# Eval("Picture") %></td>
                        <td><img src="Images/<%# Eval("Picture") %>" alt="Sponsor" /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        </div>
    </div>
</div>
</asp:Content>
