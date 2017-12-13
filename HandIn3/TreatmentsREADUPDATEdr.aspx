<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="TreatmentsREADUPDATEdr.aspx.cs" Inherits="HandIn3.TreatmentsREADUPDATE" %>
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
    <asp:GridView ID="GridViewTreatments" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewTreatments_SelectedIndexChanged">
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
    <br />
    <br />
    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
&nbsp;
    <asp:Label ID="LabelTreatment" runat="server" Text="Treatment"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="LabelPrice" runat="server" Text="Price"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="TextBoxPicture" runat="server"></asp:TextBox>
&nbsp;
    <asp:Label ID="LabelPicture" runat="server" Text="Picture"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="ButtonUpdate" CssClass="btn btn-primary" runat="server" OnClick="ButtonUpdate_Click" Text="Update" />
            </div>
        </div>
    </div>
</asp:Content>
