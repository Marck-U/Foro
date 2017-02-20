<%@ Page Title="" Language="C#" MasterPageFile="~/InisioSesion.master" AutoEventWireup="true" CodeFile="comentaPost.aspx.cs" Inherits="comentaPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h1>Comentario Post</h1>
    <style type="text/css">
        .auto-style1 {
            width: 139px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <div class="form-group">
            <div class="input-group">
                 <td ><label class="form-label" for="input-email">Comentario</label></td>   
                <td ><asp:TextBox ID="txtSearch"  class="form-input" runat="server" Height="19px" ></asp:TextBox></td>
            </div></div>
        </tr>
        <tr>
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="codigoTxt" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <PagerSettings FirstPageText="Firt Page" LastPageText="Last Page" Mode="NextPreviousFirstLast" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ForoConnectionString %>" SelectCommand="ComentarioPost" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="Codigo" Name="codigo" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource> 
        </tr>
        <tr>
             <div class="form-group">
            <td class="auto-style1">
            <asp:Button class="btn btn-primary" ID="Button2" runat="server" 
                Text="Comentar" OnClick="Button2_Click" />
                <asp:Label ID="lbl_nombre" runat="server" Text=""></asp:Label>
            </td>
           </div>
        </tr>
        
    </table>
     
</asp:Content>

