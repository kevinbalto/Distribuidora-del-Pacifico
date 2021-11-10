<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="AppDistribuidoraPacifico.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container text-center">
            <h1 class="letraTitulos mt-3" style="font-size: 9vh">Carrito de compras</h1>
        </div>
        <div class="text-center">
            <asp:GridView ID="dtsProducto" runat="server" AutoGenerateColumns="False"
                DataKeyNames="id"
                HeaderStyle-BackColor="#0F4C81"
                HeaderStyle-ForeColor="White"
                CssClass="table table-responsive-lg GridView" AllowPaging="True"
                PageSize="5"
                OnRowDeleting="dtsProducto_RowDeleting">

                <Columns>
                    <asp:BoundField DataField="codigoBarra" HeaderText="Código Barras"
                        HeaderStyle-CssClass="TextoContenido">
                        <HeaderStyle CssClass="TextoContenido"></HeaderStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion"
                        HeaderStyle-CssClass="TextoContenido">
                        <HeaderStyle CssClass="TextoContenido"></HeaderStyle>
                    </asp:BoundField>
                    <%--se muestra 1 por default al agregar un producto al carrito--%>
                    <asp:TemplateField HeaderText="Cantidad" HeaderStyle-CssClass="TextoContenido">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCantidad" runat="server" Height="30px" Width="50px" TextMode="Number"
                                min="1" max="99">1</asp:TextBox>
                        </ItemTemplate>
                        <HeaderStyle CssClass="TextoContenido"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Precio" HeaderText="Precio"
                        HeaderStyle-CssClass="TextoContenido">
                        <HeaderStyle CssClass="TextoContenido"></HeaderStyle>
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Modificar"
                        ControlStyle-CssClass="btn btn-dis" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="text-center">
            <div class="form-group text-center">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Label Text="SubTotal:₡ " runat="server" Style="color: black" />
                        <asp:Label class="text-right" runat="server" ID="lblSubTotal" />
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="Button1" Text="Actualizar" CssClass="btn btn-dis" runat="server" OnClick="btnActualizar_Click" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="Button2" Text="Confirmar compra" CssClass="btn btn-dis" runat="server" OnClick="btnConfirmarCompra_Click" />
                    </div>
                    <div class="col-md-4    ">
                        <asp:Button ID="btnCancelar" Text="Cancelar Compra" CssClass="btn btn-dis" runat="server" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
