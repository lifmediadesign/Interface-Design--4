<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="HandIn3.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <h1 class="mt-4 mb-3">New
                <small>Patient</small>
            </h1>
            <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
            <div class="row">
                <div class="col-lg-8 mb-4" id="contactForm">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Full Name:</label>
                            <asp:TextBox ID="TextBoxFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="TextBoxFirstName" EnableClientScript="False" ErrorMessage="First name missing" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Social Security Number</label>
                            <asp:TextBox ID="TextBoxSSN" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxSSN" EnableClientScript="False" ErrorMessage="SSN missing" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorSSN" runat="server" ControlToValidate="TextBoxSSN" EnableClientScript="False" ErrorMessage="SSN format not correct ex. 220389-1555" ForeColor="Red" ValidationExpression="^\d{6}-\d{4}$" Display="None"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Insurance</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorInsurance" runat="server" ControlToValidate="RadioButtonListInsurance" EnableClientScript="False" ErrorMessage="Insurance missing" ForeColor="Red">*</asp:RequiredFieldValidator>

                            <asp:RadioButtonList ID="RadioButtonListInsurance" runat="server" OnSelectedIndexChanged="RadioButtonListInsurance_SelectedIndexChanged" RepeatDirection="Horizontal">
                                 <asp:ListItem>Yes</asp:ListItem>
                                 <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Gender</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" ControlToValidate="DropDownListGender" EnableClientScript="False" ErrorMessage="Gender not selected" ForeColor="Red" InitialValue="--Select--">*</asp:RequiredFieldValidator>
                            <asp:DropDownList ID="DropDownListGender" runat="server">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem>Woman</asp:ListItem>
                                <asp:ListItem>Man</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Age</label>
                            <asp:TextBox ID="TextBoxAge" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ControlToValidate="TextBoxAge" EnableClientScript="False" ErrorMessage="Age is missing" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidatorAge" runat="server" ControlToValidate="TextBoxAge" EnableClientScript="False" ErrorMessage="Age must be between 1 and 126" ForeColor="Red" MaximumValue="126" MinimumValue="1" Type="Integer" Display="None"></asp:RangeValidator>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Email</label>
                            <asp:TextBox ID="TextBoxEmail" CssClass="form-control" runat="server" Font-Names="Abel"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" EnableClientScript="False" ErrorMessage="Email missing" Font-Names="Abel" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" EnableClientScript="False" ErrorMessage="Email should contain @ and ." Font-Names="Abel" ForeColor="Red" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" Display="None"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Password</label>
                            <asp:TextBox ID="TextBoxPassword" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" EnableClientScript="False" ErrorMessage="Password missing" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password should be between 6 and 10 characters " EnableClientScript="False" ForeColor="Red" ValidationExpression="^\w{6,10}$" Display="None"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="control-group form-group">
                        <div class="controls">
                            <label>Confirm password</label>
                            <asp:TextBox ID="TextBoxConfirm" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirm" runat="server" ControlToValidate="TextBoxConfirm" EnableClientScript="False" ErrorMessage="Confirm Password missing" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidatorConfirm" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxConfirm" EnableClientScript="False" ErrorMessage="Password do not match" ForeColor="Red" Display="None"></asp:CompareValidator>
                        </div>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="Phone"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBoxPhone" CssClass="form-control" runat="server"></asp:TextBox>
                    <br />
                    <asp:ValidationSummary ID="ValidationSummaryNewPatient" runat="server" DisplayMode="List" ForeColor="Red" HeaderText="Errors" EnableClientScript="False" />
                    <asp:Button ID="ButtonNewPatient" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="ButtonNewPatient_Click" />
                    <br />
                    <br />
                    
                    <br />
                    <br />
                </div>
            </div>
        </div>
</asp:Content>
