<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="TreatmentsCREATEdr.aspx.cs" Inherits="HandIn3.Treatments" %>
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
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Treatment </label>
                            <asp:TextBox ID="TextBoxName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Price </label>
                            <asp:TextBox ID="TextBoxPrice" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Picture </label>
                            <asp:TextBox ID="TextBoxPicture" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button ID="ButtonAddTreatmetn" CssClass="btn btn-primary" runat="server" OnClick="ButtonAddTreatmetn_Click" Text="Add New Treatment" />

                    <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
