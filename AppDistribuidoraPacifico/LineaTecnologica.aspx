<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LineaTecnologica.aspx.cs" Inherits="AppDistribuidoraPacifico.LineaTecnologica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center">
        <div class="container text-center">
            <h1 class="letraTitulos mt-3" style="font-size: 9vh">Bienvenidos a la Línea Tecnológica</h1>
        </div>
        <%--imagen inicial--%>
        <div class="container p-5 text-center">
            <img src="www/css/img/LineaTecnologica/portadaTec.png" class="img-fluid" alt="...">
        </div>
        <%--fin de imagen inicial--%>
        <%--ultimos productos--%>
        <div class="container text-center">
            <h1 class="letraTitulos mt-3">Últimas novedades</h1>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaTecnologica/MacAir.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">MacBook Air</h5>
                            <p class="card-text">
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaTecnologica/Earpods.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Earpods</h5>
                            <p class="card-text">
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaTecnologica/Iphone X.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">iPhone X</h5>
                            <p class="card-text">
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img src="www/css/img/LineaTecnologica/Audifonos.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Audifonos</h5>
                            <p class="card-text">
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%--fin de ultimos productos--%>

        <%--aqui añadir todos los productos que viene de la bd--%>
        <div class="container text-center">
            <h1 class="letraTitulos mt-3">Productos Disponibles</h1>
        </div>
        <asp:DataList ID="lTecnologica" runat="server"
            DataSourceID="lineaTecnologica"
            RepeatColumns="2"
            CellSpacing="3"
            CssClass="text-center"
            OnItemCommand="lTecnologica_ItemCommand"
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

                                                <asp:Label ID="descripcion" runat="server" Style="color: #0F4C81; font-size: 3vh;" Text='<%#Eval ("descripcion") %>' />
                                                <%--campo para la cedula--%>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-12 text-center">
                                                            <asp:Label Text="Código de Barras:" runat="server" />
                                                            <asp:Label ID="codBarra" Text='<%#Eval("codBarras") %>' runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--campo para el precio--%>
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

        <%--fin de los produtos añadidos desde la BD--%>
        <%--algunas marcas--%>
        <div class="container text-center">
            <h1 class="letraTitulos mt-3">Algunas de nuestras marcas</h1>
        </div>
        <div class="container mt-5 mb-5">
            <div class="row align-items-center">
                <div class="col-md-3">
                    <img src="www/css/img/LineaTecnologica/HP.png" class="card-img-top img-fluid" alt="...">
                </div>
                <div class="col-md-3">
                    <img src="www/css/img/LineaTecnologica/huawei.png" class="card-img-top img-fluid" alt="...">
                </div>
                <div class="col-md-3">
                    <img src="www/css/img/LineaTecnologica/Samsung.png" class="card-img-top img-fluid" alt="...">
                </div>
                <div class="col-md-3">
                    <img src="www/css/img/LineaTecnologica/AppleLogo.png" class="card-img-top img-fluid" alt="...">
                </div>
            </div>
        </div>
        <%--fin de algunas marcas--%>
    </div>

    <asp:SqlDataSource ID="lineaTecnologica" runat="server"
        ConnectionString='<%$ ConnectionStrings:DistribuidoraPacificoConnectionString %>'
        SelectCommand="SELECT [codBarras], [clasificacion], [precioCompra], [descripcion], [porcentajeIV], [porcentajeIVA], [exento], [unidadMedida], [cantidad], [precioImpuestoIncluido], [foto], [estado] FROM [TblProducto] WHERE (([clasificacion] = @clasificacion) AND ([estado] = @estado))">
        <SelectParameters>
            <asp:Parameter DefaultValue="lineaTecnologica" Name="clasificacion" Type="String"></asp:Parameter>
            <asp:Parameter DefaultValue="true" Name="estado" Type="Boolean"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
