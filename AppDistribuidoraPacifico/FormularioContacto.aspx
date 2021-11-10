<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioContacto.aspx.cs" Inherits="AppDistribuidoraPacifico.FormularioContacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="container text-center">
            <h1 class="letraTitulos mt-3" style="font-size: 9vh">Contáctanos</h1>
        </div>
        <div class="container justify-content-center text-center">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label Text="Cédula" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" placeholder="##-####-####" MaxLength="12" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtCedula"
                            ErrorMessage="La cédula es requerida."
                            ControlToValidate="TxtCedula" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label Text="Nombre Completo" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNombreCompleto" runat="server" CssClass="form-control" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtNombreCompleto"
                            ErrorMessage="El nombre de el usuario es requerido."
                            ControlToValidate="TxtNombreCompleto" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label Text="Email" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@domain.com" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtEmail"
                            ErrorMessage="El email de el usuario es requerido."
                            ControlToValidate="TxtEmail" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label Text="Asunto" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control" TextMode="MultiLine" MaxLength="300" Rows="5" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtAsunto"
                            ErrorMessage="El asunto es requerido."
                            ControlToValidate="txtAsunto" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12 text-left">
                    <asp:ValidationSummary ID="validaciones" runat="server"
                        DisplayMode="BulletList" HeaderText="Datos requeridos"
                        Front-Names="verdana" Font-Size="12" ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="btnEnviarMensaje" Text="Enviar" CssClass="btn btn-dis" runat="server" OnClick="btnEnviarMensaje_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
