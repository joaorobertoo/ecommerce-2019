package Controllers;

import DAO.DAOCompra;
import DAO.DAOProduto;
import Mapeamentos.Compra;
import Mapeamentos.Produto;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProdutosController {

    @RequestMapping("cadastroProdutos")
    public String CarregaCadastroProdutos(Model model) {
        model.addAttribute("Produto", new Produto());
        return "cadastroProdutos";
    }

    @RequestMapping("editarProdutos")
    public String CarregaEditarProdutos(Model model,
            @RequestParam(value = "codigo") String codigo) {
        DAOProduto dao = new DAOProduto();

        model.addAttribute("Produto", dao.buscarPeloCodigo(codigo));
        return "editarProdutos";
    }

    @RequestMapping("excluirProdutos")
    public String CarregaExcluirProdutos(Model model,
            @RequestParam(value = "codigo") String codigo) {
        DAOProduto dao = new DAOProduto();
        DAOCompra dao3 = new DAOCompra();
        model.addAttribute("Produto", new Produto());
        model.addAttribute("Compra", new Compra());

        List<Compra> compras;
        compras = dao3.buscarCompraPeloCodigo(codigo);
        if (!compras.isEmpty()) {
            String msg = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Produto já foi comprado!!!Não foi possível excluir!!!\n"
                    + "            </div>";
            model.addAttribute("falhaNaExclusao", msg);
            return "listaProdutos";
        } else {
            Produto produto = dao.buscarPeloCodigo(codigo);
            dao.deletar(produto);
            String msg = "<div class=\"alert-group alert alert-success alert-dismissable\">\n"
                    + "                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                    Produto excluído com sucesso!!!             \n"
                    + "                </div>";
            model.addAttribute("sucessoExclusao", msg);

            return "listaProdutos";
        }
    }

    @RequestMapping("listaProdutos")
    public String CarregaListaProdutos(Model model) {
        return "listaProdutos";
    }

    @RequestMapping(value = "salvarProduto")
    public String salvarProduto(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = "preco") double preco, Model model,
            @ModelAttribute("Produto") Produto produto) throws IOException {

        produto.setImagem(file.getBytes());
        Date x = new Date();

        produto.setDataCadastro(x);

        produto.setPreco(new BigDecimal(preco).setScale(2,BigDecimal.ROUND_HALF_DOWN));

        DAOProduto dao = new DAOProduto();

        Produto prod = dao.verificaCodigo(produto);

        if (prod != null) {
            String str = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Código já existente. Insira outro!!!\n"
                    + "            </div>";
            model.addAttribute("mensagemCodigoDuplicado", str);
            return "cadastroProdutos";
        }
        if (dao.salvarProduto(produto)) {
            String str = "<div class=\"alert-group alert alert-success alert-dismissable\">\n"
                    + "                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                    Produto cadastrado com sucesso!!!             \n"
                    + "                </div>";
            model.addAttribute("prodCadastrado", str);
            return "listaProdutos";
        } else {
            String str = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Código já existente. Insira outro!!!\n"
                    + "            </div>";
            model.addAttribute("mensagemFalha", str);
            return "cadastroProdutos ";
        }
    }

    @RequestMapping(value = "RecuperarImagem", method = RequestMethod.GET)
    public @ResponseBody
    String exibirImagem(
            @RequestParam(value = "codigo") String codigo,
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        response.setContentType("image/jpg");

        byte[] buffer = new byte[1024];
        int bytesread = 0;

        ServletOutputStream out = response.getOutputStream();
        InputStream is;

        DAOProduto dao = new DAOProduto();
        Produto produto = dao.buscarPeloCodigo(codigo);
        if (produto.getImagem() == null) {
            is = request.getSession().getServletContext().getResourceAsStream("produtoSemFoto.png");
            while ((bytesread = is.read(buffer)) != -1) {
                out.write(buffer, 0, bytesread);
            }

        } else {
            is = new ByteArrayInputStream(produto.getImagem());
            while ((bytesread = is.read(buffer)) != -1) {
                out.write(buffer, 0, bytesread);
            }

            out.flush();
        }
        out.close();
        is.close();
        return "imagem;";
    }

    @RequestMapping("grid")
    public @ResponseBody
    String grid() {
        List<Produto> listaProdutos;
        String tmp;
        DAOProduto dao = new DAOProduto();
        listaProdutos = dao.obterProdutos();
        JSONArray json = new JSONArray();
        Map<String, String> data = new HashMap<>();
        for (int i = 0; i < listaProdutos.size(); i++) {
            data.put("codigo", listaProdutos.get(i).getCodigo());
            data.put("nomeCategoria", listaProdutos.get(i).getCategoria().getNomeCategoria());
            data.put("nomeProduto", listaProdutos.get(i).getNomeProduto());
            data.put("quantidadeProduto", listaProdutos.get(i).getQuantidadeProduto() + "");
            data.put("preco", listaProdutos.get(i).getPreco() + "");
            data.put("editar", "<a class='btn btn-primary' href='editarProdutos?codigo=" + listaProdutos.get(i).getCodigo() + "'>Editar</a>"
                    + " " + "<a class='btn btn-danger' href='excluirProdutos?codigo=" + listaProdutos.get(i).getCodigo() + "'>Excluir</a>");
            json.put(data);
        }
        tmp = "{\"data\":" + json.toString() + "}";
        return tmp;
    }

    @RequestMapping("filtrarPorCategoria")
    public @ResponseBody
    String filtrarPorCategoria(@RequestParam(value = "categorias") String categorias) {
        List<Produto> produtos;
        DAOProduto dao = new DAOProduto();
        if (categorias == "") {
            produtos = dao.obterProdutos();
        } else {
            produtos = dao.obterPelaCategoria(categorias);

        }

        JSONArray json = new JSONArray();
        Map<String, String> data = new HashMap<>();
        for (int i = 0; i < produtos.size(); i++) {
            data.put("codigo", produtos.get(i).getCodigo());
            data.put("nomeCategoria", produtos.get(i).getCategoria().getNomeCategoria());
            data.put("nomeProduto", produtos.get(i).getNomeProduto());
            data.put("quantidadeProduto", produtos.get(i).getQuantidadeProduto() + "");
            data.put("preco", produtos.get(i).getPreco() + "");
            json.put(data);
        }
        String tmp = "{\"data\":" + json.toString() + "}";
        return tmp;
    }

    @RequestMapping("editarProduto")
    public String editarUsuario(@ModelAttribute("Usuario") Produto produto,
            @RequestParam(value = "file", required = false) MultipartFile file,
            Model model) throws IOException {
        DAOProduto dao = new DAOProduto();

        Produto prod = dao.buscarPeloCodigo(produto.getCodigo());

        if (file.isEmpty()) {
            produto.setImagem(prod.getImagem());
        }
        else{
            produto.setImagem(file.getBytes());
        }
        Date x = new Date();

        produto.setDataCadastro(x);

//        String str1 = new String(produto.getImagem(), StandardCharsets.UTF_8);
//        System.out.println("array=="+str1);
        if (dao.salvarProduto(produto)) {

            String mensagem = "<div class=\"alert-group alert alert-success alert-dismissable\">\n"
                    + "                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                    Produto editado com sucesso!!!             \n"
                    + "                </div>";
            model.addAttribute("sucessoEdicao", mensagem);
            return "listaProdutos";
        } else {
            String str = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Falha na edição!!!\n"
                    + "            </div>";
            model.addAttribute("mensagemFalhaEdicao", str);
            return "editarProdutos";
        }

    }

}
