<%@ Page Title="Foro" Language="C#" MasterPageFile="~/InisioSesion.master" AutoEventWireup="true" CodeFile="Foro.aspx.cs" Inherits="Foro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div>
        <header>
            <h1>El rincon del Foro</h1>
            <img src="iconoForo.jpg" width="1%" id="icono"/>
            
        </header>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table style="width: 100%;"">  
      <tr>
            <div class="form-group">
            <div class="input-group">
                <td ><asp:TextBox ID="txtSearch"  class="form-input" runat="server" Height="19px" ></asp:TextBox></td>
            </div>
            </div>
            <div class="form-group">
                <td><asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="Buscar" OnClick="Button2_Click" /></td>
            </div>
            <div class="form-group">
                <td><asp:Button class="btn btn-primary" ID="Button2" runat="server" 
                Text="Crear Post" OnClick="Button1_Click" /></td>
           </div>
      </tr>
         </table>
    
     <asp:GridView ID="Post" runat="server"  DataSourceID="SqlDataSource1" AllowPaging="True" EmptyDataText="No data available." OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" PageIndex="1" PagerSettings-FirstPageText="FirstPage" DataKeyNames="Codigo">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" Visible="false" />
            <asp:BoundField DataField="texto" HeaderText="texto" SortExpression="texto" />
            <asp:BoundField DataField="fechaCreacion" HeaderText="fechaCreacion" SortExpression="fechaCreacion" />
            <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
            <asp:BoundField DataField="idCategoria" HeaderText="idCategoria" SortExpression="idCategoria" Visible="false"/>
            <asp:BoundField DataField="codigoTxt" HeaderText="codigoTxt" Visible="false" SortExpression="codigoTxt" />            
            <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
            <EditItemTemplate>                    
                         <asp:DropDownList ID="categoria" runat="server" DataSourceID="SqlDataSource2"
                         DataTextField="Categoria" DataValueField="idCategoria" SelectedValue='<%# Bind("idCategoria") %>'> 
                        </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Categoria")%>'></asp:Label>
            </ItemTemplate> 
            </asp:TemplateField>
        </Columns>
         <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
         <EmptyDataRowStyle HorizontalAlign="Center" />
         <pagersettings FirstPageText="First" LastPageText="Last" PreviousPageText="Codigo" />
        <pagerstyle
          height="30px"
          verticalalign="Bottom"
          horizontalalign="Center" BorderStyle="None"/>
    </asp:GridView>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString4 %>"
         SelectCommand="SELECT * FROM search" FilterExpression="Convert(Categoria, 'System.String') LIKE '{0}%'">
        <FilterParameters>
            <asp:ControlParameter Name="autor" ControlID="txtSearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
    <asp:Label ID="lbl_mensaje1" runat="server" Text=""></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ 
        ConnectionStrings:ForoConnectionString5 %>" SelectCommand="SELECT * FROM [Categoria]"></asp:SqlDataSource>
      </asp:Content>

