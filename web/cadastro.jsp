<%@page import="DAO.TipoDAO"%>
<%@page import="DAO.CursoDAO"%>
<%@page import="br.ufc.ru.model.Tipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <h3>Cadastrar</h3>
        <%
            Tipo t = new Tipo();
            t.setNome("Aluno");
            t.setValorRefeicao(1.10);
            TipoDAO.gravar(t);
            
            Tipo t2 = new Tipo();
            t2.setNome("Servidor Docente");
            t2.setValorRefeicao(2.20);
            TipoDAO.gravar(t2);
            
            
            CursoDAO.gravar("Engenharia de Software");
            CursoDAO.gravar("Engenharia Civil");
            CursoDAO.gravar("Engenharia Mecanica");
            CursoDAO.gravar("Engenharia de Produção");
            CursoDAO.gravar("Ciencia da Computação");
        %>
        <form action="cadastro.jsp">
            Nome Completo: <input type="text" name="nome"><br>
            Matricula: <input type="text" name=" matricula"><br>
            Categoria: <select name="categoria">
                            <% for(Tipo t1: DAO.TipoDAO.getTipos()){ %>
                            <option>
                                <%=t1.getNome()%>
                            </option>
                            <%}%>
                       </select><br>
            <%if(request.getParameter("categoria") != null && request.getParameter("categoria").isEmpty()!= true){
                out.print("<select>");
                    for(String curso : CursoDAO.getCursos()){
                        out.print("<option>"+curso+"</option>");
                    }
                out.print("</select><br>");
            }
            %>
            Senha: <input type="password" name="senha">
            <input type="submit" name="salvar" value="Salvar">
        </form>
    </body>
</html>
