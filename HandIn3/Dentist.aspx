<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="Dentist.aspx.cs" Inherits="HandIn3.Reservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">    
    <h1 class="mt-4 mb-3">Welcome
        <small>Dr. Fauchard</small>
    </h1>
    <div class="row">
        <div class="col-lg-3 mb-4">
                <div class="list-group">
                    <a href="Dentist.aspx" class="list-group-item">My Schedule</a>
                    <a href="TreatmentsCREATEdr.aspx" class="list-group-item">Make new Treatment</a>
                    <a href="TreatmentsREADUPDATEdr.aspx" class="list-group-item">Edit Treatments</a>
                    <a href="TreatmentsDeletedr.aspx" class="list-group-item">Delete Treatment</a>
                    <a href="AdminSponsors.aspx" class="list-group-item">Edit Sponsors</a>
                </div>
        </div>
        <div class="col-lg-9 mb-4">
            <asp:Button ID="ButtonAllRes" CssClass="btn btn-outline-info" runat="server" OnClick="ButtonAllRes_Click" Text="Show all reservations" />
            
            <asp:DropDownList ID="DropDownListPatient" CssClass="btn btn-outline-info dropdown-toggle" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListPatient_SelectedIndexChanged">
            </asp:DropDownList>

            <asp:DropDownList ID="DropDownDate" runat="server" CssClass="btn btn-outline-info dropdown-toggle" AutoPostBack="True" OnSelectedIndexChanged="DropDownDate_SelectedIndexChanged">
            </asp:DropDownList>
    <br />
    <br />
    <br />
            <div class="table-responsive">
            <asp:GridView ID="GridViewReservations" runat="server" CssClass="table" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                </div>
    <br />
    <br />
            <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
    <br />
    <br />
            </div>
    </div>
</div>
</asp:Content>
