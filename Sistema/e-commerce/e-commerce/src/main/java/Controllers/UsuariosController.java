package Controllers;

import DAO.DAOProduto;
import DAO.DAOUsuario;
import Mapeamentos.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UsuariosController {

    @RequestMapping("cadastroUsuarios")
    public String CarregaCadastro(Model model) {
        model.addAttribute("Usuario", new Usuario());
        return "cadastroUsuarios";
    }

    @RequestMapping("salvarUsuario")
    public String salvarUsuario(@ModelAttribute("Usuario") Usuario usuario, Model model) {
        DAOUsuario dao = new DAOUsuario();
        Usuario user = dao.verificaCpf(usuario);
        Usuario user1 = dao.verificaEmail(usuario);

        if (user != null) {

            String mensagem = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Cpf já existente!!!\n"
                    + "            </div>";
            model.addAttribute("falhaCadastro", mensagem);
            return "cadastroUsuarios";
        }

        if (user1 != null) {
            String mensagem = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Email já existente!!!\n"
                    + "            </div>";
            model.addAttribute("falhaCadastro", mensagem);
            return "cadastroUsuarios";
        }

        if (dao.salvarUsuario(usuario)) {

            String mensagem = "<div class=\"alert-group alert alert-success alert-dismissable\">\n"
                    + "                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                    Cadastro efetuado com sucesso!!!             \n"
                    + "                </div>";
            model.addAttribute("sucessoCadastro", mensagem);
            return "login";
        } else {
            String mensagem = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Falha no cadastro!!!\n"
                    + "            </div>";
            model.addAttribute("falhaCadastro", mensagem);
            return "cadastroUsuarios";
        }

    }

    @RequestMapping("login")
    public String CarregaLogin(Model model) {
        model.addAttribute("Usuario", new Usuario());
        return "login";
    }

    @RequestMapping("efetuaLogin")
    public String efetuaLogin(@ModelAttribute("Usuario") Usuario usuario, BindingResult result, HttpSession session, HttpServletRequest request, Model model) {
        DAOUsuario dao = new DAOUsuario();
        Usuario user = dao.buscarLogin(usuario);

        if (user != null) {
            session.setAttribute("usuarioLogado", user);

            if (user.isAdmin()) {
                return "listaProdutos";
            } else {
                return "index";
            }

        } else {
            String mensagem = "<div class=\"alert alert-danger alert-dismissable\">\n"
                    + "                <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                Falha no login!!!\n"
                    + "            </div>";
            model.addAttribute("mensagemLogin", mensagem);
            return "login";
        }
    }

    @RequestMapping("efetuaLogout")
    public String efetuaLogout(@ModelAttribute("Usuario") Usuario usuario, HttpSession session, Model model) {
        session.removeAttribute("usuarioLogado");
        String mensagem = "<div class=\"alert-group alert alert-success alert-dismissable\">\n"
                + "                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                + "                    Logout efetuado com sucesso!!!             \n"
                + "                </div>";
        model.addAttribute("sucessoLogout", mensagem);
        return "index";
    }

    @RequestMapping("editarUsuarios")
    public String carregaEditarUsuarios(Model model, HttpSession session,
            @RequestParam(value = "cpf") String cpf) {
        DAOUsuario dao = new DAOUsuario();
        model.addAttribute("Usuario", dao.buscarPeloCpf(cpf));

        return "editarUsuarios";
    }

    @RequestMapping("editarUsuario")
    public String editarUsuario(@ModelAttribute("Usuario") Usuario usuario, HttpSession session, Model model) {
        DAOUsuario dao = new DAOUsuario();

        boolean admin = usuario.isAdmin();
        if (dao.salvarUsuario(usuario)) {
            if (admin == true) {
                usuario.setAdmin(admin);
            }
            session.removeAttribute("usuarioLogado");
            Usuario user = dao.buscarLogin(usuario);
            session.setAttribute("usuarioLogado", user);

            String mensagem = "<div class=\"alert-group alert alert-success alert-dismissable\">\n"
                    + "                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                    Dados editados com sucesso!!!             \n"
                    + "                </div>";
            model.addAttribute("sucessoEdicao", mensagem);
            return "index";
        } else {
            String mensagem = "<div class=\"alert-group alert alert-success alert-dismissable\">\n"
                    + "                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">×</button>\n"
                    + "                    Dados editados com sucesso!!!             \n"
                    + "                </div>";
            model.addAttribute("erroEdicao", mensagem);
            return "editarUsuarios";
        }

    }
}
