<%@ Page Title="" Language="C#" MasterPageFile="~/MasterInicio.master" AutoEventWireup="true" CodeFile="InicioS.aspx.cs" Inherits="InicioS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h1>Inicio de sesion</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-group">
    <label class="form-label" for="input-email">Usuario</label>
    <div class="input-group">
      <span class="input-group-addon"></span>
      <asp:TextBox  runat="server" type="text" class="form-input" placeholder="Ingrese su nombre de usuario" id="txtUsuario"></asp:TextBox>
    </div>
  </div>
    <div class="form-group">
    <label class="form-label" for="input-email">Password</label>
    <div class="input-group">
      <span class="input-group-addon"></span>
      <asp:TextBox  runat="server" type="password" class="form-input" placeholder="Ingrese su contraseña" id="txtPass"></asp:TextBox>
    </div>
  </div>
    <div class="form-group">
       <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Ingresar" OnClick="Button1_Click" />
        <asp:Label ID="lbl_mensaje" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

