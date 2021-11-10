<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="VerFactura.aspx.cs" Inherits="AppDistribuidoraPacifico.VerFactura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-lg-10 ml-5">
        <div class="justify-content-center text-center ml-5">
            <div class="card mt-5 mb-5">
                <div class="card-header">
                    <div class="form-group">
                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <h4 class="card-title text-center" style="color: #0F4C81; font-size: 5vh;">Factura</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Fecha" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lFecha"
                                    CssClass="form-control" runat="server" MaxLength="80" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Cédula cliente" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtCedula" CssClass="form-control" runat="server" />
                               
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Forma de pago" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:DropDownList ID="txtFormaPago"
                                    runat="server" CssClass="form-control">
                                    <asp:ListItem Text="[Seleccionar]" Value="" />
                                    <asp:ListItem Text="Efectivo" Value="efectivo" />
                                    <asp:ListItem Text="Cheque" Value="cheque" />
                                    <asp:ListItem Text="Tarjeta" Value="tarjeta" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtFormaPago"
                                    ErrorMessage="Seleccione la forma de pago por favor"
                                    ControlToValidate="txtFormaPago" runat="server"
                                    InitialValue=""
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Información de tarjeta/cheque" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtInformacionPago"
                                    CssClass="form-control" runat="server" MaxLength="80" />
                                <asp:RegularExpressionValidator ID="regularExpressionValidatorTxtInfopago"
                                    ControlToValidate="txtInformacionPago" runat="server"
                                    ErrorMessage="Número no válido"
                                    ValidationExpression="\d+" ForeColor="Red">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="col-md-1">
                                <asp:RequiredFieldValidator ID="requiredTxtinformacionPago"
                                    ErrorMessage="La información de pago es requerida"
                                    ControlToValidate="txtInformacionPago" runat="server"
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <h5 class="card-title text-left ml-5">Detalle Factura </h5>

                    <%-- aqui cargo la tabla--%>
                    <asp:GridView ID="dtsProducto" runat="server" AutoGenerateColumns="false"
                        CssClass="table table-responsive-lg GridView" AllowPaging="True">
                        <Columns>
                            <asp:BoundField DataField="codigoBarra"
                                HeaderText="Código Barras"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                            <asp:BoundField DataField="descripcion" HeaderText="Descripción"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                            <asp:BoundField DataField="cantidad" HeaderText="Cantidad"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                            <asp:BoundField DataField="Precio" HeaderText="Precio"
                                HeaderStyle-CssClass="TextoContenido"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <%--terminar de cargar--%>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="SubTotal: " runat="server" Style="color: black" />
                            </div>
                            <div class="col-md-4">
                                <asp:Label class="text-right" runat="server" ID="lblSubTotal" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Descuento:" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <asp:Label class="text-right" runat="server" ID="lblDescuento" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label Text="Total: " runat="server" Style="color: black" />
                            </div>
                            <div class="col-md-4">
                                <asp:Label class="text-right" runat="server" ID="lblTotal" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <asp:Button ID="btnCancelar" Text="Cancelar Compra" CssClass="btn btn-dis" runat="server" OnClick="btnCancelar_Click" />
                            </div>
                            <div class="col-md-6 text-center">
                                <asp:Button ID="btnFinalizar" Text="Finalizar Compra" CssClass="btn btn-dis" runat="server" OnClick="btnFinalizar_Click" />
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
                </div>
                <div class="card-footer">
                    <h5 class="card-title text-center">Distribuidora del Pacífico SA</h5>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

