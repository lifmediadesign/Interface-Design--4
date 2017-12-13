<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterDental.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HandIn3.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1 class="mt-4 mb-3">&nbsp;</h1>
        <h1 class="mt-4 mb-3">Dr.
    <small>Fauchard</small>
    </h1>
<div class="row">
    <div class="col-lg-6">
        <img class="img-fluid rounded mb-4" src="Images/img-1.jpg" alt="Dentist Fauchard">
    </div>
    <div class="col-lg-6">
        <h2>About Dr. Fauchard</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, magni, aperiam vitae illum voluptatum aut sequi impedit non velit ab ea pariatur sint quidem corporis eveniet. Odit, temporibus reprehenderit dolorum!</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti eum ratione ex ea praesentium quibusdam? Aut, in eum facere corrupti necessitatibus perspiciatis quis?</p>
    </div>
</div>
        <!-- Team Members -->
    <h2>Our Team</h2>
    <div class="row">
        <div class="col-lg-4 mb-4">
          <div class="card h-100 text-center">
            <img class="card-img-top" src="Images/1.jpg" alt="Portrait">
            <div class="card-body">
              <h4 class="card-title">Alice Grue</h4>
              <h6 class="card-subtitle mb-2 text-muted">Dentist</h6>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
            </div>
            <div class="card-footer">
              <a href="#">Alice@odont.dk</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100 text-center">
            <img class="card-img-top" src="Images/2.jpg" alt="Portrait">
            <div class="card-body">
              <h4 class="card-title">Joseph Murphy</h4>
              <h6 class="card-subtitle mb-2 text-muted">Dentist</h6>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
            </div>
            <div class="card-footer">
              <a href="#">Joseph@odont.dk</a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 mb-4">
          <div class="card h-100 text-center">
            <img class="card-img-top" src="Images/3.jpg" alt="Portrait">
            <div class="card-body">
              <h4 class="card-title">Adam Taylor</h4>
              <h6 class="card-subtitle mb-2 text-muted">Dental technician</h6>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
            </div>
            <div class="card-footer">
              <a href="#">Adam@odont.dk</a>
            </div>
          </div>
        </div>
      </div>
<div class="row">
    <div class="col-1"></div>
    <div class="col-10">
        <div class="table">
            <asp:Repeater ID="RepeaterSponsor" runat="server">
                <HeaderTemplate>
                    <table class="table table-responsive">
                        <h2>Sponsors</h2>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <%--<td><%# Eval("SponsorID") %></td>
                        <td><%# Eval("Name") %></td>
                        <td><%# Eval("Website") %></td>
                        <td><%# Eval("Picture") %></td>--%>
                        <td><a target="_blank" href="<%# Eval("Website") %>"><img src="Images/<%# Eval("Picture") %>" class="img-rounded" alt="Link to Sponsor page" /></a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        &nbsp;

        

    </div>
    <div class="col-1"></div>
    <asp:Label ID="LabelMessage" runat="server"></asp:Label>
</div>
</div>
</asp:Content>