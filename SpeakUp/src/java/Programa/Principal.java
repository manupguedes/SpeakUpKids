package Programa;

import java.sql.Date;
import Classes.Aluno;

public class Principal {

    public static void main(String[] args) {

        Aluno alu = new Aluno();

        /*INCLUSÃO*/
        /*
                alu.setNome_aluno("João Pedro");
		alu.setEmail_aluno("joao_pedro@gmail.com");
		alu.setDataNscAluno(new Date(27032006));
		alu.setUsu_aluno("jp_27");
		alu.setSenha_aluno("27032006");
		
		if (alu.cadastrarAluno()) {
			System.out.println("Aluno incluido com sucesso");
		}else {
			System.out.println("Erro na inclusão");
		}
        /*ALTERAÇÃO*/
                /*alu.setCod_aluno(1);
		alu.setNome_aluno("Daniele Luiza");
		alu.setEmail_aluno("daniLuiza@gmail.com");
		alu.setDataNscAluno(new Date(12082005));
		alu.setUsu_aluno("dani_12");
		alu.setSenha_aluno("12082005");
		
		if (alu.alterarAluno()) {
			System.out.println("Aluno alterado com sucesso");
		}else {
			System.out.println("Erro na alteração");
		}*/
        /*EXCLUSÃO*/
                /*alu.setCod_aluno(1);
		if (alu.excluirAluno()) {
			System.out.println("Aluno excluido com sucesso");
		}else {
			System.out.println("Erro na exclusão");
		}*/
        /*CONSUTAÇÃO*/
                /*alu.setCod_aluno(1);
		alu = alu.consultarAluno();
		if (alu == null) {
			System.out.println("Aluno nao foi Localizado");	
		} else {
			System.out.println("Maticula: " + alu.getCod_aluno());
			System.out.println("Nome: " + alu.getNome_aluno());
			System.out.println("Email: " + alu.getEmail_aluno());
			System.out.println("Data de nascimento: " + alu.getDataNscAluno());
			System.out.println("Usuario: " + alu.getUsu_aluno());
			System.out.println("Senha: " + alu.getSenha_aluno());
			}*/
    }
}
