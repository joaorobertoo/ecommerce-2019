
package DAO;

import Mapeamentos.Produto;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import static javassist.CtMethod.ConstParameter.string;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;


public class DAOProduto extends DAOGenerico<Produto, BigDecimal>{
    
    public boolean salvarProduto(Produto produto) {
        Session s = this.getSession();
        try {
            s.beginTransaction();
            this.save(produto);
            s.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
            return false;
        }
    }
    
    

    public Produto buscarPeloCodigo(String codigo) {
        Session s = this.getSession();
        Produto prod = null ;
        
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Produto where codigo=:codigo");
            q.setString("codigo",codigo);
            prod = findOne(q);
            s.close();
        }catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
        return prod;
    }
    
    public List<Produto> obterProdutos(){
        Session s = this.getSession();
        List<Produto> produtos=null;
        
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Produto order by nomeProduto ASC");
            produtos = findMany(q);
            s.close();
        }catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
        return produtos;
    }
    
    public boolean deletar(Produto produto){
        Session s = this.getSession();
        
        try{
            s.beginTransaction();
            this.delete(produto);
            
            s.getTransaction().commit();
            
            return true;
        }catch(HibernateException e){
            s.getTransaction().rollback();
            
            return false;
        }
    }
    
        public List<Produto> selecionarProdutosRecentes(){
        Session s = this.getSession();
        List<Produto> produtos = null;
        
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Produto order by dataCadastro DESC");
            q.setMaxResults(6);
            produtos = findMany(q);
            s.close();
        }catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
        return produtos;
    }
        
    public List<Produto> obterPelaCategoria(String categorias){
        Session s = this.getSession();
        List<Produto> produtos = null;
        List<String> list = new ArrayList (Arrays.asList(categorias.split(",")));
        List<Integer> cats = new ArrayList<Integer>() ;
        for (String str : list){
            System.out.println("teste: "+str);
            cats.add(Integer.parseInt(str));        
        }
        try{
            s.beginTransaction();
            Query q = s.createQuery("from Produto where categoria.idCategoria in (:categorias)");
            q.setParameterList("categorias", cats);
            produtos = findMany(q);           
            s.close();
            
        }catch(HibernateException e){
            e.printStackTrace();
            s.close();
        }
        return produtos;
    }
    
    public boolean atualizarEstoque(Produto prod){
        Session s = this.getSession();
        try {
            s.beginTransaction();
            this.merge(prod);
            s.getTransaction().commit();
            return true;
        } catch (HibernateException e) {
            s.getTransaction().rollback();
            return false;
        }
    }
    
    public Produto verificaCodigo(Produto produto) {
        Session s = this.getSession();
        Produto prod = null;
        try {
            s.beginTransaction();
            Query q = s.createQuery("from Produto where codigo=:codigo");
            q.setString("codigo", produto.getCodigo());
            prod = findOne(q);
            s.close();
        } catch (HibernateException e) {
            e.printStackTrace();
            s.close();
        }
        return prod;
    }
    
}
