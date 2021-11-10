<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistroUsuarios.aspx.cs" Inherits="AppDistribuidoraPacifico.RegistroUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center ContenidoTexto">
        <div class="container text-center">
            <h1 class="letraTitulos mt-3" style="font-size: 9vh">Registro Usuarios</h1>
        </div>
        <div class="justify-content-center text-center">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
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
                    <div class="col-md-5">
                        <asp:Label Text="Tipo Identificación" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:DropDownList ID="txtTipoIdentificacion" runat="server" CssClass="form-control">
                            <asp:ListItem Text="[Seleccionar]" Value="" />
                            <asp:ListItem Text="Nacional" Value="Nacional" />
                            <asp:ListItem Text="Extranjero" Value="Extranjero" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtTipoIdentificacion"
                            ErrorMessage="El tipo de identificación es requerido."
                            ControlToValidate="TxtTipoIdentificacion" runat="server"
                            ForeColor="Red" InitialValue=""> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
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
                    <div class="col-md-5">
                        <asp:Label Text="Dirección" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtDireccion"
                            ErrorMessage="La dirección de el usuario es requerida."
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
                            ErrorMessage="El email de el usuario es requerido."
                            ControlToValidate="TxtEmail" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Contraseña" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtContrasenna" runat="server" CssClass="form-control" TextMode="Password" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requieredTxtContrasenna"
                            ErrorMessage="La contraseña es requerida."
                            ControlToValidate="txtContrasenna" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Validar Contraseña" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:TextBox ID="txtValidarContrasenna" runat="server" CssClass="form-control" TextMode="Password" MaxLength="50" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTxtValidarContrasenna"
                            ErrorMessage="Se debe validar la contraseña."
                            ControlToValidate="txtValidarContrasenna" runat="server"
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
                            ErrorMessage="El teléfono de el usuario es requerido."
                            ControlToValidate="TxtDireccion" runat="server"
                            ForeColor="Red"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--<div class="form-group">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label Text="Tipo Usuario" runat="server" />
                    </div>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlTipoUsuario" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredTipoUsuario"
                            ErrorMessage="El tipo de el usuario es requerido."
                            ControlToValidate="ddlTipoUsuario" runat="server"
                            ForeColor="Red" InitialValue="0"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>--%>
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
                        <asp:Button ID="btnRegistrarUsuario" Text="Registrar Usuario" CssClass="btn btn-dis" runat="server" OnClick="btnRegistrarUsuario_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
