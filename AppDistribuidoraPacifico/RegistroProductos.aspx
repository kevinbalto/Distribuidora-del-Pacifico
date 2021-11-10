<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistroProductos.aspx.cs" Inherits="AppDistribuidoraPacifico.RegistroProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center ContenidoTexto ">
        <div class="container text-center">
            <h1 class="letraTitulos mt-3" style="font-size: 9vh">Registro Productos</h1>
        </div>
        <div class="justify-content-center text-center">
            <%--codigo de barra--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Codigo de Barra:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtCodigoBarra"
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredtxtCodigoBarra"
                            ErrorMessage="El codigo de barra es requerido."
                            ControlToValidate="TxtCodigoBarra" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--clasificacion--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Clasificación:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="txtClasificacion"
                            runat="server" CssClass="form-control">
                            <asp:ListItem Text="[Seleccionar]" Value="" />
                            <asp:ListItem Text="Linea Blanca" Value="lineaBlanca" />
                            <asp:ListItem Text="Linea Tecnologica" Value="lineaTecnologica" />
                            <asp:ListItem Text="Linea Hogar" Value="lineaHogar" />
                            <asp:ListItem Text="Abarrotes" Value="abarrotes" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requieredtxtClasificacion"
                            ErrorMessage="La clasificación es requerida."
                            ControlToValidate="txtClasificacion" runat="server"
                            ForeColor="Red" InitialValue=""> * </asp:RequiredFieldValidator>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Provedor:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlProvedor" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="RequiredDropDownProvedor"
                            ErrorMessage="El nombre del provedor es requerido."
                            ControlToValidate="ddlProvedor" runat="server"
                            ForeColor="Red" InitialValue="0"> * </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--Descripcion--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Descripción" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtDescripcion"
                            CssClass="form-control" runat="server" MaxLength="80" />
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredDescripcion"
                            ErrorMessage="La descripcion es requerida."
                            ControlToValidate="txtDescripcion" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--precio de compra--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Precio Compra" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtPrecioCompra"
                            CssClass="form-control" runat="server" min="1" />
                        <asp:RegularExpressionValidator ID="regularExpressionValidatorttxtPrecioCompra"
                            ControlToValidate="txtPrecioCompra" runat="server"
                            ErrorMessage="Número no válido"
                            ValidationExpression="\d+" ForeColor="Red">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredPrecioCompra"
                            ErrorMessage="El precio de compra es requerido."
                            ControlToValidate="TxtPrecioCompra" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Cantidad" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtCantidad"
                            CssClass="form-control" runat="server" TextMode="Number" min="1" max="99" />
                        <asp:RegularExpressionValidator ID="regularExpressionValidatortxtCantidad"
                            ControlToValidate="txtCantidad" runat="server"
                            ErrorMessage="Número no válido"
                            ValidationExpression="\d+" ForeColor="Red">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiereTxtCantidad"
                            ErrorMessage="La cantidad es requerida."
                            ControlToValidate="txtCantidad" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--IVA--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Porcentaje IVA:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtPorcentajeIVA"
                            CssClass="form-control" runat="server" TextMode="Number" min="1"/>
                        <asp:RegularExpressionValidator ID="regularExpressionValidatortxtPorcentajeIVA"
                            ControlToValidate="txtPorcentajeIVA" runat="server"
                            ErrorMessage="Número no válido"
                            ValidationExpression="\d+" ForeColor="Red">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requieredTxtPorcentajeIVA"
                            ErrorMessage="Estado es impuesto IVA es requerido."
                            ControlToValidate="txtPorcentajeIVA" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--Porcentaje del valor agregado--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Porcentaje del valor agregado:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtPorcentajeValorA"
                            CssClass="form-control" runat="server" TextMode="Number" min="1" />
                        <asp:RegularExpressionValidator ID="regularExpressionValidatortxtPorcentajeValorAA"
                            ControlToValidate="txtPorcentajeValorA" runat="server"
                            ErrorMessage="Número no válido"
                            ValidationExpression="\d+" ForeColor="Red">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requieredTxtPorcentajeValorA"
                            ErrorMessage="Estado es impuesto IV es requerido."
                            ControlToValidate="txtPorcentajeValorA" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>   
            </div>
            <%--exento--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Exento" runat="server" />
                    </div>
                    <div class="col-md-8 text-left">
                        <asp:RadioButtonList ID="rdExento" runat="server" RepeatLayout="Flow">
                            <asp:ListItem Value="True" runat="server" Checked="false">Si</asp:ListItem>
                            <asp:ListItem Value="False" runat="server" Checked="false">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requieredExento"
                            ErrorMessage="Estado es requerido."
                            ControlToValidate="rdExento" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--unidad de medida--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Unidad de Medida:" runat="server" />
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="txtUnidadMedida"
                            runat="server" CssClass="form-control">
                            <asp:ListItem Text="[Seleccionar]" Value="" />
                            <asp:ListItem Text="Kilogramo" Value="Kilogramo" />
                            <asp:ListItem Text="Metros" Value="Metros" />
                            <asp:ListItem Text="Centimetro" Value="Centimetro" />
                            <asp:ListItem Text="Libra" Value="Libra" />
                            <asp:ListItem Text="Litro" Value="Litros" />
                            <asp:ListItem Text="Unidad" Value="Unidad" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requiredUnidadMedida"
                            ErrorMessage="La unidad de medida es requerida."
                            ControlToValidate="TxtUnidadMedida" runat="server"
                            ForeColor="Red" InitialValue="">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--estado--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Estado:" runat="server" />
                    </div>
                    <div class="col-md-8 text-left">
                        <asp:RadioButtonList ID="rdEstado" runat="server" RepeatLayout="Flow" >
                            <asp:ListItem Value="True" runat="server" Checked="false">Activo</asp:ListItem>
                            <asp:ListItem Value="False" runat="server" Checked="false">Inactivo</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="col-md-1">
                        <asp:RequiredFieldValidator ID="requieredrdEstado"
                            ErrorMessage="Estado es requerido."
                            ControlToValidate="rdEstado" runat="server"
                            ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--foto--%>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <asp:Label Text="Subir foto" runat="server" />
                    </div>
                    <div class="col-md-8 text-left">
                        <asp:FileUpload ID="fileUpload" runat="server"
                            BorderStyle="None" Font-Bold="true" />
                    </div>
                    <div class="col-md-1">
                        <%if (this.funtion != "E") {
                                        this.RequiredFileUpload.Enabled = true; }
                                    else{ this.RequiredFileUpload.Enabled = false; } %>
                        <asp:RequiredFieldValidator ID="RequiredFileUpload"
                            ErrorMessage="La foto es requerida"
                            ControlToValidate="fileUpload"
                            runat="server" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <%--validaciones--%>
            <div class="form-group">
                <div class="col-md-12 text-left">
                    <asp:ValidationSummary ID="validaciones" runat="server"
                        DisplayMode="BulletList" HeaderText="Datos requeridos"
                        Front-Names="verdana" Font-Size="12" ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <asp:Button ID="btnRegistrarProducto" Text="Registrar Producto" CssClass="btn btn-dis" runat="server" OnClick="btnRegistrarProducto_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
