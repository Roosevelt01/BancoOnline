
package bean;

import javax.servlet.annotation.WebServlet;


public class AccountBank {
    private double saldo=2000;

    public void depositar(double monto) {
        saldo += monto;
    }

    public void retirar(double monto) {
        saldo -= monto;
    }

    public double verSaldo() {
        return saldo;
    }

    public void transferir(double monto, AccountBank cuentaDestino) {
        if (saldo >= monto) {
            saldo -= monto;
            cuentaDestino.depositar(monto);
        }
    }
}
