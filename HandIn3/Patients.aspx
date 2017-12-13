<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="HandIn3.Patients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div>
        <h1 class="mt-4 mb-3">My
            <small>page</small>
        </h1>
        <div class="row">
        <div class="col-lg-3 mb-4">
                <div class="list-group">
                    <a href="Patients.aspx" class="list-group-item">My Page</a>
                    <a href="PatientCreateReservation.aspx" class="list-group-item">Make new appointment</a>
                    <a href="PatientsDeleteReservation.aspx" class="list-group-item">Cancel appointment</a>

                </div>
        </div>
        <div class="col-lg-9 mb-4">
            <asp:Label ID="LabelMessage" runat="server"></asp:Label>

    <p>
        <br />
        <asp:GridView ID="GridViewReservation" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewReservation_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
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
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:DropDownList ID="DropDownListTreatmentName" runat="server">
        </asp:DropDownList>
&nbsp;
        <asp:Label ID="LabelTreatmentName" runat="server" Text="Choose Treatment"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="LabelDate" runat="server" Text="Date"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="TextBoxTime" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="LabelTime" runat="server" Text="Time"></asp:Label>
    </p>
    <p>
        <asp:Button ID="ButtonUpdate" runat="server" Text="Change reservation" />
</p>
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
            </div>
        </div>
    </div>
</asp:Content>
