<%@ Page Title="" Language="C#" MasterPageFile="~/InisioSesion.master" AutoEventWireup="true" CodeFile="InsertaUs.aspx.cs" Inherits="InsertaUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h1>Inserta Usuario</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="usuario,idEstado,idTipo" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True">
        <Columns>
            <asp:BoundField DataField="usuario" HeaderText="usuario" ReadOnly="True" SortExpression="usuario" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="idEstado" HeaderText="idEstado" ReadOnly="True" SortExpression="idEstado" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
            <asp:BoundField DataField="idTipo" HeaderText="idTipo" ReadOnly="True" SortExpression="idTipo" />
            <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
             <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2"
                         DataTextField="Estado" DataValueField="idEstado"
                             SelectedValue='<%# Bind("idEstado")%>'> 
                        </asp:DropDownList>                     
                    </EditItemTemplate>
                <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Estado")%>'></asp:Label>
                </ItemTemplate> 
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                    <EditItemTemplate>                    
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3"
                         DataTextField="Tipo" DataValueField="idTipo"
                             SelectedValue='<%# Bind("idTipo") %>'> 
                        </asp:DropDownList>
                    </EditItemTemplate>
                <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Tipo")%>'></asp:Label>
                </ItemTemplate> 
            </asp:TemplateField>         
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString %>" SelectCommand="SELECT * FROM [usarioes]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString2 %>" SelectCommand="SELECT * FROM [Estado]">
    <DeleteParameters>
                <asp:Parameter Name="newparameter" />
            </DeleteParameters>
</asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString3 %>" SelectCommand="SELECT * FROM [Tipo]"></asp:SqlDataSource>
        <DeleteParameters>
                <asp:Parameter Name="newparameter" />
            </DeleteParameters>
</asp:Content>


