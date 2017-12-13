<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="TreatmentsDeletedr.aspx.cs" Inherits="HandIn3.TreatmentsDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <h1 class="mt-4 mb-3">Make
            <small>new treatment</small>
        </h1>
        <div class="row">
        <div class="col-lg-3 mb-4">
                <div class="list-group">
                    <a href="Dentist.aspx" class="list-group-item">My Schedule</a>
                    <a href="TreatmentsCREATEdr.aspx" class="list-group-item">Make new Treatment</a>
                    <a href="TreatmentsREADUPDATEdr.aspx" class="list-group-item">Edit Treatments</a>
                    <a href="TreatmentsDeletedr.aspx" class="list-group-item">Delete Treatment</a>
                </div>
        </div>
        <div class="col-lg-9 mb-4">
    <asp:GridView ID="GridViewTreatments" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <asp:DropDownList ID="DropDownListTreatments" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListTreatments_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <asp:Button ID="ButtonDelete" CssClass="btn btn-primary" runat="server" OnClick="ButtonDelete_Click" Text="Delete Treatment" />
    <br />
            </div>
        </div>
    </div>
</asp:Content>
