<%@ Page Title="" Language="C#" MasterPageFile="~/InisioSesion.master" AutoEventWireup="true" CodeFile="Mantenedores.aspx.cs" Inherits="Mantenedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h1>Mantenedor Usuario</h1>
    <style type="text/css">
        .auto-style1 {
            width: 104px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString2 %>" SelectCommand="SELECT * FROM [Estado]">
    <DeleteParameters>
                <asp:Parameter Name="newparameter" />
            </DeleteParameters>
</asp:SqlDataSource>
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1"><label class="form-label" for="input-name">Usuario</label></td>
            <td><div class="form-group">
                <asp:TextBox class="form-input" runat="server" type="text" id="txt_usuario" placeholder="Ingrese su nombre de usuario"></asp:TextBox> 
            </div></td>
        </tr>
        <tr>
            <td class="auto-style1"><label class="form-label" for="input-email">Nombre</label></td>
            <td><div class="form-group">
            <asp:TextBox class="form-input" runat="server" type="text" id="txt_nombre" placeholder="Ingrese su nombre"></asp:TextBox> 
            </div></td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:label runat="server" text="Estado"></asp:label></td>
            <td><asp:dropdownlist class="form-input" runat="server" DataSourceID="SqlDataSource4" DataTextField="Estado" DataValueField="idEstado" ID="dropEstado"></asp:dropdownlist>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString %>" SelectCommand="SELECT * FROM [Estado]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:label runat="server" text="Tipo"></asp:label>
            </td>
            <td>
                <asp:dropdownlist class="form-input" runat="server" DataSourceID="SqlDataSource5" DataTextField="Tipo" DataValueField="idTipo" ID="DropTipo"></asp:dropdownlist>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString %>" SelectCommand="SELECT * FROM [Tipo]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1"><label class="form-label" for="input-email">Password</label></asp:label></td>
            <td><div class="form-group">
                <div class="input-group" style="z-index: auto;  text-align: center" >
                <asp:TextBox  runat="server" TextMode="Password" class="form-input" placeholder="Ingrese su contraseña" id="txt_pass"></asp:TextBox> 
            </div></div></td>    
        </tr>
        <tr>
       <div class="form-group">
        <td class="auto-style1">
            <asp:Button class="btn btn-primary" ID="btn_Ingresar" runat="server" Text="Ingresar" OnClick="btn_Ingresar_Click"  />       
        </td>
        </div>
        </tr>
    <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="usuario" DataSourceID="SqlDataSource1"  AutoGenerateEditButton="True" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Left">
        <Columns>
            <asp:BoundField DataField="usuario" HeaderText="usuario" ReadOnly="True" SortExpression="usuario" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="idEstado" Visible="false" HeaderText="idEstado" SortExpression="idEstado"  />
            <asp:BoundField DataField="idTipo" Visible="false" HeaderText="Tipo" SortExpression="idTipo" />
            <asp:BoundField DataField="password" DataFormatString="******" HeaderText="password" SortExpression="password" />
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
        <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString %>" SelectCommand="SELECT * FROM [usarioes]" UpdateCommand="UPDATE Usuario SET idEstado =@idEstado WHERE usuario = @usuario"></asp:SqlDataSource>
    <br />
     
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString3 %>" SelectCommand="SELECT * FROM [Tipo]"></asp:SqlDataSource>
        <DeleteParameters>
                <asp:Parameter Name="newparameter" />
            </DeleteParameters>
</asp:Content>

