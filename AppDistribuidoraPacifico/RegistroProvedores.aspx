<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistroProvedores.aspx.cs" Inherits="AppDistribuidoraPacifico.RegistroProvedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center ContenidoTexto">
        <div class="container text-center">
            <h1 class="letraTitulos mt-3" style="font-size: 9vh">Registro Proveedores</h1>
        </div>
        <div class="justify-content-center text-center">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Cédula" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtCedulaLegal" runat="server" CssClass="form-control" placeholder="##-####-####" MaxLength="12" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtCedulaLegal"
                            ErrorMessage="La cédula legal es requerida."
                            ControlToValidate="txtCedulaLegal" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Nombre Comercial" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtNombreComercial" runat="server" CssClass="form-control" MaxLength="20" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtNombreComercial"
                            ErrorMessage="El nombre comercial es requerido."
                            ControlToValidate="txtNombreComercial" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Teléfono" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="+506 ####-####" MaxLength="14" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtTelefono"
                            ErrorMessage="El teléfono de el provedor es requerido."
                            ControlToValidate="TxtDireccion" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Dirección" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtDireccion"
                            ErrorMessage="La dirección de el provedor es requerida."
                            ControlToValidate="TxtDireccion" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Contacto" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtContacto" runat="server" CssClass="form-control" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtContacto"
                            ErrorMessage="El contacto de el provedor es requerido."
                            ControlToValidate="TxtDireccion" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Email" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@domain.com" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtEmail"
                            ErrorMessage="El email de el provedor es requerido."
                            ControlToValidate="TxtEmail" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12 text-left">
                        <asp:ValidationSummary ID="validaciones" runat="server"
                            DisplayMode="BulletList" HeaderText="Datos requeridos"
                            Front-Names="verdana" Font-Size="12" ForeColor="Red" />
                    </div>
                </div>

                <div class="form-group ">
                    <div class="row">
                        <div class="col-md-12 mt-2">
                            <asp:Button ID="btnRegistrarProvedor" Text="Registrar Provedor" CssClass="btn btn-dis" runat="server" OnClick="btnRegistrarProvedor_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
