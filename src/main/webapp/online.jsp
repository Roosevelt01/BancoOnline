<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banco de Venezuela</title>
    </head>
    <body>

        <style>
            body{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin: 0 auto;
            }

            a{
                text-decoration: none;
            }

            span{
                color:red;
            }
        </style> 


        <h1>Bienvenido(a) a la banca en línea, <%= session.getAttribute("usuario")%></h1>
        <h2>Tu contraseña es: <span><%=session.getAttribute("contraseña")%></span></h2>
        <h2>Selecciona una opción:</h2>
        <ul>

            <li>
                <a href="#" onclick="mostrarFormularioDeposito()">Depositar dinero</a>
                <form id="formulario-deposito" action="/BancoOnline/Transfer" method="post" style="display: none;">
                    <input type="hidden" name="accion" value="depositar">
                    Monto a depositar: <input type="number" name="monto" required>
                    <input type="submit" value="Depositar">
                </form>
            </li>
            <li>
                <a href="#" onclick="mostrarFormularioRetiro()">Retirar dinero</a>
                <form id="formulario-retiro" action="/BancoOnline/Transfer" method="post" style="display: none;">
                    <input type="hidden" name="accion" value="retirar">
                    Monto a retirar: <input type="number" name="monto" required>
                    <input type="submit" value="Retirar">
                </form>
            </li>
            <li>
                <a href="#" onclick="mostrarFormularioSaldo()">Ver saldo</a>
                <form id="formulario-saldo" action="/BancoOnline/Transfer" method="post" style="display: none;">
                    <input type="hidden" name="accion" value="saldo">
                    <input type="submit" value="Ver saldo">
                </form>
            </li>
            <li>
                <a href="#" onclick="mostrarFormularioTransferencia()">Transferir dinero</a>
                <form id="formulario-transferencia" action="/BancoOnline/Transfer" method="post" style="display: none;">
                    <input type="hidden" name="accion" value="transferir">
                    Monto a transferir: <input type="number" name="monto" required><br>
                    Cuenta destino: <input type="text" name="cuentaDestino" required><br>
                    <input type="submit" value="Transferir">
                </form>
            </li>
        </ul>


        <%
            Double saldo = (Double) session.getAttribute("saldo");
            if (saldo != null) {
        %>
        <h3>Saldo actual: <%= saldo%></h3>
        <%
            }
        %>

        <script>
            var ultimoFormularioMostrado = null;

            function mostrarFormularioDeposito() {
                ocultarFormulario(ultimoFormularioMostrado);
                var formulario = document.getElementById("formulario-deposito");
                formulario.style.display = "block";
                ultimoFormularioMostrado = formulario;
            }

            function mostrarFormularioRetiro() {
                ocultarFormulario(ultimoFormularioMostrado);
                var formulario = document.getElementById("formulario-retiro");
                formulario.style.display = "block";
                ultimoFormularioMostrado = formulario;
            }

            function mostrarFormularioSaldo() {
                ocultarFormulario(ultimoFormularioMostrado);
                var formulario = document.getElementById("formulario-saldo");
                formulario.style.display = "block";
                ultimoFormularioMostrado = formulario;
            }

            function mostrarFormularioTransferencia() {
                ocultarFormulario(ultimoFormularioMostrado);
                var formulario = document.getElementById("formulario-transferencia");
                formulario.style.display = "block";
                ultimoFormularioMostrado = formulario;
            }

            function ocultarFormulario(formulario) {
                if (formulario) {
                    formulario.style.display = "none";
                }
            }
        </script>
    </body>
</html>
