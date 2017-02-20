<%@ Page Title="" Language="C#" MasterPageFile="~/InisioSesion.master" AutoEventWireup="true" CodeFile="CreaPost.aspx.cs" Inherits="CreaPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h1>Creador Post</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Titulo del post"></asp:Label></td>
            <td><asp:TextBox  runat="server" type="text" class="form-input"  id="txt_titulo"></asp:TextBox></td>
        </tr>
            <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Contenido"></asp:Label></td>
            <td><asp:TextBox class="form-input"  runat="server" id="txt_comentario" rows="4" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Categoria"></asp:Label></td>
            <td><asp:DropDownList  class="form-input" ID="drop_Categoria" runat="server" DataSourceID="SqlDataSource1" DataTextField="Categoria" DataValueField="idCategoria"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString %>" SelectCommand="SELECT * FROM [Categoria]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Autor"></asp:Label></td>
            <td><asp:TextBox  runat="server" type="text" class="form-input"  id="txt_autor"></asp:TextBox></td>
        </tr>
        <tr>
            <div class="form-group">
            <td colspan="3">
                <asp:Button class="btn btn-primary" ID="btn_Ingresar" runat="server" Text="Crear" OnClick="btn_Ingresar_Click"/>
                <asp:Label ID="lbl_mensaje" runat="server"></asp:Label>
            </td>
            </div>
        </tr>
    </table>
</asp:Content>

