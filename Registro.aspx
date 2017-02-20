<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.master" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h1>Registro de Usuario</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-group">
        <label class="form-label" for="input-name">Usuario</label>
        <asp:TextBox class="form-input" runat="server" type="text" id="txt_usuario" placeholder="Ingrese su nombre de usuario"></asp:TextBox> 
  </div>

    <div class="form-group">
        <label class="form-label" for="input-email">Nombre</label>
        <asp:TextBox class="form-input" runat="server" type="text" id="txt_nombre" placeholder="Ingrese su nombre"></asp:TextBox> 
    </div>

  <div class="form-group">
    <label class="form-label" for="input-email">Password</label>
    <div class="input-group" style="z-index: auto;  text-align: center" >
       <asp:TextBox  runat="server" type="password" class="form-input" placeholder="Ingrese su contraseña" id="txt_pass"></asp:TextBox> 
    </div>
  </div>
    <div class="form-group">
        <asp:Button class="btn btn-primary" ID="btn_Ingresar" runat="server" Text="registro" OnClick="btn_Ingresar_Click1" />       
    </div>
    <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
</asp:Content>

