
package DAO;

import Mapeamentos.Compra;
import Mapeamentos.Produto;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class DAOCompra extends DAOGenerico<Compra, BigDecimal>{
    
    public boolean registrarCompra(Compra compra) {
        Session s = this.getSession();
        try {
            s.beginTransaction();
            this.save(compra);
            s.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
            return false;
        }
    }
    
    public List<Compra> obterCompras(String cpf){
        Session s = this.getSession();
        List<Compra> compras = null;
        
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Compra where cpf=:cpf order by dataCompra DESC");
            q.setString("cpf",cpf);
            compras = findMany(q);
            s.close();
        }catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
        return compras;
    }

    public Compra buscarCompraPeloId(int idCompra) {
        Session s = this.getSession();
        Compra compra = null ;
        
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Compra where idCompra=:idCompra");
            q.setInteger("idCompra",idCompra);
            compra = findOne(q);
            s.close();
        }catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
        return compra;
    }
    
    public List<Compra> buscarCompraPeloCodigo(String codigo){
        Session s = this.getSession();
        List<Compra> compras = null;
        
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Compra where codigo=:codigo");
            q.setString("codigo",codigo);
            compras = findMany(q);
            s.close();
        }catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
        return compras;
    
    }
}
