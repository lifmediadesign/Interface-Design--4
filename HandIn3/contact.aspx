<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="HandIn3.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <br />
        <div class="row">
            <!-- Map Column -->
            <div class="col-lg-8 mb-4">
              <!-- Embedded Google Map -->
              <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3304.4554898917136!2d-118.28603038489332!3d34.08347008059746!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c744783037d9%3A0xbcbde097af5cb4f9!2s3481+Melrose+Ave%2C+Los+Angeles%2C+CA+90029%2C+USA!5e0!3m2!1sda!2sdk!4v1512739557087"></iframe>
            </div>
            <!-- Contact Details Column -->
            <div class="col-lg-4 mb-4">
              <h3>Contact Details</h3>
              <p>
                3481 Melrose Place
                <br>Beverly Hills, CA 90210
                <br>
              </p>
              <p>
                <abbr title="Phone">Phone</abbr>: (123) 456-7890
              </p>
              <p>
                <abbr title="Email">Email</abbr>:
                <a href="mailto:info@Odont.dk">info@Odont.dk
                </a>
              </p>
              <p>
                <abbr title="Hours">Opening hours</abbr>: Monday - Friday: 9:00 AM to 5:00 PM
              </p>
            </div>
          </div>
        <br />
        <br />
        <br />
        </div>
</asp:Content>
