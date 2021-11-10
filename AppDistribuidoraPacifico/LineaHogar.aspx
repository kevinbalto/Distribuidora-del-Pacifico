<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LineaHogar.aspx.cs" Inherits="AppDistribuidoraPacifico.LineaHogar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center">
        <h1 class="letraTitulos mt-3" style="font-size: 9vh">Bienvenidos a la Línea Hogar</h1>
    </div>
    <div class="container text-center">
        <%--imagen inicial--%>
        <div class="container p-5">
            <img src="www/css/img/LineaHogar/LineaHogar5.jpg" class="card-img-top img-fluid" alt="...">
        </div>
        <%--fin de imagen inicial--%>
        <%--Productos en tendencia--%>
        <div class="container text-center">
            <h1 class="letraTitulos mt-3">Productos en tendencia</h1>
        </div>
        <div class="container mt-5 text-center">
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaHogar/Sillon1.jpg" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Sillon</h5>
                            <p class="card-text">
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaHogar/Set.jpg" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Set de cucharas</h5>
                            <p class="card-text">
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaHogar/Sillon.jpg" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Sillon Grande</h5>
                            <p class="card-text">
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaHogar/Mueble.jpg" class="card-img-top img-fluid" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Mueble</h5>
                            <p class="card-text">
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%--fin de ultimos productos--%>
        <asp:Label ID="Message" ForeColor="Red" runat="server" />
        <%--productos de la BD--%>
        <div class="text-center p-5 ">
            <div class="container text-center">
                <h1 class="letraTitulos mt-3">Productos Disponibles</h1>
            </div>

            <asp:DataList ID="lHogar" runat="server"
                DataSourceID="lineaHogar"
                RepeatColumns="2"
                CellSpacing="3"
                AlternatingItemStyle-Wrap="true"
                CssClass="text-center"
                OnItemCommand="lHogar_ItemCommand"
                Width="100%" class="text-center">
                <ItemTemplate>
                    <table>
                        <tr>
                            <th>
                                <div class="card text-center">
                                    <div class="card md-3" style="max-width: 460px;">
                                        <div class="row no-gutters">
                                            <div class="col-md-4">
                                                <img src='Productos/<%# Eval("foto") %>' alt='<%#Eval("foto") %>'
                                                    class="img-fluid rounded" />
                                            </div>
                                            <div class="col-md-8">
                                                <div class="card-body">
                                                    <%--                                                    <h5 class="card-title text-center" id="descripcion" style="color: #861E32"><%#Eval ("descripcion") %></h5>--%>
                                                    <asp:Label ID="descripcion" Style="color: #0F4C81; font-size: 3vh;" runat="server" Text='<%#Eval ("descripcion") %>' />
                                                    <%--campo para la cedula--%>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-12 text-center">
                                                                <asp:Label Text="Código de Barras:" runat="server" />
                                                                <asp:Label ID="codBarra" Text='<%#Eval("codBarras") %>' runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%--campo para el nombre--%>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-12 text-center">
                                                                <asp:Label Text="Precio: ₡" runat="server" />
                                                                <asp:Label ID="precio" Text='<%#Eval("precioImpuestoIncluido") %>' runat="server" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 text-center mb-3">
                                                            <asp:Label Text="Precio Dolares: $" runat="server" />
                                                            <asp:Label ID="lblPrecioDolares" Font-Bolt="true" Text='<%# ( ((Decimal)DataBinder.Eval(Container.DataItem,"precioImpuestoIncluido")) /
                                                                ((Decimal)Session["tipoCambio"]) ).ToString("0.00")%>'
                                                                runat="server" />
                                                        </div>
                                                    </div>
                                                    <%--botones--%>
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-md-6 text-center">
                                                                <button type="button" class="btn btn-dis"
                                                                    data-toggle="modal"
                                                                    data-target='#ID<%# Eval("codBarras") %>'>
                                                                    Ver más información
                                                               
                                                                </button>
                                                            </div>
                                                            <div class="col-md-6 text-center">
                                                                <asp:Button ID="btnAnadir" Text="Añadir" runat="server" CssClass="btn btn-dis"
                                                                    CommandName="anadir"
                                                                    CommandArgument='<%# ( (DataListItem)Container).ItemIndex %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--cierre del card--%>
                                <%--modals para los clientes--%>
                                <div class="modal" id='ID<%# Eval("codBarras") %>'>
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Más información</h5>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">

                                                <%--campo para el porcentaje--%>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-12 text-center">
                                                            <asp:Label Text="Porcentaje Impuesto Venta:" runat="server" />
                                                            <asp:Label Text='<%#Eval("porcentajeIV") %>' runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-12 text-center">
                                                            <asp:Label Text="Porcentaje de impuesto de valor agregado:" runat="server" />
                                                            <asp:Label Text='<%#Eval("porcentajeIVA") %>' runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-12 text-center">
                                                            <asp:Label Text="Exento:" runat="server" />
                                                            <asp:Label Text='<%#Eval("exento") %>' runat="server" />
                                                            <%--hacer condiciones--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-12 text-center">
                                                            <asp:Label Text="Unidad de Medida:" runat="server" />
                                                            <asp:Label Text='<%#Eval("unidadMedida") %>' runat="server" />
                                                            <%--hacer condiciones--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:Button ID="btnModificar" Text="Modificar" runat="server"
                                                    CommandName="modificar"
                                                    CommandArgument='<%# ((DataListItem)Container).ItemIndex %>'
                                                    CssClass="btn btn-dis" />
                                                <asp:Button ID="btnEliminar" Text="Eliminar" runat="server"
                                                    CommandName="eliminar"
                                                    CommandArgument='<%# ((DataListItem)Container).ItemIndex %>'
                                                    CssClass="btn btn-dis" />
                                                <%--cierre del body--%>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-dis" data-dismiss="modal">
                                                        Close
                                                   
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </th>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <%--algunas marcas--%>
        <div class="container text-center">
            <h1 class="letraTitulos mt-3">Algunas de nuestras marcas</h1>
        </div>
        <div class="container mt-3 mb-5">
            <div class="row align-items-center">
                <div class="col-md-3">
                    <img src="www/css/img/LineaHogar/Akiro.png" class="card-img-top img-fluid" alt="...">
                </div>
                <div class="col-md-3">
                    <img src="www/css/img/LineaHogar/Conforama.png" class="card-img-top img-fluid" alt="...">
                </div>
                <div class="col-md-3">
                    <img src="www/css/img/LineaHogar/Kare.png" class="card-img-top img-fluid" alt="...">
                </div>
                <div class="col-md-3">
                    <img src="www/css/img/LineaHogar/Siman.png" class="card-img-top img-fluid" alt="...">
                </div>
            </div>
        </div>
        <%--fin de algunas marcas--%>
    </div>

    <asp:SqlDataSource ID="lineaHogar" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPacificoConnectionString %>'
        SelectCommand="SELECT [codBarras], [clasificacion], [descripcion], [precioCompra], [porcentajeIV], [porcentajeIVA], [exento], [unidadMedida], [estado], [foto], [precioImpuestoIncluido], [cantidad] FROM [TblProducto] WHERE (([clasificacion] = @clasificacion) AND ([estado] = @estado))">
        <SelectParameters>
            <asp:Parameter DefaultValue="lineaHogar" Name="clasificacion" Type="String"></asp:Parameter>
            <asp:Parameter DefaultValue="true" Name="estado" Type="Boolean"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
