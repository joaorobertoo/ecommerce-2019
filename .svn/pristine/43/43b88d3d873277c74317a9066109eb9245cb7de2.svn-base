/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Mapeamentos.Categoria;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author admingbd
 */
public class DAOCategoria extends DAOGenerico<Categoria, BigDecimal>{
    
    public List<Categoria> retornaCategorias(){
        Session s = this.getSession();
        List<Categoria> listaCategorias = null;
        
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Categoria");
            listaCategorias = findMany(q);
            s.close();
        }
        catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
                
        return listaCategorias;
    }
}
