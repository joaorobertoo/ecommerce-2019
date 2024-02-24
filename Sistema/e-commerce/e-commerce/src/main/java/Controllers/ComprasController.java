package Controllers;

import DAO.DAOCompra;
import DAO.DAOProduto;
import Mapeamentos.Compra;
import Mapeamentos.Produto;
import Mapeamentos.Usuario;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ComprasController {

    @RequestMapping("compraProdutos")
    public String CarregaCompraProdutos(Model model,
            @RequestParam(value = "codigo") String codigo) {
        DAOProduto dao = new DAOProduto();

        model.addAttribute("Produto", dao.buscarPeloCodigo(codigo));
        return "compraProdutos";
    }

    @RequestMapping(value = "realizarCompra")
    public String salvarProduto(@RequestParam(value = "quantidade") int quantidade,
            @RequestParam(value = "preco") double preco,
            @RequestParam(value = "codigo") String codigo,
            @ModelAttribute("Compra") Compra compra, HttpSession session, Model model,
            @ModelAttribute("Usuario") Usuario usuario) throws IOException {

        compra.setQuantidadeCompra(quantidade);
        compra.setValor(new BigDecimal(preco*quantidade).setScale(2,BigDecimal.ROUND_HALF_DOWN));
        
        Date x = new Date();

        compra.setDataCompra(x);

        DAOProduto dao2 = new DAOProduto();
        Produto prod = dao2.buscarPeloCodigo(codigo);
        compra.setProduto(prod);

        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        compra.setUsuario(usuarioLogado);

        if (usuarioLogado != null) {
            DAOCompra dao1 = new DAOCompra();
            if (prod.getQuantidadeProduto() < quantidade) {
                String mensagem = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Quantidade insuficiente no estoque!!!\n"
                    + "            </div>";
                model.addAttribute("mensagemCompra", mensagem);

                model.addAttribute("Produto", dao2.buscarPeloCodigo(codigo));
                return "compraProdutos";

            } else {

                if (dao1.registrarCompra(compra)) {
                    int novaQuantidade = prod.getQuantidadeProduto() - quantidade;
                    prod.setQuantidadeProduto(novaQuantidade);
                    dao2.atualizarEstoque(prod);
                    String mensagem = "<div class=\"alert alert-success alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Compra efetuada com sucesso!!!\n"
                    + "            </div>";
                    model.addAttribute("mensagemCompra", mensagem);
                    model.addAttribute("Produto", dao2.buscarPeloCodigo(codigo));
                    return "historicoDeCompras";

                } else {
                    String mensagem = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Falha na compra!!!\n"
                    + "            </div>";
                model.addAttribute("mensagemCompra", mensagem);
                    model.addAttribute("Produto", dao2.buscarPeloCodigo(codigo));
                    return "compraProdutos";
                }

            }
        }else {
                String mensagem = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Efetue o login para comprar!!!\n"
                    + "            </div>";
                model.addAttribute("mensagemCompra", mensagem);

                model.addAttribute("Produto", dao2.buscarPeloCodigo(codigo));
                return "compraProdutos";
            }
        
    }

    @RequestMapping("historicoDeCompras")
    public String CarregaHistoricoDeCompras(Model model) {
        DAOCompra dao = new DAOCompra();

        return "historicoDeCompras";
    }

    @RequestMapping("grid2")
    public @ResponseBody
    String grid2(HttpSession session) {
        List<Compra> listaCompras;
        String tmp;
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");
        DAOCompra dao = new DAOCompra();
        listaCompras = dao.obterCompras(usuarioLogado.getCpf());//funcao dao obter todas as compras pelo cpf
        JSONArray json = new JSONArray();
        Map<String, String> data = new HashMap<>();
        for (int i = 0; i < listaCompras.size(); i++) {
            data.put("nomeProduto", listaCompras.get(i).getProduto().getNomeProduto() + "");
            data.put("nomeCategoria", listaCompras.get(i).getProduto().getCategoria().getNomeCategoria() + "");
            data.put("quantidadeCompra", listaCompras.get(i).getQuantidadeCompra() + "");
            data.put("valor", listaCompras.get(i).getValor() + "");
            data.put("dataCompra", listaCompras.get(i).getDataCompra() + "");
            data.put("idCompra", listaCompras.get(i).getIdCompra() + "");
            data.put("visualizar", "<a class='btn btn-primary' href='visualizarCompra?idCompra=" + listaCompras.get(i).getIdCompra() + "'>Visualizar Compra</a>");//acertar o href com pagina de visualizar a compra mandando o id
            json.put(data);
        }
        tmp = "{\"data\":" + json.toString() + "}";
        return tmp;
    }

    @RequestMapping("visualizarCompra")
    public String CarregaVisualizarCompra(Model model,
            @RequestParam(value = "idCompra") int idCompra) {
        DAOCompra dao = new DAOCompra();

        model.addAttribute("Compra", dao.buscarCompraPeloId(idCompra));
        return "visualizarCompra";
    }
}
