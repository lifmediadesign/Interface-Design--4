<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="PatientCreateReservation.aspx.cs" Inherits="HandIn3.PatientCreateReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div>
        <h1 class="mt-4 mb-3">Make
            <small>new appointment</small>
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
    <br />
    <asp:DropDownList ID="DropDownListTreatmentName" runat="server">
    </asp:DropDownList>
    <asp:Label ID="LabelTreatment" runat="server" Text="Choose Treatment"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="LabelDate" runat="server" Text="Date"></asp:Label>
&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorDate" runat="server" ControlToValidate="TextBoxDate" EnableClientScript="False" ErrorMessage="Date should be dd/MM/yyyy format" ForeColor="Red" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:TextBox ID="TextBoxTime" runat="server"></asp:TextBox>
&nbsp;&nbsp;
    <asp:Label ID="LabelTime" runat="server" Text="Time"></asp:Label>
&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorTime" runat="server" ControlToValidate="TextBoxTime" EnableClientScript="False" ErrorMessage="Time should be hh:mm" ForeColor="Red" ValidationExpression="^([0-1][0-9]|[2][0-3]):([0-5][0-9])$"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Label1" runat="server" Text="Phone"></asp:Label>
    <br />
    <br />
    <asp:Button ID="ButtonNewReservation" runat="server" OnClick="ButtonNewReservation_Click" Text="New reservation" />
    <br />
    <br />
    <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
                </div>
        </div>
    </div>
</asp:Content>
